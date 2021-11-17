#!/usr/bin/ruby
require 'cgi'

cgi = CGI.new("html5")

cgi.out {
   cgi.html {
      cgi.head { "\n"+cgi.title{"This Is Hello, Ruby!"} +
               "\n<link rel='stylesheet' type='text/css' href='/css'>" } +
      cgi.body { "\n"+
            cgi.h1 { "Hello, Ruby&hellip;" } + "\n"
      }
   }
}
