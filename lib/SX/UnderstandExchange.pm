unit module UnderstandExchange;

use v6.c;

use Currency;

sub understand_exchange ( Str $offer ) is export
{
    my @LOG;
    
    given $offer
    {
        when $offer.match('MMMM'|'IIII'|'XXXX'|'CCCC')
        {
            return '(M I X C) have been repeated more than 3 times in succession';
        }
        when $offer.match('DD'|'LL'|'VV')
        {
            return '(D L V) have been repeated';
        }
        when $offer.match('IL'|'IC'|'IM'|'ID')
        {
            return '(I) can only be subtracted from V and X';
        }
        when $offer.match('VX'|'XM'|'XD')
        {
            return '(X) can only be subtracted from C and L';
        }
        when $offer.match('LC'|'VC')
        {
            return '(C) can only be subtracted from M and D';
        }
        when $offer.match('VLD'|'VDL'|'DLV'|'DVL'|'LVD'|'LDV')
        {
            return '(D V L) can never be subtracted';
        }
        default
        {
            @LOG.push: 'Valid Roman Numeral Combination';
        }
    }

    my Int $length = $offer.chars;

    my Int $num = 0;
    
    loop ( my Int $iter = $length - 1; $iter >= 0; $iter-- )
    {
        my $cur = %CURRENCY{$offer.substr($iter, 1)};
        if 
        ( $iter < $length - 1 && $cur < %CURRENCY{$offer.substr($iter + 1, 1)} )
        {
            $num -= $cur;
        }
        else
        {
            $num += $cur;
        }
    }
    
    return $num;
}