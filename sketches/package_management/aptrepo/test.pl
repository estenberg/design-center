#!/usr/bin/perl

use warnings;
use strict;

use lib "../../libraries/dclib";
use dctest;

my $todo = {
            "metadata check 1" => qr/R: cfdc_aptrepo:wipe: Repository::apt::Maintain/,
            "metadata check 2" => qr/R: cfdc_aptrepo:ensure: Repository::apt::Maintain/,
            "wipe 1" => qr,wiping file /tmp/etc/apt/sources.list.d/contrib-debian-wheezy.list,,
            "ensure 1" => qr,\Qensuring line deb  http://http.us.debian.org/debian/ main wheezy,,
            "ensure 2" => qr,\Qensuring line deb [ arch=amd64 trusted=no ] http://bogus-repository/bogus-path main comp1 comp2,,
            "return 001" => qr|___001_Repository_apt_Maintain_wipe returned file = /tmp/etc/apt/sources.list.d/contrib-debian-wheezy.list|,
            "return 002" => qr|___002_Repository_apt_Maintain_ensure returned file = /tmp/etc/apt/sources.list|,
            "return 003" => qr|___003_Repository_apt_Maintain_ensure returned file = /tmp/etc/apt/sources.list|,
            "return 004" => qr|___004_Repository_apt_Maintain_ensure returned file = /tmp/etc/apt/sources.list.d/contrib-debian-wheezy.list|,
            "return 005" => qr|___005_Repository_apt_Maintain_ensure returned file = /tmp/etc/apt/sources.list.d/universe-ubuntu-precise.list|,
           };

my $output = dctest::setup('./test.cf', $todo);

dctest::matchall($output, $todo);
