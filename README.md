[![Actions Status](https://github.com/marlencrabapple/FFmpeg-Inline/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/marlencrabapple/FFmpeg-Inline/actions?workflow=test)
# NAME

FFmpeg::Inline - Perl 5 bindings to FFmpeg/lib(av(codec|format|util|filter|device)|sw(resample|scale)) via Inline::C and Inline::Module.

# SYNOPSIS
    use utf8;
    use v5.40;

    use FFmpeg::Inline;

    # OO-interface
    my $enc = FFmpeg::Inline
                ->new( format => 'jxl'
                    , lplacebo  => [ 300, 300 ]
                    , filtergraph => {
                    , lplacebo  => "lplacebo=w=%d:h=%d:upscaler="
                        . "ewa_lanczos4sharpest:downscaler=
                        . "ewa_lanczos4sharpest:deband=true:"
                        . "deband_iterations=16:deband_radius=50"
                        . ":deband_threshold="
                        . "50:deband_grain=80:peak_detect=1:"
                        . "tonemapping=bt.2446"
                        . ":inverse_tonemapping=1:format"
                        . "=rgb24extra_opts='preset=veryhigh'"
                        ...
                    }
                , vcodec => { effort => 9, distance => 0 }
                , globalcfg  => { threads => 0, report => 1 }
                , genfn => sub ($inputfn, $ext) {
                    join '', Time::HiRes::gettimeofday . ".$ext"
                  }
                ,  ... );

    $r->post('/upload', sub ($c) {
      my ($file) = shift $c->req->uploads;
      my $out = $enc->process($file);
      $c->500 if $?;
    })

    # Procedural interface
    my $tnfn = FFmpeg::Inline::thumb($inputfn, sub (undef, $ext) { join '', Time::HiRes::gettimeofday . "$ext" } )

# DESCRIPTION

FFmpeg::Inline is ...

# LICENSE

Copyright (C) Ian P Bradley.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Ian P Bradley <ian.bradley@studiocrabapple.com>
