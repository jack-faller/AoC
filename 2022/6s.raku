#!/usr/bin/env raku
say 4 + ([Z] lines[0].comb[(0..3) »..» *])».Set.first(*.elems == 4, :k);
