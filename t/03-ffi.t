use Test2::V0;
use Test::Alien 1.90;
use lib -d '../t' ? './lib' : 't/lib';
use Alien::SDL2_image;
#
#skip_all 'requires a shared object or DLL'
#    unless Alien::SDL2_image->dynamic_libs;
#
#  nasty hack
#$ENV{LD_LIBRARY_PATH}   = Alien::SDL2_image->dist_dir . '/lib';
#$ENV{DYLD_LIBRARY_PATH} = Alien::SDL2_image->dist_dir . '/lib';
#
diag( 'dist_dir: ' . Alien::SDL2_image->dist_dir . '/lib' );
diag( 'libs: ' . Alien::SDL2_image->libs );
diag( 'cflags: ' . Alien::SDL2_image->cflags );
diag( 'cflags static: ' . Alien::SDL2_image->cflags_static );
eval { diag( 'Dynamic libs: ' . join ':', Alien::SDL2_image->dynamic_libs ); };
warn $@ if $@;
diag( 'bin dir: ' . join( ' ', Alien::SDL2_image->bin_dir ) );
alien_ok 'Alien::SDL2_image';

#if ( $^O eq 'MSWin32' ) {
my @libs = Alien::SDL2_image->dynamic_libs;

#diag
#    `nm --dynamic "D:\\a\\Alien-SDL2_image\\Alien-SDL2_image\\blib\\lib\\auto\\share\\dist\\Alien-SDL2_image\\dynamic\\SDL2_image.dll"`;

#}
ffi_ok {
    api => 1, symbols => ['IMG_Init'], experimental => 2,

    #lib => $libs[0],
    #[Alien::SDL2_image->dynamic_libs]
    # https://github.com/libsdl-org/SDL_image/issues/177#issuecomment-877629427
    },
    with_subtest {
    my ($ffi) = @_;
    my $init = $ffi->function( IMG_Init => ['int'] => 'int' )->call(0);
    ok !$init, 'IMG_Init(...) returns okay';
    };
#
done_testing;
