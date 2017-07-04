package GMan::Schema::Result::User;

use 5.020;

use parent qw/GMan::Schema::Result/;

__PACKAGE__->table('users');
__PACKAGE__->add_columns(qw/id name email role points/);

1;