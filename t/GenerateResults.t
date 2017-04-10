use v6.c;
use lib '/home/ubuntu/workspace/lib/SX';

use Test;
use ReadFile;
use UnderstandCurrency;
use CalculateUnits;
use GenerateResults;

plan 1;

# Test case 1.0 -- Generate Results based on Input File #
# {{{
subtest 'Test case 1.0 -- Generate Results based on Input File -- Success' 
=> sub 
{
    plan 6;

    my $file = 'ThoughtWorks.txt';
    my $file_handle = read_file($file);
    my $currency_result = understand_currency( $file_handle );
    my $calc_units = calculate_unit($file_handle, $currency_result);
    my $gene_results = 
    generate_invoice($file_handle, $currency_result, $calc_units);
    
    is $gene_results.WHAT, (Array), 'Correct Data Structure Retruned';
    
    is $gene_results[0], 'pish tegj glob glob is 42', "$gene_results[0]";
    is $gene_results[1], 'glob prok Silver is 68 Credits', "$gene_results[1]";    
    is $gene_results[2], 'glob prok Gold is 57800 Credits', "$gene_results[2]";    
    is $gene_results[3], 'glob prok Iron is 782 Credits', "$gene_results[3]";    
    is $gene_results[4], 'I have no idea what you are talking about', "$gene_results[4]";    

};
#}}}