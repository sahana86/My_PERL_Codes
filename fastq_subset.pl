#!/usr/bin/perl

print"\n enter the file name : ";
$f=<stdin>;
chomp $f;
open(f,$f);
open(o,">sset.txt");
$s="@HWI-ST1265";
while($l=<f>)
{
 if($l=~ /$s/)
   {
    $i++;
   }
 if($i==10)
   {
    last;
   }
 print o"$l";
}
close(f);
close(o);
