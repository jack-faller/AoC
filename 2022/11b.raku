#!/usr/bin/env perl6
my @monkeys;
my $fulldiv;
sub ifold(Int:D $a, Int:D $b --> Int) { $a == -1 ?? $b !! $a }
class Monkey {
  has Int @.items;
  has &.operation;
  has Int @.args;
  has Int $.divisor;
  has Int @.targets;
  has Int $.throws is rw = 0;
  method turn(::CLASS:D:) {
    $.throws += @.items.elems;
    for @.items {
	  my $new = $fulldiv R% (self.operation)((ifold @.args[0], $_), (ifold @.args[1], $_));
	  @monkeys[@.targets[$new %% $.divisor]].items.push($new);
    }
	@.items = [];
  }
}
for $*ARGFILES.split("\n\n")».lines {
  my @a = $_;
  my @items = @a.grep(/Starting.items:/).comb(/\d+/)».Int;
  @a.grep(/Operation:/) ~~ m:s/new \= (\S+) (\S) (\S+)/;
  my @args = ($0, $2)».subst(/old/, -1)».Int;
  my &operation = do given $1 {
    when "*" { &infix:<*> }
    when "+" { &infix:<+> }
  };
  my $divisor = @a.grep(/Test:/).comb(/\d+/)[0].Int;
  my @targets = do @a.grep(/If.$_:/).comb(/\d+/)[0].Int for ("false", "true");
  @monkeys[@a[0].comb(/\d+/)] = Monkey.new(:@items, :&operation, :@args, :$divisor, :@targets);
}
$fulldiv = [*] @monkeys».divisor;
(.turn for @monkeys) for ^10000;
say [*] @monkeys».throws.sort[*-2..*];