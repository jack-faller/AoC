#!/usr/bin/env perl
use v5.35;
my $x = 0;
while (<>) { tr/ABCXYZ/012123/; $x += $2 + ($2 - $1) % 3 * 3 if m/(.) (.)/; }
say $x;
