
#
#   my @users = resultset('User')->all;
#    template 'users/index' => { users => \@users };
#


any ['get','post'] => '/api/user/info' => sub {



    my $out = {
        status => 'success',
        data   => {
            id   => '10',
            name => 'Test1'
        }
    };

    my $user = resultset('User')->search( { id => 1 } )->first();

    warn "USER INFO: ";
    warn Dumper(body_parameters);
    warn Dumper(request->body);

    if ($user) {
        $out->{db} = {
            id   => $user->id,
            name => $user->name,
        };
    }

    return to_json $out;

};

post '/api/user/auth' => sub {

    my $params = encode_json(request->body);
    warn Dumper($params);

};


