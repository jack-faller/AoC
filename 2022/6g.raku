#!/usr/bin/env raku
say 14 + ([Z] lines[0].comb[(0..13) »..» *])».Set.first(*.elems == 14, :k);
