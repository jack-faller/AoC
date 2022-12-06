#!/usr/bin/env perl6
say 4 + ([Z] lines[0].comb[map { $_..* }, 0..3])».Set.first(*.elems == 4, :k);
