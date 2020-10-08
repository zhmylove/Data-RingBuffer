#!perl -T
use 5.008;
use strict;
use warnings FATAL => 'all';
use Test::More;

use Data::RingBuffer;

plan tests => 16;

my $rb = Data::RingBuffer->new(16);

$rb->push($_) for 1..32;

my $start = 17; # 32 - size + 1
ok($_ == $start++, "") while defined($_ = $rb->get());
