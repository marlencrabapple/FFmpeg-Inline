#!/usr/bin/env perl

use utf8;
use v5.40;

use lib 'lib';

use Data::Dumper;
use Data::Printer;
use FFmpeg::FFI;
use Syntax::Keyword::Try;

# my $fftn = FFmpeg::FFI->new;
# $fftn->show_self;

try {
  my $ret = FFmpeg::FFI->thumbnail(@ARGV);
  say $ret
}
catch ($e) {
  p $e
}