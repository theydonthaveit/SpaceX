unit module GenerateResults;

use v6.c;

use ReadFile;
use UnderstandCurrency;
use UnderstandExchange;
use CalculateUnits;

sub generate_invoice ( $file_handle, $currency_results, $calc_units ) is export
{
    my $arr = $file_handle{'QUESTIONS'};
    my @invoice;
    
    for @$arr -> $questions
    {
        given $questions
        {
            when $questions.match('how much is')
            {
                my @word_split_arr = $questions.split(' ');
                
                my $currency =
                %$currency_results{grep { $_ }, @word_split_arr}:k;
                
                my $currency_to_convert = 
                join( '', %$currency_results{grep { $_ }, @word_split_arr}:v );
                
                my $converted = understand_exchange($currency_to_convert);
                
                @invoice.push: "$currency is $converted" ;
            }
            when $questions.match('how many Credits is')
            {
                my @word_split_arr = $questions.split(' ');
                
                my $currency_to_convert =
                %$currency_results{grep { $_ }, @word_split_arr}:k;

                my $to_convert = 
                join( '', %$currency_results{grep { $_ }, @word_split_arr}:v );
                
                my $converted = understand_exchange($to_convert);
                
                my $resource =
                %$calc_units{grep { $_ }, @word_split_arr}:k;
                
                my $resource_to_convert =
                join( '', %$calc_units{grep { $_ }, @word_split_arr}:v );

                my $resource_value = $converted * $resource_to_convert;

                @invoice.push: 
                "$currency_to_convert $resource is $resource_value Credits";
            }
            default
            {
                @invoice.push: "I have no idea what you are talking about";
            }
        }
    }
    
    return @invoice;
}