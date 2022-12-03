#!/usr/bin/env raku
say [+] map { (([∩] .comb.rotor(.chars / 2)).keys.ord - 38) % 58 }, lines;
