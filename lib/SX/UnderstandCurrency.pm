unit module UnderstandCurrency;

use v6.c;

sub understand_currency ($file_result) is export
{
    my %exchange_rate;
    my $arr = $file_result{'CURRENCY'};
    
    for @$arr -> $index
    {
        my ( $cur, $ex ) = $index.split(/\s+is/);
        %exchange_rate{$cur.trim} = $ex.trim;
    }
    
    return %exchange_rate;
}