requires 'perl', 'v5.40';

requires 'Time::HiRes';
requires 'Inline::Module';
requires 'Inline';
requires 'Inline::C';
requires 'InlineX::C2XS';
requires 'Inline::CPP';
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
requires 'IPC::Run3';
requires 'IO::Socket::SSL';
requires 'Net::SSLeay';
requires 'List::AllUtils';
requires 'Path::Tiny';
requires 'HTTP::Tinyish';
requires 'JSON::MaybeXS';
requires 'TOML::Tiny';
requires 'Struct::Dumb';
requires 'Future::AsyncAwait';
requires 'IO::Async';
requires 'IO::Async::SSL';
requires 'Const::Fast';
#requires 'Dist::Zilla::Plugin::InlineModule';
requires 'Module::Build::InlineModule';

on 'test' => sub {
  requires 'C::Scan';
  requires 'Test::More', '0.98';
  requires 'Test::CPAN::Meta', '0.25',
  requires 'Test::PAUSE::Permissions';
  requires 'Test::Spellunker';
  requires 'Test::MinimumVersion::Fast';
  requires 'Dist::Zilla::Plugin::InlineModule';
  requires 'Module::Build::InlineModule'
};

use constant DEV_PREREQS => sub {
  requires 'Inline::Module';
  requires 'C::Scan';
  requires 'Minilla';
  requires 'Minilla::Profile::ModuleBuildTiny';
  requires 'Perl::Critic';
  requires 'Perl::Tidy';
  requires 'App::perlimports';
  requires 'Perl::Critic::Community';
  requires 'Inline';
  requires 'Inline::C';
  requires 'Inline::MakeMaker';
  requires 'ExtUtils::MakeMaker';
  requires 'Dist::Zilla::Plugin::InlineModule';
  requires 'Module::Build::InlineModule';
  requires 'Module::Signature'
};

on 'build' => DEV_PREREQS;
on 'develop' => DEV_PREREQS;
