package GMan;
use Dancer2;
use Dancer2::Plugin::DBIC;

require GMan::Controller::Auth;
require GMan::Controller::Users;

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

hook before => sub {

    if ( request->path_info =~ m{/api|auth/}   ) {
        content_type 'application/json';
    }

    if ( !session('user') && request->path_info =~ m{/api} ) {
        send_error( "not allowed", 403 );
    }

};

true;