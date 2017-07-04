package GMan::Schema::Result;

use strict;
use warnings;

use parent qw(DBIx::Class::Core);

sub insert {
    my $self = shift;
    return $self->next::method(@_);
}

sub update {
    my $self = shift;
    return $self->next::method(@_);
}

1;