#!/usr/bin/env perl6
say 14 + ([Z] lines[0].comb[map { $_..* }, 0..13])».Set.first(*.elems == 14, :k);
