use strict;
use warnings;
use ExtUtils::MakeMaker;

# Normalize version strings like 6.30_02 to 6.3002,
# so that we can do numerical comparisons on it.
my $eumm_version = $ExtUtils::MakeMaker::VERSION;
$eumm_version =~ s/_//;

WriteMakefile(
    NAME         => 'GMan',
    AUTHOR       => q{YOUR NAME <youremail@example.com>},
    VERSION_FROM => 'lib/GMan.pm',
    ABSTRACT     => 'YOUR APPLICATION ABSTRACT',
    (   $eumm_version >= 6.3001
        ? ( 'LICENSE' => 'perl' )
        : ()
    ),
    PL_FILES  => {},
    PREREQ_PM => {
        'Test::More'                  => 0,
        'YAML'                        => 0,
        'Dancer2'                     => 0.11,
        'Dancer2::Plugin::Database'   => 0,
        'Dancer2::Plugin::Auth::Tiny' => 0,
        'Dancer2::Plugin::DBIC'       => 0,
        'JSON::XS'                    => 0,
        'Panda::Export'               => 0,
        'DBD::Pg'                     => 0,
        'Digest::MD5'                 => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'GMan-*' },
);
