#!/usr/bin/env perl
use v5.35;
use List::Util qw(sum);
my $curr = 0;
my $topN = 3;
my @max = (0) x $topN;
while (<>) {
	if ($_ ne "\r\n") {
		$curr += $_;
	} else {
		push @max, $curr;
		@max = (sort { $a <=> $b } @max)[1..3];
		$curr = 0;
	}
}
say sum @max;
