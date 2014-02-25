Linear Algebra for Perl 6

This module provides basic linear algebra operations, such as vector addition and
hermitian matrix operations.  This module really intends to be basic:  for advanced
linear algebra a full use of PDL should be prefered.

=begin SYNOPSIS

    use LinAlg;

    # the modules defines vectors as a subset of Array,
    # so no instantiation is needed.

    my $a = [ 1, 0, 0 ];
    my $b = [ 0, 1, 0 ];

    say $a + $b;  # [ 1, 1, 0 ];

    say $a * $b;    # error:  wrong dimensions

    # hermitian conjugate is done with C<*> as a postfix operator.
    say $a*;        # [ [1],
                        [0],
                        [0] ]

    # Matrix or vector multiplication is done with C<*> as an infix operator.
    # Remember to always surround infix operators with a whitespace.
    say $a* * $b;   # [ [0, 1, 0]
                    #   [0, 0, 0]
                    #   [0, 0, 0] ]

    # scalar product is a special case of matrix multiplication
    say $a * $b*;   #  0

    say [1, 1, 1] * [1, 1, 1]*;   # 1.4142135623731

=end SYNOPSIS


=for WARNING
This module defines hermitian conjugation as a * postfix operator.  As a result
it is pretty much mandatory to put spaces around * whenever you want to use it
as an infix operator.  Putting spaces around infix operators is considered as a
best practice in Perl6 anyway, but with this module an error will almost
certainly occur if you don't.

=for LICENSE
see LICENSE file
