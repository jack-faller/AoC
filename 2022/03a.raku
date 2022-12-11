#!/usr/bin/env raku
say [+] ((([∩] .comb.rotor(.chars / 2)).keys.ord - 38) % 58 for lines);
