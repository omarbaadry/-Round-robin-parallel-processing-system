function val = get(a, propName)
switch propName
case 'MAX_CLOCK'
    val =a.MAX_CLOCK;
case 'CLOCK'
    val =a.clock;
otherwise
    error('DES properties: MAX_CLOCK and CLOCK')
end