#!/usr/bin/env perl6
my @monkeys;
sub ifold($a, $b) { $a eq "old" ?? $b !! $a }
class Monkey {
  has @.items;
  has &.operation;
  has @.args;
  has $.divisor;
  has @.targets;
  has $.throws is rw = 0;
  method turn(::CLASS:D:) {
    $.throws += @.items.elems;
    for @.items {
	  my $new = 3 Rdiv (self.operation)((ifold @.args[0], $_), (ifold @.args[1], $_));
	  @monkeys[@.targets[$new %% $.divisor]].items.push($new);
    }
	@.items = [];
  }
}
for $*ARGFILES.split("\n\n")».lines {
  my @a = $_;
  my @items = @a.grep(/Starting.items:/).comb(/\d+/);
  @a.grep(/Operation:/) ~~ m:s/new \= (\S+) (\S) (\S+)/;
  my @args = ($0, $2)».Str;
  my &operation = do given $1 {
    when "*" { &infix:<*> }
    when "+" { &infix:<+> }
  };
  my $divisor = @a.grep(/Test:/).comb(/\d+/)[0];
  my @targets = do @a.grep(/If.$_:/).comb(/\d+/)[0] for ("false", "true");
  @monkeys[@a[0].comb(/\d+/)] = Monkey.new(:@items, :&operation, :@args, :$divisor, :@targets);
}
(.turn for @monkeys) for ^20;
say [*] @monkeys».throws.sort[*-2..*];