#!/usr/bin/env raku
lines.map({ $1 + ($1 / 3 + $0) % 3 + 1 if TR/ABCXYZ/234036/ ~~ /(.).(.)/ }).sum.say;
