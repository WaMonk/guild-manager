package GMan::Schema::Result::Gear;

use 5.020;

use parent qw/GMan::Schema::Result/;

__PACKAGE__->table('gear');
__PACKAGE__->add_columns(qw/id character_id raid_id spec stats gear/);
__PACKAGE__->set_primary_key('id');

1;