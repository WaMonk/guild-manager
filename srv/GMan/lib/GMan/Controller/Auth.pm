use Data::Dumper;

post '/auth/signin' => sub {
    my $params = decode_json( request->body );
    ## check auth

    my $result = resultset('Auth')->check_auth( $params->{login}, $params->{password}, config->{auth}{salt} );
    my $out;

    if ($result) {
        session user => { user_id => $result };
        $out = { status => 'success' };
    }
    else {
        $out = { status => 'error', message => 'wrong auth data' };
        response->status(500);
    }

    return to_json $out;
};

post '/auth/signup' => sub {
    my $params = decode_json( request->body );

    my $out;
    my $user_params = [qw/login password name email/];

    my $data      = {};
    my $has_error = undef;

    foreach my $param (@$user_params) {
        unless ( defined $params->{$param} ) {
            $has_error = "param: '$param' is required";
            last;
        }
        next if $param eq 'login' || $param eq 'password';
        $data->{$param} = $params->{$param};
    }

    if ($has_error) {
        $out = { status => 'error', message => $has_error };
        response->status(500);
        return to_json $out;
    }

    my $has_login = resultset('Auth')->search( { login => $params->{login} } )->first;

    if ($has_login) {
        $out = { status => 'error', message => 'login already used' };
        response->status(500);
        return to_json $out;
    }

    my $result = resultset('User')->create($data);

    unless ($result) {
        $out = { status => 'error', message => 'not a created user' };
        response->status(500);
        return to_json $out;
    }

    resultset('Auth')->create_auth( $params->{login}, $params->{password}, config->{auth}{salt}, $result->id );
    session user => { user_id => $result->id };

    $out = { status => 'success' };
    return to_json $out;

};

get '/auth/signup_bnet' => sub {

    warn Dumper config->{bnet};

    #my $client_id = '';
};

get '/auth/exit' => sub {
    app->destroy_session;
    my $out = { status => 'success' };

    return to_json $out;

};
