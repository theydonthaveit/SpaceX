use v6.c;
use lib '/home/ubuntu/workspace/lib/SX';

use Test;
use ReadFile;

plan 3;

# Test case 1.0 -- File Handling #
# {{{
subtest 'Test case 1.0 -- File Handling' => sub {
    plan 5;

    my $file = 'ThoughtWorks.txt';
    my $file_obj =  IO::Path.new($file);

    my $file_ext = $file_obj.extension;
    my $file_path = $file_obj.e;
    my $file_dir = $file_obj.d;
    my $file_exists = $file_obj.f;
    my $file_reg = $file_obj.s;
    
    is $file_ext, 'txt', 'Correct file type for processing';
    is $file_path, 'True', 'File path exists';
    is $file_dir, 'False', 'File directory doesnt invoke';
    is $file_exists, 'True', 'File Exists';
    is $file_reg, '352', "File holds valid bytes equal to ($file_reg)";

};
#}}}

# Test case 1.1 -- File Reading #
# {{{
subtest 'Test case 1.0 -- File Reading -- Success' => sub {
    plan 2;

    my $file = 'ThoughtWorks.txt';
    my $file_obj =  IO::Path.new($file);
    my $file_contains = $file_obj.r;

    is $file_contains, 'True', 'File is readable';
    
    my $file_handle = read_file($file);
    
    is $file_handle.WHAT, (Hash), 'Data Set Returned as Hash';
};
#}}}

# Test case 1.2 -- File Reading #
# {{{
subtest 'Test case 1.0 -- File Reading -- Failure' => sub {
    plan 2;

    my $file = 'ThoughtWorks.tx';
    my $file_obj =  IO::Path.new($file);
    
    my $file_contains = $file_obj.r;
    my $file_ext = $file_obj.extension;

    isnt $file_contains, 'True', 'File isnt readable';
    isnt $file_ext, 'txt', "Bad File extention ($file_ext)";
    
};
#}}}
