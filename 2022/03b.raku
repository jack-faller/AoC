#!/usr/bin/env raku
say [+] map (*.keys.ord - 38) % 58, [Z∩] [Z] lines.batch(3)».comb;
