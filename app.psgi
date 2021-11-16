use strictures;
use utf8;
use Plack::Builder;
use Encode;
require Mojo::Server::PSGI;
require Plack::App::CGIBin;
require Plack::App::WrapCGI;

use lib "./MyCatalystApp/lib";
require MyCatalystApp;

my $root = sub {
    [ 200,
      [ "Content-Type" => "text/plain; charset=utf-8" ],
      [ encode_utf8("I \x{2763} Plack::Builder")  ] ];
};

my $cat_app = MyCatalystApp->psgi_app;

my $mojo_app = eval {
    my $server = Mojo::Server::PSGI->new;
    $server->load_app("./app/mojo.pl");
    $server->to_psgi_app;
};

my $cgi_app = Plack::App::CGIBin
    ->new( root => "./cgi" )
    ->to_app;

my $php = Plack::App::WrapCGI
    ->new( script => "/usr/bin/php ./cgi/hello.php",
           execute => 1 )
    ->to_app;

my $python = Plack::App::WrapCGI
    ->new( script => "./cgi/python.cgi",
           execute => 1 )
    ->to_app;

my $ruby = Plack::App::WrapCGI
    ->new( script => "./cgi/ruby.cgi",
           execute => 1 )
    ->to_app;

builder {
    enable "Rewrite", rules => sub {
        s,(?<=/cat)\z,/,; # Add trailing slash for Cat app’s root.
    };

    mount "/css" => Plack::App::File->new(file => "./static/css.css")->to_app;
    mount "/cat" => $cat_app;
    mount "/mojo" => $mojo_app;
    mount "/cgi" => $cgi_app;
    mount "/python" => $python;
    mount "/ruby" => $ruby;
    mount "/php" => $php;
    mount "/" => $root;
};

__END__
