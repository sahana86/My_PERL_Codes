#!/usr/bin/perl

use Getopt::Std;
my %args;                                                       #to execute help block
getopts('h', \%args);
my $help = "The format should be                               
<perl_script_name> <input_fastq_file_name> <input_pattern> <input 1=case insensitive OR 2=case sensitive>\npat_q3.pl 1000.fastq aa 1
pat_q3.pl 1000.fastq TT 2\n";
die $help if $args{h};
# otherwise continue with script...

$f=$ARGV[0];
$pat=$ARGV[1];
$case=$ARGV[2];
$len=length $pat;
$line=0;
$count=0;
open(f,$f);
if($case==1)
{
 while($l=<f>)
 {
  $line++;
  if($line==2)
  {
    $line=-2;
    $i=0;
    $len2=length $l;
    if($len2<$len)
      {
       last;
      }
    while($i<$len2)
     {
      $s=substr($l,$i,$len);
      if(uc($s) eq uc($pat))
        { 
         $count++;
         $i=$i+$len;
         $match=1;
        }
       else
        {
         $match=0;
         $i++;
        }
       }
     }
   }
}
elsif($case==2)
{
 while($l=<f>)
 {
  $line++;
  if($line==2)
  {
    $line=-2;
    $i=0;
    $len2=length $l;
    if($len2<$len)
      {
       last;
      }kmer_pattern_search_fastq
    while($i<$len2)
     {
      $s=substr($l,$i,$len);
      if($s eq $pat)
        { 
         $count++;
         $i=$i+$len;
         $match=1;
        }
       else
        {
         $match=0;
         $i++;
        }
       }
     }
   }
}
print"$pat $count\n";
