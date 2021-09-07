use strict;
use warnings;
use Test::More;
use lib '../lib';
use Alien::SDL2_image;

diag "Install type: " . Alien::SDL2_image->install_type;

pass 'OK';

done_testing();
