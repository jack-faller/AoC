#!/usr/bin/env raku
lines.batch(3).map({ [∩] $_».comb })».keys.map((*.ord - 38) % 58).sum.say
