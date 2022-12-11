#!/usr/bin/env raku
my $b = 0;
my @a = lines».comb;
for 1..@a-2 -> $i {
  for 1..@a[0]-2 -> $j {
    my ($a, $tmp) = (@a[$i; $j], 1);
    for @a[$i][$j+1..*-1],
     @a[$i+1..*-1; $j],
     @a[$i][0..$j-1].reverse,
     @a[0..$i-1; $j].reverse {
	   my $q;
	   for $_ {
	    ++$q;
		last if $_ >= $a;
      }
	  $tmp *= $q;
    }
    $b = max $b, $tmp;
  }
}
say $b;
