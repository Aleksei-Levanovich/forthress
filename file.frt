: inc 1 + ;
: dec 1 - ; 
: inc-second swap inc swap ;

: forth-el
 >r swap >r swap r> -rot r> swap ;
: -forth-el
 -rot >r >r swap r> r> ;
 
: =0 0 = if 1 else 0 then ;
: >0 0 > if 1 else 0 then ;
: <0 0 < if 1 else 0 then ;
: >=0 0 >= if 1 else 0 then ;
: <=0 0 <= if 1 else 0 then ;

: parity 2 % if ." нечетное" else ." четное" then ;

: prime dup 2 = if ." ПРОСТОЕ" 1 else 0 swap dup 2 do dup r@ % if else swap 1 + swap then loop swap if ." СОСТАВНОЕ" 0 else  ." ПРОСТОЕ" 1 then then ;

: alloc 8 allot dup rot swap ! ;

: string-length 
	0 swap ( counter str ) 
	repeat inc-second dup c@ not inc-second
	until 
	drop
	dec ;
	
: string-concat 				( str1 str2 )
	dup string-length			( str1 str2 str2len )
	rot dup string-length 		( str2 str2len str1 str1len )
	rot over + inc 				( str2 str1 str1len fullLen )
	heap-alloc 					( str2 str1 str1len addr )
	dup forth-el string-copy 	( str2 str1Len addr )
	dup rot + rot string-copy 	( addr )
	@ dup emit
	;

: radical
 dup =0 if drop 0 else 
	1 swap dup 2 / inc 2	( for [int i=2;i<n/2 + 1;++i]) ( 1 n n/2 2)
	do ( result n )
		dup r@ % not if 	( if n%i==0 )
						r@ prime if 
									swap r@ * swap 
								then
					then
	loop
	drop	
 then ;
