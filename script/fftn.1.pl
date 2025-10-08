#!/usr/bin/env perl

use utf8;
use v5.40;

use lib 'lib';

use Carp;
use Getopt::Long;
use Data::Printer;
use FFmpeg::Inline;
use Syntax::Keyword::Try;

our %opts = ( format => size => { width => 300, height => 300 } );

GetOptions(
    %opts,
    'format=s',
    'size|dimensions=d%',
    '<>' => sub ($barearg) {
        push @queue, $barearg if -r $barearg;
    }
);

FFmpeg::Inline->print_class if $ENV{DEBUG};

our $fftn = FFmpeg::Inline->new;

$fftn->print_self           if $ENV{DEBUG};
FFmpeg::Inline->print_class if $ENV{DEBUG};

for my $file (@queue) {
    try {
        my $ret = FFmpeg::Inline->thumbnail(
            shift @ARGV,
            map { ( $_ => ( shift @ARGV || undef ) ) } qw(out width height fmt)
        );
        p $ret
    }
    catch ($e) {
        croak np $e
    }
}
