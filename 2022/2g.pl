#!/usr/bin/env perl
use v5.35;
my $x = 0;
while (<>) { tr/ABCXYZ/234036/; $x += $2 + ($2 / 3 + $1) % 3 + 1 if m/(.) (.)/; }
say $x;
