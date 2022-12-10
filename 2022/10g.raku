#!/usr/bin/env raku
my @arr = (m/.*?("-"?\d+)/ ?? (0, $0) !! S/noop/0/ for lines).flat;
say (^(40 * 6)).map({ my $j = (0..2) + sum @arr[0..$_ - 1]; $_ % 40 ~~ $j ?? "#" !! "." }).batch(40)».join.join("\n");
