#!/usr/bin/env perl

use utf8;
use v5.40;

use lib 'lib';

use Carp;
use Getopt::Long;
use Data::Printer;
use FFmpeg::Inline;
use Syntax::Keyword::Try;

FFmpeg::Inline->print_class if $ENV{DEBUG};
my $fftn = FFmpeg::Inline->new;
$fftn->print_self if $ENV{DEBUG};
FFmpeg::Inline->print_class if $ENV{DEBUG};

try {
  my $ret = FFmpeg::Inline->thumbnail(shift @ARGV
    , map { ($_ => (shift @ARGV || undef)) } qw(out width height fmt));
  p $ret
}
catch ($e) {
  croak np $e
}
