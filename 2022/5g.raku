#!/usr/bin/env raku
my (@x, @l);
(@x[$_[0]].push($_[1]) if $_[1] ne " " for (0..*) Z .comb(4)».substr(1, 1)) if m/"]"/ for reverse @l = lines;
(@x[$2 - 1].append(@x[$1 - 1][*-$0..*]); @x[$1 - 1].pop for ^$0) if m/move.(\d+).*?(\d+).*?(\d+)/ for @l;
say @x»[*-1].join;
