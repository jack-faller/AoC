#!/usr/bin/env raku
lines.map({ [∩] .comb.batch(.chars +> 1) })».keys.flat.map((*.ord - 38) % 58).sum.say;
