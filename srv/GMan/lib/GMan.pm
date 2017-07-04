package GMan;
use Dancer2;
use Dancer2::Plugin::DBIC;    #qw(schema resultset);

require GMan::Controller::Auth;
require GMan::Controller::Users;

use Data::Dumper;
our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

hook before => sub {

    if ( request->path_info =~ m{/api|auth/}   ) {
        content_type 'application/json';
    }

    if ( !session('user') && request->path_info !~ m{/auth} ) {
        send_error( "not allowed", 403 );
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
