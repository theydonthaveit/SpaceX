use v6.c;
use lib '/home/ubuntu/workspace/lib/SX';

use Test;

use UnderstandExchange;

plan 1;

# Test case 1.0 -- Exchange Rate Understanding #
# {{{
subtest 'Test case 1.0 -- Exchange Rate Understanding -- Success' 
=> sub
{
    plan 24;
    
    my $roman_numeral = understand_exchange('MMVI');
    my $roman_numeral_1944 = understand_exchange('MCMXLIV');
    my $roman_numeral_1903 = understand_exchange('MCMIII');
    my $roman_numeral_3999 = understand_exchange('MMMCMXCIX');

    my $roman_numeral_repeated_valid = understand_exchange('XXXIX');

    my $roman_numeral_repeated_M_invalid = understand_exchange('MMMM');
    my $roman_numeral_repeated_D_invalid = understand_exchange('DD');
    my $roman_numeral_repeated_V_invalid = understand_exchange('VV');
    my $roman_numeral_repeated_L_invalid = understand_exchange('LL');

    my $roman_numeral_subtract_IL = understand_exchange('IL');
    my $roman_numeral_subtract_IC = understand_exchange('IC');
    my $roman_numeral_subtract_IM = understand_exchange('IM');
    my $roman_numeral_subtract_ID = understand_exchange('ID');

    my $roman_numeral_subtract_VX = understand_exchange('VX');
    my $roman_numeral_subtract_XM = understand_exchange('XM');
    my $roman_numeral_subtract_XD = understand_exchange('XD');

    my $roman_numeral_subtract_LC = understand_exchange('LC');
    my $roman_numeral_subtract_VC = understand_exchange('VC');

    my $roman_numeral_subtract_VLD = understand_exchange('VLD');
    my $roman_numeral_subtract_VDL = understand_exchange('VDL');
    my $roman_numeral_subtract_DLV = understand_exchange('DLV');
    my $roman_numeral_subtract_DVL = understand_exchange('DVL');
    my $roman_numeral_subtract_LVD = understand_exchange('LVD');
    my $roman_numeral_subtract_LDV = understand_exchange('LDV');

    is $roman_numeral_1903, 1903, 'Correct Calculation ( MCMIII = 1903 )';
    is $roman_numeral_1944, 1944, 'Correct Calculation ( MCMXLIV = 1944 )';
    is $roman_numeral, 2006, 'Correct Calculation ( MMVI = 2006 )';
    is $roman_numeral_3999, 3999, 'Correct Calculation ( MMMCMXCIX = 3999 )';

    is $roman_numeral_repeated_valid, 39, 'Correct Repettion ( XXXIX = 39 )';

    is $roman_numeral_repeated_M_invalid, '(M I X C) have been repeated more than 3 times in succession', 'M repeated too ofter';
    is $roman_numeral_repeated_D_invalid, '(D L V) have been repeated', 'D was repeated';
    is $roman_numeral_repeated_V_invalid, '(D L V) have been repeated', 'V was repeated';
    is $roman_numeral_repeated_L_invalid, '(D L V) have been repeated', 'L was repeated';

    is $roman_numeral_subtract_IL, '(I) can only be subtracted from V and X', 'I subtracted from L';
    is $roman_numeral_subtract_IC, '(I) can only be subtracted from V and X', 'I subtracted from C';
    is $roman_numeral_subtract_IM, '(I) can only be subtracted from V and X', 'I subtracted from M';
    is $roman_numeral_subtract_ID, '(I) can only be subtracted from V and X', 'I subtracted from D';
    
    is $roman_numeral_subtract_VX, '(X) can only be subtracted from C and L', 'V subtracted from X';
    is $roman_numeral_subtract_XM, '(X) can only be subtracted from C and L', 'X subtracted from M';
    is $roman_numeral_subtract_XD, '(X) can only be subtracted from C and L', 'X subtracted from D';

    is $roman_numeral_subtract_LC, '(C) can only be subtracted from M and D', 'L subtracted from C';
    is $roman_numeral_subtract_VC, '(C) can only be subtracted from M and D', 'V subtracted from C';

    is $roman_numeral_subtract_VLD, '(D V L) can never be subtracted', 'VLD subtraction attempt';
    is $roman_numeral_subtract_VDL, '(D V L) can never be subtracted', 'VDL subtraction attempt';
    is $roman_numeral_subtract_DLV, '(D V L) can never be subtracted', 'DLV subtraction attempt';
    is $roman_numeral_subtract_DVL, '(D V L) can never be subtracted', 'DVL subtraction attempt';
    is $roman_numeral_subtract_LVD, '(D V L) can never be subtracted', 'LVD subtraction attempt';
    is $roman_numeral_subtract_LDV, '(D V L) can never be subtracted', 'LDV subtraction attempt';

};
#}}}