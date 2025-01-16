#!/usr/bin/env perl

use utf8;
use v5.40;

use lib 'lib';

use Data::Dumper;
use Data::Printer;
use FFmpeg::FFI;

my $fftn = FFmpeg::FFI->new;
$fftn->show_self;

try {
  FFmpeg::FFI->thumbnail(@ARGV);
  #FFmpeg::Inline::tn(@ARGV);
}
catch ($e) {
  p $e
}