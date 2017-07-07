package GMan::Schema::Result::Auth;

use 5.020;

use parent qw/GMan::Schema::Result/;

__PACKAGE__->table('auth');
__PACKAGE__->add_columns(qw/user_id auth_token login/);

1;