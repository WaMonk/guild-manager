
#
#   my @users = resultset('User')->all;
#    template 'users/index' => { users => \@users };
#

get '/api/user/info' => sub {
    my $out = {
        status => 'success',
        data   => {
            id   => '10',
            name => 'Test1'
        }
    };

    my $user = resultset('User')->search( { id => 1 } )->first();

    if ($user) {
        $out->{db} = {
            id   => $user->id,
            name => $user->name,
        };
    }

    return to_json $out;

};

