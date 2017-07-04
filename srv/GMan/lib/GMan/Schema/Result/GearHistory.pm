package GMan::Schema::Result::GearHistory;

use 5.020;

use parent qw/GMan::Schema::Result/;

__PACKAGE__->table('gear_history');
__PACKAGE__->add_columns(qw/id character_id encounter_id history_points_id date item/);
__PACKAGE__->set_primary_key('id');

1;
