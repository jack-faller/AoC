#!/usr/bin/env raku
say (so [∩] [Z..] [Z] .comb(/\d+/)».Int.batch(2) for lines).sum;
