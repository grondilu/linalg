use Test;
use LinAlg;

my $a = [ rand xx 3 ];
my $b = [ rand xx 3 ];

is $a + $b, [ $a Z+ $b ], "Vector addition";
is $a * $b*, ([+] $a Z* $b».conj), "scalar product";

# vim: ft=perl6
