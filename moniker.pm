package UNIVERSAL::moniker;
$UNIVERSAL::moniker::VERSION = '0.05';

=head1 NAME

UNIVERSAL::moniker

=head1 SYNOPSIS

  use UNIVERSAL::moniker;

=head1 DESCRIPTION

Class names in Perl often don't sound great when spoken, or look good when
written in prose.  For this reason, we tend to say things like "customer" or
"basket" when we are referring to C<My::Site::User::Customer> or
C<My::Site::Shop::Basket>.  We thought it would be nice if our classes knew what
we would prefer to call them.

This module will add a C<moniker> (and C<plural_moniker>) method to
C<UNIVERSAL>, and so to every class or module.

=head2 moniker

  $ob->moniker;

Returns the moniker for $ob.
So, if $ob->isa("Big::Scary::Animal"), C<moniker> will return "animal".

=head2 plural_moniker

  $ob->plural_moniker;

Returns the plural moniker for $ob.
So, if $ob->isa("Cephalopod::Octopus"), C<plural_moniker> will return "octopuses".

=cut

package UNIVERSAL;

sub moniker {
	my ($self) = @_;
        my @parts = split /::/, (ref($self) || $self);
	return lc pop @parts;
}

sub plural_moniker {
	require Lingua::EN::Inflect;
	return Lingua::EN::Inflect::PL($_[0]->moniker);
}

=head1 AUTHOR

Marty Pauley <marty+perl@kasei.com>,
Tony Bowden <tony@kasei.com>,

=head1 COPYRIGHT

  Copyright (C) 2003 Kasei

  This program is free software; you can redistribute it under the same terms as
  Perl.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE.

=cut


1;
