#!/usr/bin/env raku
my ($tail, $head, $poss) = (0, 0, (0i).SetHash);
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
	$poss.set($tail = step($tail, $head).Complex);
  }
}
say $poss.elems;
