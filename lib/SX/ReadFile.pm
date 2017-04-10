unit module ReadFile;

use v6.c;

use Currency;

sub read_file ($file) is export
{
    my $file_obj;
    
    my @questions;
    my @valuations;
    my @currency;
    
    my %visited_merchant;

    if $file.IO :r 
    {
        $file_obj = IO::Path.new($file);
    }
    else 
    {
        return 'PLEASE SUPPLY A FILE';
    }
    
    for $file_obj.lines -> $lines
    {
        given $lines
        {
            when $lines.match('?')
            {
                %visited_merchant{'QUESTIONS'} = @questions.push: $lines;
            }
            when $lines.match(/\d/)
            {
                %visited_merchant{'VALUATION'} = @valuations.push: $lines
            }
            when $lines.match(/\w/)
            {
                for %CURRENCY.kv -> $numeral, $value
                {
                    if $lines.match($numeral)
                    {
                        %visited_merchant{'CURRENCY'} = @currency.push: $lines
                    }
                }
            }
            default
            {
                return 'DENIED ENTRY INTO THE MATRIX'
            }
        }
    }

    return %visited_merchant;
}