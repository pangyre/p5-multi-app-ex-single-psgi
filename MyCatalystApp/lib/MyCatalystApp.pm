package MyCatalystApp;
use Moose;
use namespace::autoclean;
use Catalyst::Runtime 5.80;

use Catalyst;
extends "Catalyst";
our $VERSION = "0.01";

__PACKAGE__->config(
    name => "MyCatalystApp",
    enable_catalyst_header => 1, # Send X-Catalyst header
);

__PACKAGE__->setup();

__END__
