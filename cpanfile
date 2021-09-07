on 'runtime' => sub {
    requires 'perl' => '5.008001';
    requires 'strict';
    requires 'warnings';
    requires 'base';
    requires 'Alien::Base' => '2.40';
};

requires 'ExtUtils::MakeMaker' , '7.1101';

on 'configure' => sub {
    requires 'Alien::Build' => '2.40';
    requires 'Alien::Build::MM' => '2.40';
    requires 'Alien::Build::Plugin::Build::Make' => '2.40';
    #requires 'Alien::Build::Plugin::Probe::Vcpkg' => '2.40';
    requires 'ExtUtils::MakeMaker' , '7.1101';
	requires 'Alien::libsdl2', '== 1.06';
};

on 'build' => sub {
    requires 'Alien::Build' => '2.40';
    requires 'Alien::Build::Plugin::Build::Autoconf' => '2.40';
    requires 'Alien::Build::Plugin::Build::Make' => '2.40';
	requires 'Alien::gmake';
    #requires 'Alien::Build::Plugin::Probe::Vcpkg' => '2.40';
    requires 'Config';
    requires 'ExtUtils::MakeMaker' , '7.1101';
    requires 'IPC::Cmd';
    requires 'Sort::Versions';
	requires 'Alien::libsdl2', '== 1.06';
};

on 'test' => sub {
    requires 'Test::Alien';
    requires 'Test::More' => '0.88';
    requires 'Test2::Suite';
    requires 'Test2::V0';
    requires 'FFI::Platypus';
};

on 'develop' => sub {
    requires 'Dist::Zilla';
    requires 'Test::CheckManifest' => '1.29';
    requires 'Test::CPAN::Changes' => '0.4';
    requires 'Test::Kwalitee'      => '1.22';
};