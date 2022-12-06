#!/usr/bin/env raku
say 14 + ([Z] lines.comb[(0..13) »..» *])».Set.first(*.elems == 14, :k);
#general solution
# say $_ + ([Z] lines.comb[(0..^$_) »..» *])».Set.first(*.elems == $_, :k) with N;
