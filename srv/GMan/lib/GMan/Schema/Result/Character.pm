package GMan::Schema::Result::Character;

use 5.020;

use parent qw/GMan::Schema::Result/;

__PACKAGE__->table('characters');
__PACKAGE__->add_columns(qw/id user_id nickname race class/);
__PACKAGE__->set_primary_key('id');

1;