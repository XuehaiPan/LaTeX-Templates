#!/usr/bin/perl 

use strict; 
use warnings;

for (1..99) { print $_." Luftballons\n"; }

# This is a commented line

my $string = "Hello World!";

print $string."\n\n";

$string =~ s/Hello/Goodbye Cruel/;

print $string."\n\n";

finale();

exit;

sub finale { print "Fin.\n"; }