unit module CalculateUnits;

use v6.c;

use UnderstandExchange;

sub calculate_unit( $file_result, $currency ) is export
{
    my $arr = $file_result{'VALUATION'};
    my @resources = <Silver Iron Gold>;

    my @sentences;
    my $converted;
    my Int $digits;
    
    my %pricing;
    
    for @$arr -> $line
    {
        for @resources -> $mineral
        {
            if $line.match($mineral)
            {
                @sentences = $line.split($mineral);
                
                @sentences[0].map: {
                    if $_
                    {
                        my $to_convert 
                        = join('', %$currency{grep { $_ }, $_.split(' ')});
                        
                        $converted = understand_exchange($to_convert);
                    }
                }
                
                for @sentences[1].split(' ') -> $arr_part_two
                {
                    if $arr_part_two.match(/\d/)
                    {
                        $digits = Int($arr_part_two);
                    }
                }
                
                my $value = $digits / $converted;
                %pricing{$mineral} = $value;
            }
        }
    }
    
    return %pricing;
}