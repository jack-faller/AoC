#!/usr/bin/env perl
use v5.35;
use List::Util qw(sum);
local $/ = "";
say sum ((sort { $b <=> $a } map { sum split } <>)[0..2]);
# perl -M"List::Util qw(sum)" -00 -E <last_line>
