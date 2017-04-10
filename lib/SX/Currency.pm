unit module Currency;

use v6.c;

our %CURRENCY is export= Map.new();

%CURRENCY.push: (I => 1);
%CURRENCY.push: (V => 5);
%CURRENCY.push: (X => 10);
%CURRENCY.push: (L => 50);
%CURRENCY.push: (C => 100);
%CURRENCY.push: (D => 500);
%CURRENCY.push: (M => 1000);