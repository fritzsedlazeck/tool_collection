#!/usr/local/bin/perl -w

my $in=$ARGV[0];
open(IN, "<$in");
open(OUT1, ">forward.fastq");
open(OUT2, ">backward.fastq");
my $count = 0;
while(<IN>) {
  if ($count < 4) {
    print OUT1 $_;
  } else {
    print OUT2 $_;
  }
  $count++;
  if ($count == 8){ $count = 0;}
}
close(IN);
close(OUT1);
close(OUT2);
