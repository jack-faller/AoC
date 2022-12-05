#!/usr/bin/env raku
my ($s, $m) = $*ARGFILES.split("\n\n")».lines;
$s = ([Z] $s».comb)».join».trim».flip».comb.batch(4)»[1]»[1..*]».Array;
($s[$2 - 1].append($s[$1 - 1][*-$0..*]); $s[$1 - 1].pop for ^$0) if m/.*?(\d+).*?(\d+).*?(\d+)/ for @$m;
say $s»[*-1].join;
