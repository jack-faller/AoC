#!/usr/bin/env raku
say lines.map({ so [∩] [Z..] [Z] .comb(/\d+/)».Int.batch(2) }).sum;
