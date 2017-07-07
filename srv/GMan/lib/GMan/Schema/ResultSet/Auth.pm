package GMan::Schema::ResultSet::Auth;
use 5.020;
use Digest::MD5 qw(md5_base64);

use parent qw/GMan::Schema::ResultSet/;

sub check_auth {
    my ( $self, $login, $pwd, $salt ) = @_;

    my $token = $self->_create_token( $login, $pwd, $salt );
    my $sql = 'SELECT user_id FROM auth WHERE auth_token = ? AND login = ?';
    my $dbh = $self->result_source->schema->storage->dbh;

    my $sth = $dbh->prepare($sql);
    $sth->execute( $token, $login );
    my ($user_id) = $sth->fetchrow_array;
    $sth->finish;

    return $user_id;
}

sub create_auth {
    my ( $self, $login, $pwd, $salt, $user_id ) = @_;
    my $token = $self->_create_token( $login, $pwd, $salt );
    $self->create( { user_id => $user_id, auth_token => $token, login => $login } );
}

sub _create_token {
    my ( $self, $login, $pwd, $salt ) = @_;

    my $token = md5_base64( md5_base64($login) . $salt . md5_base64($pwd) );
    return $token;
}

1;
