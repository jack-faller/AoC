#!/usr/bin/env raku
say [+] map { (([∩] .comb.batch(.chars +> 1)).keys.ord - 38) % 58 }, lines;
