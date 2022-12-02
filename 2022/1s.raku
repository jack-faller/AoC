#!/usr/bin/env raku
$*ARGFILES.split(/\n\n/)».lines».sum.max.say;
