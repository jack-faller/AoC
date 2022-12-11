#!/usr/bin/env raku
($1 + ($1 - $0) % 3 * 3 if TR/ABCXYZ/012123/ ~~ /(.).(.)/ for lines).sum.say;
