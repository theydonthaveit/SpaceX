use v6.c;
use lib '/home/ubuntu/workspace/lib/SX';

use Test;
use ReadFile;
use UnderstandCurrency;
use CalculateUnits;

plan 1;

# Test case 1.1 -- Calculate Units of Currency #
# {{{
subtest 'Test case 1.0 -- Calculate Units of Currency -- Success' => sub {
    plan 3;

    my $file = 'ThoughtWorks.txt';
    my $file_handle = read_file($file);
    my $currency_result = understand_currency( $file_handle );
    my $calc_units = calculate_unit($file_handle, $currency_result);
    
    is $calc_units.WHAT, (Hash), 'Hash returned';
    is $calc_units<Silver>:exists, 'True', 'Silver key exists in Hash';
    is $calc_units<Silver>:v, '17', 'Value of (Silver) is (17) correct';

};
#}}}
