package GMan;
use Dancer2;
use Dancer2::Plugin::DBIC; #qw(schema resultset);

require GMan::Controller::Users;

use Data::Dumper;
our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

hook before => sub {
    if ( !session('user') && request->path_info !~ m{^/login} ) {
        var requested_path => request->path_info;
        request->path_info('/login');
    }

    if ( request->path_info =~ m/^\/api\// ) {
        content_type 'application/json';

        my $p = request->parameters;
        warn Dumper($p); 

    }
};



get '/login' => sub {

    # Display a login page; the original URL they requested is available as
    # vars->{requested_path}, so could be put in a hidden field in the form
    template 'login', { path => vars->{requested_path} };
};

post '/login' => sub {

    # Validate the username and password they supplied
    if ( params->{user} eq 'bob' && params->{pass} eq 'letmein' ) {
        session user => params->{user};
        redirect params->{path} || '/';
    }
    else {
        redirect '/login?failed=1';
    }
};

true;
