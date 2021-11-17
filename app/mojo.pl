use Mojolicious::Lite;

get "/" => sub {
    my $c = shift;
    $c->render(text => "OHAI! \x{1F984}");
};

app->start;
