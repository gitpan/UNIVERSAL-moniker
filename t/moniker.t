#!/usr/bin/perl
use Test::More tests => 4;

require_ok 'UNIVERSAL::moniker';
is Bpm::User->moniker, "user";
is +(bless {}, "Bpm::Customer")->moniker, "customer";
is Bpm::Octopus->plural_moniker, "octopuses";
