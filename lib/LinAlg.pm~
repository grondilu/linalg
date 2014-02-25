module LinAlg;

subset Vector of Array is export where -> @c {
    [&&] map { $_ ~~ Numeric }, @c 
}
subset Matrix of Array is export where -> @v {
    ([&&] map { $_ ~~ Vector }, @v)
	and all(@v».elems) == @v.pick.elems
};

multi infix:<+>(Vector $a, Vector $b) is export { [ $a Z+ $b ] }
multi infix:<+>(Matrix $a, Matrix $b) is export { [ $a Z+ $b ] }

multi postfix:<t>(Matrix $m) is export {
    my $t;
    for ^@$m X ^@$m[0] -> \i, \j { $t[j][i] = $m[i][j] }
    return $t;
}
multi postfix:<*>(Matrix $m) is export {
    [ map { [ $_».conj ] }, @$m ]t
}

subset Ket of Matrix where *[0].elems == 1;
subset Bra of Matrix where *.elems == 1;

multi infix:<+>(Vector $a, Bra $b) is export { [$a] + $b }
multi infix:<+>(Bra $a, Vector $b) is export { $a + [$b] }
multi postfix:<*>(Vector $a) is export { [$a]* }

multi infix:<*>(Bra $b, Ket $k) is export {
    [+] $b[0] Z* map *[0], @$k
}
multi infix:<*>(Matrix $a, Matrix $b) is export {
    my $c;
    for ^@$a X ^@$b[0] -> \i, \j {
	$c[i][j] = [+] ($a[i][$_] * $b[$_][j] for ^@$a[0])
    }
    return $c;
}
multi infix:<*>(Bra $a, Vector $b) is export { $a * [$b] }
multi infix:<*>(Vector $a, Matrix $b) is export { [$a] * $b }

# vim: ft=perl6
