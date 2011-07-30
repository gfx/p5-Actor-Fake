package Actor::Fake;
use 5.008_001;
use Mouse::Role;

our $VERSION = '0.01';

requires 'act';

has name => (
    is       => 'rw',
    isa      => 'Str',
    required => 1,
);

has _actor_receiver => (
    is       => 'rw',
    isa      => 'CodeRef',
    writer   => 'receive',
    init_arg => undef,
);

sub send :method {
    my($self, @args) = @_;

    $self->act(); # should set _actor_receiver

    $self->_actor_receiver()->($self, @args);
}

no Mouse::Role;
1;
__END__

=head1 NAME"

Actor::Fake - Perl extention to do something

=head1 VERSION

This document describes Actor::Fake version 0.01.

=head1 SYNOPSIS

    use Actor::Fake;

=head1 DESCRIPTION

# TODO

=head1 INTERFACE

=head2 Functions

=head3 C<< hello() >>

# TODO

=head1 DEPENDENCIES

Perl 5.8.1 or later.

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 SEE ALSO

L<perl>

=head1 AUTHOR

Fuji, Goro (gfx) E<lt>gfuji@cpan.orgE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2011, Fuji, Goro (gfx). All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
