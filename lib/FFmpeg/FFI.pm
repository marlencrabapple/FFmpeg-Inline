use Object::Pad qw(:experimental(:all));

package FFmpeg::FFI 0.01;
class FFmpeg::FFI;

use utf8;
use v5.40;

use Path::Tiny;
use Data::Printer;
use Syntax::Keyword::Try;

state $config = {
  tn => {
    default_format => "avif",
    default_name => sub { __PACKAGE__->tnfn },
    width => 250,
    height => 250
  }
};

use Inline C => path('./src/ffmpeg-thumb.h')->slurp_utf8
  => BUILD_NOISY => 1
  => enable => autowrap
  => LIBS => "-lavformat -lavcodec -lavdevice -lavfilter -lavutil -lswscale -lswresample -lz";

method show_self {
  p $self
}

method tnfn :common {
  time . "." . $config->{tn}{default_format}
}

method thumbnail :common ($in, $out = './' . $config->{tn}{default_name}->()
  , $width = $config->{tn}{width}, $height = $config->{tn}{height}) {

  try {
    FFmpeg::FFI::thumb($0, $in, $out, "$width", "$height");
  }
  catch ($e) {
    p $e
  }
}

__END__

=encoding utf-8

=head1 NAME

FFmpeg::Inline - Bindings to FFmpeg/libav via Inline::C

=head1 SYNOPSIS

    use FFmpeg::Inline;

=head1 DESCRIPTION

FFmpeg::Inline is ...

=head1 LICENSE

Copyright (C) Ian P Bradley.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Ian P Bradley E<lt>ian.bradley@studiocrabapple.comE<gt>

=cut

