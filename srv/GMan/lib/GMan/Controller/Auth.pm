
post '/auth/signin' => sub {
    my $params = encode_json( request->body );
    warn Dumper($params);

    ## check auth
    my $user_id = 100;
    session user => 100;

};

get '/auth/signin' => sub {

    #my $params = encode_json(request->body);
    warn Dumper( request->body );

    ## check auth
    my $user_id = 100;
    session user => 100;

    my $out = { status => 'success' };

    return to_json $out;

};

post '/auth/signup' => sub {
    my $params = encode_json( request->body );
    warn Dumper($params);

    ## reg user

};
