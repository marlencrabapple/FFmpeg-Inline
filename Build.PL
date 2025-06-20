# =========================================================================
# THIS FILE IS AUTOMATICALLY GENERATED BY MINILLA.
# DO NOT EDIT DIRECTLY.
# =========================================================================

use 5.008_001;

use strict;
use warnings;
use utf8;

use Module::Build::XSUtil;
use File::Basename;
use File::Spec;

my %args = (
    license              => 'perl_5',
    dynamic_config       => 0,

    configure_requires => {
        'Module::Build' => '0.4005',
    },

    requires => {
        'Const::Fast' => '0',
        'Const::Fast::Exporter' => '0',
        'Data::Printer' => '0',
        'File::chdir' => '0',
        'Future::AsyncAwait' => '0',
        'Getopt::Long' => '0',
        'HTTP::Tinyish' => '0',
        'Inline' => '0',
        'Inline::C' => '0',
        'Inline::Module' => '0',
        'JSON::MaybeXS' => '0',
        'List::AllUtils' => '0',
        'Module::Build::InlineModule' => '0',
        'Object::Pad' => '0',
        'Path::Tiny' => '0',
        'Pod::Usage' => '0',
        'Struct::Dumb' => '0',
        'Syntax::Keyword::Defer' => '0',
        'Syntax::Keyword::Dynamically' => '0',
        'Syntax::Keyword::MultiSub' => '0',
        'Syntax::Keyword::Try' => '0',
        'TOML::Tiny' => '0',
        'Time::HiRes' => '0',
        'perl' => 'v5.40.0',
    },

    recommends => {
    },

    suggests => {
    },

    build_requires => {
        'App::perlimports' => '0',
        'C::Scan' => '0',
        'ExtUtils::InstallPaths' => '0',
        'Inline' => '0',
        'Inline::C' => '0',
        'Inline::Module' => '0',
        'Minilla' => '0',
        'Minilla::Profile::ModuleBuild' => '0',
        'Module::Build::InlineModule' => '0',
        'Module::Build::XSUtil' => '0',
        'Module::Signature' => '0',
        'Perl::Critic' => '0',
        'Perl::Critic::Community' => '0',
        'Perl::Tidy' => '0',
    },

    test_requires => {
        'C::Scan' => '0',
        'Module::Build::InlineModule' => '0',
        'Test::CPAN::Meta' => '0',
        'Test::More' => '0.98',
        'Test::Spellunker' => '0',
    },

    name            => 'FFmpeg-Inline',
    module_name     => 'FFmpeg::Inline',
    allow_pureperl => 0,

    script_files => [glob('script/*'), glob('bin/*')],
    PL_files => {},

    test_files           => ((-d '.git' || $ENV{RELEASE_TESTING}) && -d 'xt') ? 't/ xt/' : 't/',
    recursive_test_files => 1,


    needs_compiler_c99 => 1,
    needs_compiler_cpp => 0,
    generate_ppport_h => '1',
    generate_xshelper_h => '0',
    cc_warnings => 1,
);
if (-d 'share') {
    $args{share_dir} = 'share';
}

my $builder = Module::Build::XSUtil->subclass(
    class => 'MyBuilder',
    code => q{
        sub ACTION_distmeta {
            die "Do not run distmeta. Install Minilla and `minil install` instead.\n";
        }
        sub ACTION_installdeps {
            die "Do not run installdeps. Run `cpanm --installdeps .` instead.\n";
        }
    }
)->new(%args);
$builder->create_build_script();

