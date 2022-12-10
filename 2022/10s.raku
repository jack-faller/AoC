#!/usr/bin/env raku
say sum (0..5).map(* * 40 + 20).map({ $^a * (1 + sum $_[0..$^a - 2]) }) with (m/.*?("-"?\d+)/ ?? (0, $0) !! S/noop/0/ for lines).flat;
