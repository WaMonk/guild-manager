package GMan::Schema::Result::Encounter;

use 5.020;

use parent qw/GMan::Schema::Result/;

__PACKAGE__->table('encounters');
__PACKAGE__->add_columns(qw/id raid_id name description/);
__PACKAGE__->set_primary_key('id');

1;