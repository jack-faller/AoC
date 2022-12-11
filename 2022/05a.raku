#!/usr/bin/env raku
my ($s, $m) = $*ARGFILES.split("\n\n")».lines;
$s = ([Z] $s».comb)».join».trim».flip».comb.batch(4)»[1]»[1..*]».Array;
for $m».split(" ") -> $A { $s[$A[5] - 1].push($s[$A[3] - 1].pop) for ^$A[1] }
say $s»[*-1].join;
