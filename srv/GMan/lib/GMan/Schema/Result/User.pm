package GMan::Schema::Result::User;

use 5.020;

use parent qw/GMan::Schema::Result/;

__PACKAGE__->table('users');
__PACKAGE__->add_columns(qw/id name email role points status/);
__PACKAGE__->set_primary_key('id');

1;
