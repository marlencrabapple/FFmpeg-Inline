use utf8;
use v5.40;

use lib '.';

use Module::Build::InlineModule;

Module::Build::InlineModule->new(
    module_name         => 'FFmpeg::Inline',
    dist_name           => 'FFmpeg::Inline',
    dist_abstract       => 'Bindings to FFmpeg via Inline::C and Inline::Module',
    dist_author         => 'Ian P Bradley <ian@hikki.tech>',
    dist_version        => '0.01',
    license             => 'perl',
    requires => {
        'Test::More' => 0,
    },
    configure_requires => {
      'Module::Build' => 0.42,
      "Const::Fast" => "0",
      "Data::Printer" => "0",
      "File::chdir" => "0",
      "Future::AsyncAwait" => "0",
      "Getopt::Long" => "0",
      "HTTP::Tinyish" => "0",
      "IO::Async" => "0",
      "IO::Async::SSL" => "0",
      "IO::Socket::SSL" => "0",
      "IPC::Run3" => "0",
      "Inline" => "0",
      "Inline::C" => "0",
      "Inline::CPP" => "0",
      "Inline::Module" => "0",
      "InlineX::C2XS" => "0",
      "JSON::MaybeXS" => "0",
      "List::AllUtils" => "0",
      "Module::Build::InlineModule" => "0",
      "Net::SSLeay" => "0",
      "Object::Pad" => "0",
      "Path::Tiny" => "0",
      "Pod::Usage" => "0",
      "Struct::Dumb" => "0",
      "Syntax::Keyword::Defer" => "0",
      "Syntax::Keyword::Dynamically" => "0",
      "Syntax::Keyword::MultiSub" => "0",
      "Syntax::Keyword::Try" => "0",
      "TOML::Tiny" => "0",
      "Time::HiRes" => "0",
      "perl" => "v5.40.0"
    },
    inline => {
        module => 'FFmpeg::Inline::Stub',
    },
)->create_build_script()

