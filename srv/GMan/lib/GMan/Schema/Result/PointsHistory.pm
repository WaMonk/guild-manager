package GMan::Schema::Result::PointsHistory;

use 5.020;

use parent qw/GMan::Schema::Result/;

__PACKAGE__->table('points_history');
__PACKAGE__->add_columns(qw/user_id character_id raid_id value reason/);

1;
