package Minilla;
use strict;
use warnings;
use 5.008005;
use version; our $VERSION = version->declare("v0.0.53");

our $DEBUG;
our $AUTO_INSTALL;

sub debug { $DEBUG }
sub auto_install { $AUTO_INSTALL }

1;
__END__

=encoding utf8

=head1 NAME

Minilla - CPAN module authoring tool

=head1 SYNOPSIS

    minil new     - Create a new dist
    minil test    - Run test cases
    minil dist    - Make your dist tarball
    minil install - Install your dist
    minil release - Release your dist to CPAN

=head1 DESCRIPTION

Minilla is a CPAN module authoring tool. Minilla provides L<minil> command for authorizing a CPAN distribution.

    (M::I - inc) + shipit + (dzil - plugins)

B<THIS IS A DEVELOPMENT RELEASE. API MAY CHANGE WITHOUT NOTICE>.

=head1 MOTIVATION

=head1 CONVENTION

As stated above, Minilla is opinionated. Minilla has a bold assumption and convention like the followings, which are almost compatible to the sister project L<Dist::Milla>.

=over 4

=item Your module written in Pure Perl are located in I<lib/>.

=item Your executable file is in I<script/> directory, if any

=item Your module is maintained with B<Git> and C<git ls-files> matches with what you will release

=item Your module has a static list of prerequisites that can be described in L<cpanfile>

=item Your module has a Changes file

=back

=head1 GETTING STARTED

    # First time only
    % cpanm Minilla
    # Minilla has only a few deps. It should be very quick

    # Make a new distribution
    % minil new Dist-Name
    % cd Dist-Name/

    # Git commit
    % git commit -m "initial commit"

    # Hack your code!
    % $EDITOR lib/Dist/Name.pm t/dist-name.t cpanfile

    # Done? Test and release it!
    % minil release

It's that easy.

You already have distributions with L<Module::Install>, L<Module::Build>, L<Dist::Zilla> or L<ShipIt>? Migrating is also trivial. See "MIGRATING" in L<Minilla::Tutorial> for more details.

=head1 WHY MINILLA?

=head2 Repository managed by Minilla is git install ready.

The repository created and managed by Minilla is git install ready.
You can install the library by C<< cpanm git://... >>.

Of course, you can install Minilla from C<< cpanm git://github.com/tokuhirom/Minilla.git >>.

=head2 Minilla is built on small libraries.

Minilla is built on only few small libraries. You can install Minilla without a huge list of dependencies to heavy modules.

=head2 And, what is Minilla?

    Minilla is a Kaiju (Japanese giant monster) from the Godzilla series of films and is the first of several young Godzillas.
    http://en.wikipedia.org/wiki/Minilla

=head1 CONFIGURATION

Minilla uses B<Convention over Configuration>.

But, you can write configurations to I<minil.toml> file in L<TOML|https://github.com/mojombo/toml> format. Minilla reads the I<minil.toml> file in the root directory of your project.

=over 4

=item name

You can write 'name' instead of automatically detecting project name out of the directory name.

=item no_github_issues

Minilla sets bugtracker as github issues by default. But if you want to use RT, you can set this variable.

=back

=head1 FAQ

=over 4

=item Why don't you provide plugin support?

If you want to pluggable thing, it's already exist dzil :P
And if you like a behavior like Minilla, you can use L<Dist::Milla>, the sister project of Minilla.
L<Dist::Milla>'s behavior is mostly like Minilla.

=item Why minil only supports git?

I think git is a best VC for CPAN modules, for now.

If you want to use another version control system, you can probably use L<Dist::Milla>.

=item And why...

Yes. You can use L<Dist::Milla>.

=item Should I add (META.json|Build.PL) to repository?

Yes. You need to add it to make your git repo installable via cpanm.

=item How do I manage ppport.h?

Is there a reason to remove ppport.h from repo?

=item How can I install script files?

Your executables must be in F<script/>. It's L<Module::Build::Tiny>'s rule.

=item How to switch from Module::Install/Module::Build/Dist::Zilla?

You can use experimental `minil migrate` subcommand.
See L<Minilla::CLI::Migrate> for more details.

=back

=head1 AUTHORS

Tokuhiro Matsuno E<lt> tokuhirom @ gmail.com E<gt>

Tatsuhiko Miyagawa

=head1 THANKS TO

RJBS, the author of L<Dist::Zilla>. L<Dist::Zilla> points CPAN authorizing tool.

=head1 SEE ALSO

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
