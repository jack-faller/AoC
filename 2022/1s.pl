#!/usr/bin/env perl
use v5.35;
my $max = 0;
my $curr = 0;
while (<>) {
	if ($_ ne "\r\n") {
		$curr += $_;
	} else {
		$max = $curr if $curr > $max;
		$curr = 0;
	}
}
say $max;
