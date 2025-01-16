#!/usr/bin/env perl

use utf8;
use v5.40;

use lib 'lib';

use FFmpeg::Inline;
use Data::Printer;
use Syntax::Keyword::Try;

my $fftn = FFmpeg::Inline->new;
$fftn->show_self;

try {
  my $ret = FFmpeg::Inline->thumbnail(@ARGV);
  say $ret
}
catch ($e) {
  p $e
}
