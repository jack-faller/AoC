#!/usr/bin/env raku
lines.map({ $1 + ($1 - $0) % 3 * 3 if TR/ABCXYZ/012123/ ~~ /(.).(.)/ }).sum.say;
