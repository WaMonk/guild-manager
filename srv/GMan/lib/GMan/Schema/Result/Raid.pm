package GMan::Schema::Result::Raid;

use 5.020;

use parent qw/GMan::Schema::Result/;

__PACKAGE__->table('raids');
__PACKAGE__->add_columns(qw/id name/);
__PACKAGE__->set_primary_key('id');

1;