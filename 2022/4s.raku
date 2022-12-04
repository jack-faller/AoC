#!/usr/bin/env raku
say lines.map({ so ([|] .cache) ⊆ [∩] $_ with [Z..] [Z] .comb(/\d+/)».Int.batch(2) }).sum;
