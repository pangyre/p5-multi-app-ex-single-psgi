package MyCatalystApp::Controller::Root;
use Moose;
use namespace::autoclean;
BEGIN { extends "Catalyst::Controller" }

__PACKAGE__->config(namespace => "");

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    return $c->response->body("OHAI, CAT!");
    $c->response->print(<<"");
FINE!



}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( "Page not found" );
    $c->response->status(404);
}

# sub end : ActionClass("RenderView") {}

1;

__END__
