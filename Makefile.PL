#!/usr/bin/perl -w
use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'UNIVERSAL::moniker',
    'VERSION_FROM'	=> 'moniker.pm',
    'PREREQ_PM' => { 'Lingua::EN::Inflect' => '1.88', },
);
