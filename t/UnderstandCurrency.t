use v6.c;
use lib '/home/ubuntu/workspace/lib/SX';

use Test;

use ReadFile;
use UnderstandCurrency;

plan 1;

# Test case 1.0 -- Exchange Rate Understanding #
# {{{
subtest 'Test case 1.0 -- Exchange Rate Understanding -- Success' 
=> sub
{
    plan 4;

    my $file = 'ThoughtWorks.txt';
    my $file_handle = read_file($file);
    my $result = understand_currency( $file_handle );
    
    is $result.WHAT, (Hash), 'Correct Data Set Returned';
    is $result<glob>:exists, 'True', 'We have a result';
    is $result<glob>:k, 'glob', 'Correct Keys Stored';
    is $result<glob>:v, 'I', 'Correct Value Associated';
};
#}}}
