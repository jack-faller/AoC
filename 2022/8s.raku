#!/usr/bin/env raku
my @a = lines».comb;
for ((1..@a-2) X (1..@a-2)) -> ($i, $j) {
  $/ += so @a[$i; $j] > (@a[$i; 0..$j-1], @a[$i][$j+1..*-1], @a[0..$i-1; $j], @a[$i+1..*-1; $j]).map(&max).any;
}
say $/ + @a * 2 + @a[0] * 2 - 4;
