#!/usr/bin/env raku
$*ARGFILES.split(/\n\n/)».lines».sum.sort[*-3..*].sum.say;
