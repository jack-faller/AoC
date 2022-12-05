#!/usr/bin/env raku
my ($s, $m) = $*ARGFILES.split("\n\n")».lines.map(&reverse);
for 1..$s[0].comb(/\d*/).max {
  my ($x, $y) = ($_, 1);
  for @$m {
    m/.*?(\d+).*?(\d+).*?(\d+)/;
	if $1 == $x {
	  $y += $0;
	}
    if $2 == $x {
	  if $0 >= $y { $x = $1 } else { $y -= $0 }
	}
  }
  ([Z] $s».comb)».join».trim[$x * 4 - 3].substr(* - $y,1).print;
}
