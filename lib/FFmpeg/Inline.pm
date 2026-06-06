use Object::Pad ':experimental(:all)';

package FFmpeg::Inline;

class FFmpeg::Inline;

use vars '$VERSION';
our $VERSION = 0.01;

use utf8;
use v5.40;

use Syntax::Keyword::Try;
use IO::Handle::Common;
use Path::Tiny;
use Const::Fast;
use vars qw'@EXPORT @EXPORT_OK';

use FFmpeg::Inline::Stub C => Config => BUILD_NOISY => 1 => enable =>
  "autowrap"               => LIBS   =>
  "-lavformat -lavcodec -lavdevice -lavfilter -lavutil -lswscale"
  . " -lswresample -lz";

@EXPORT_OK = qw(ffmpeg ffprobe);

const our %AV_CODEC_ID => (
    jxl  => 'AV_CODEC_ID_JPEGXL',
    avif => 'AV_CODEC_ID_AV1',
    png  => 'AV_CODEC_ID_PNG',
    gif  => 'AV_CODEC_ID_GIF',
    webp => 'AV_CODEC_ID_WEBP',
    heif => 'AV_CODEC_ID_HEVC',
    vp8  => 'AV_CODEC_ID_VP8',
    vp9  => 'AV_CODEC_ID_VP9',
    bmp  => 'AV_CODEC_ID_BMP',
    apng => 'AV_CODEC_ID_APNG',
    jpeg => 'AV_CODEC_ID_JPEG2000',
    jpg  => 'AV_CODEC_ID_JPEG2000',
);

ADJUST {
    dmsg($self)
}

method ffmpeg {
    ...;
}

method ffprobe {
    ...;
}

method thumbnail : common ( $in, $out, $max_x, $max_y, %opt ) {
    die unless $in;
    $in = path($in);
    die unless $in->exists;
    $out = path($out);

    my ( $noext, $ext ) = (
        $out->basename =~ /^.*\/?
                                        ([^.]+)
                                       \.(.+)
                                      $/xxig
    );

    $opt{quality} //= 8;
    $opt{format}  //= $AV_CODEC_ID{ lc($ext) };
    $opt{offset}  //= 0;
    $opt{vf} = undef;

    my @dim = ( $max_x, $max_y );
    dmsg $0, $in, $out, \@dim, \%opt;

    my $status = FFmpeg::Inline::thumb( $0, $in, $out, @dim, $opt{format} );

    $status;
}

use FFmpeg::Inline::Stub C => 'src/ffmpeg-thumb.c';

=encoding utf-8

=head1 NAME

FFmpeg::Inline - Blah blah blah

=head1 SYNOPSIS

  use FFmpeg::Inline;

=head1 DESCRIPTION

FFmpeg::Inline is

=head1 AUTHOR

Ian P Bradley E<lt>crabapp@hikki.techE<gt>

=head1 COPYRIGHT

Copyright 2026- Ian P Bradley

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
