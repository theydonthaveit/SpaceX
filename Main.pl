use v6.c;
use lib '/home/ubuntu/workspace/lib/SX';

use Test;
use ReadFile;
use UnderstandCurrency;
use CalculateUnits;
use GenerateResults;

my $file = 't/ThoughtWorks.txt';
my $file_handle = read_file($file);
my $currency_result = understand_currency( $file_handle );
my $calc_units = calculate_unit($file_handle, $currency_result);
my $gene_results = 
generate_invoice($file_handle, $currency_result, $calc_units);

for @$gene_results -> $results
{
    say $results;
}