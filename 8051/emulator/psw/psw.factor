! ! Copyright (C) 2013 Joseph Moschini.
! See http://factorcode.org/license.txt for BSD license.
!

USING: accessors arrays io io.encodings.binary io.files
       kernel lexer math math.bitwise models namespaces sequences
       tools.continuations ;
   
IN: intel.8051.emulator.psw

! 7   6   5   4   3   2   1   0
! CY  AC  F0 RS1 RS0  OV  F1  P

TUPLE: psw < model ;


! Create a PSW
: <psw> ( value -- psw )
    psw new-model ;


: psw-cy-set ( psw -- )
    dup psw?
    [
       [ value>> 7 set-bit ] keep set-model
    ]
    [ drop ] if ;


: psw-cy-clr ( psw -- )
    dup psw?
    [
        [ value>> 7 clear-bit ] keep set-model
    ]
    [ drop ] if ;

: psw-ac-set ( psw -- )
    dup psw?
    [
        [ value>> 6 set-bit ] keep set-model
    ]
    [ drop ] if ;

: psw-ac-clr ( psw -- )
    dup psw?
    [
        [ value>> 6 clear-bit ] keep set-model
    ]
    [ drop ] if ;


: psw-f0-set ( psw -- )
    dup psw?
    [
        [ value>> 5 set-bit ] keep set-model
    ]
    [ drop ] if ;

: psw-f0-clr ( psw -- )
    dup psw?
    [
        [ value>> 5 clear-bit ] keep set-model
    ]
    [ drop ] if ;

: psw-br0-set ( psw -- )
    dup psw?
    [
        [ value>> 3 set-bit ] keep set-model
    ]
    [ drop ] if ;

: psw-br0-clr ( psw -- )
    dup psw?
    [
        [ value>> 3 clear-bit ] keep set-model
    ]
    [ drop ] if ;

: psw-br1-set ( psw -- )
    dup psw?
    [
        [ value>> 4 set-bit ] keep set-model
    ]
    [ drop ] if ;

: psw-br1-clr ( psw -- )
    dup psw?
    [
        [ value>> 4 clear-bit ] keep set-model
    ]
    [ drop ] if ;

: psw-bank0-set ( psw -- )
    dup psw?
    [
        [ value>> 4 clear-bit 3 clear-bit ] keep set-model
    ]
    [ drop ] if ;

: psw-bank1-set ( psw -- )
    dup psw?
    [
        [ value>> 4 clear-bit 3 set-bit ] keep set-model
    ]
    [ drop ] if ;

: psw-bank2-set ( psw -- )
    dup psw?
    [
        [ value>> 4 set-bit 3 clear-bit ] keep set-model
    ]
    [ drop ] if ;

: psw-bank3-set ( psw -- )
    dup psw?
    [
        [ value>> 4 set-bit 3 set-bit ] keep set-model
    ]
    [ drop ] if ;


: psw-bank-read ( psw -- n )
    dup psw?
    [
        value>> 4 2 bit-range
    ]
    [ drop 0 ] if ;



