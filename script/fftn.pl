#!/usr/bin/env perl

use utf8;
use v5.40;

use Getopt::Long
  qw(GetOptionsFromArray :config no_ignore_case auto_abbrev passthrough long_prefix_pattern=--?);

use IO::Handle::Common;
use FFmpeg::Inline;
use Path::Tiny;

sub cli {
    my %clidest = ( max_width => 400, max_height => -1 );
    my @barearg;

    GetOptions(
        \%clidest,
        'output=s',
        'dimensions|maxsize|resize=s{2}',
        'max_width=s',
        'max_height=s',
        'quality=i',
        'offset|ss=s',
        'audio!', 'vf=s',
        '<>' => sub ($barearg) {
            push @barearg, $barearg;

        }
    );

    @clidest{qw(max_width maxheight)} //= $clidest{dimensions}->@*
      if ref $clidest{dimensions} isa ARRAY;

    foreach my $in ( map { path $_ } @barearg ) {
        FFmpeg::Inline->thumbnail(
            $in,
            (
                $clidest{output}
                ? "$clidest{output}-" . time . ".jxl"
                : $in->basename(qr/\.[^\.]+$/) . ".jxl"
            ),
            delete @clidest{qw(max_width max_height)},
            %clidest
        );
    }
}

cli()
