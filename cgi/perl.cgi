#!/usr/bin/env perl
use strict;
use warnings;
use CGI ":standard";

binmode STDOUT, ":encoding(UTF-8)";

print header("text/html; charset=utf-8"),
    start_html("\x{1F42A}"),
    h1("DERP! \x{1F42A}"),
    end_html();
