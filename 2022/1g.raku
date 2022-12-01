#!/usr/bin/env raku
say [+] $*ARGFILES.split(/\n\n/).map({ [+] .lines }).sort[*-3..*];