#!/usr/bin/env raku
my ($head, $poss) = (0, (0i).SetHash);
my @tail = 0 xx 9;
multi roundup(Real:D $i) { $i.sign * ceiling $i.abs }
multi roundup(Complex:D $c) { Complex.new(roundup($c.re), roundup($c.im)) }

sub step($point, $dest) {
  my $diff = $dest - $point;
  my $abs = $diff.abs;
  $abs >= 2 ?? $point + roundup $diff / $diff.abs !! $point;
}

for (lines) {
  m/(.).(\d+)/;
  my $move = TR/UDLR/ -- / ~ $1 ~ TR/UDLR/ii  / with $0; 
  my $unit = $move / $move.abs; 
  for ^$move.abs {
    $head += $unit;
    my $dest = $head;
    for @tail Z ^@tail -> ($elt, $i) {
      $dest = @tail[$i] = step($elt, $dest);
	  LAST { $poss.set($dest.Complex); }
    }
  }
}
say $poss.elems;
