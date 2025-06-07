requires 'perl', 'v5.40';

requires 'Time::HiRes';
requires 'Inline::Module';
requires 'Inline';
requires 'Inline::C';
requires 'Object::Pad';
requires 'Syntax::Keyword::Try';
requires 'Syntax::Keyword::Defer';
requires 'Syntax::Keyword::MultiSub';
requires 'Syntax::Keyword::Dynamically';
requires 'Data::Printer';
requires 'Getopt::Long';
requires 'Pod::Usage';
requires 'Path::Tiny';
requires 'File::chdir';
requires 'List::AllUtils';
requires 'Path::Tiny';
requires 'HTTP::Tinyish';
requires 'JSON::MaybeXS';
requires 'TOML::Tiny';
requires 'Struct::Dumb';
requires 'Future::AsyncAwait';
requires 'Const::Fast';
requires 'Const::Fast::Exporter';
requires 'Module::Build::InlineModule';

on 'test' => sub {
  requires 'C::Scan';
  requires 'Test::More', '0.98';
  requires 'Test::CPAN::Meta', '0.25',
  recommends 'Test::PAUSE::Permissions';
  requires 'Test::Spellunker';
  requires 'Module::Build::InlineModule';
};

use constant DEV_PREREQS => sub {
  requires 'Inline::Module';
  requires 'C::Scan';
  requires 'Minilla';
  requires 'Minilla::Profile::ModuleBuild';
  requires 'Perl::Critic';
  requires 'Perl::Tidy';
  requires 'App::perlimports';
  requires 'Perl::Critic::Community';
  requires 'Inline';
  requires 'Inline::C';
  requires 'Module::Build::InlineModule';
  requires 'Module::Build::XSUtil';
  requires 'Module::Signature';
  requires 'ExtUtils::InstallPaths'
};

on 'build' => DEV_PREREQS;
on 'develop' => DEV_PREREQS;

#requires 'Minilla::ModuleMaker::ModuleBuildInlineModule', '0.01',
#  dist => 'CRABAPP/Minilla-ModuleMaker-ModuleBuildInlineModule-0.01',
#  url => 'file://./vendor/Minilla-ModuleMaker-ModuleBuildInlineModule-0.01.tar.gz';
