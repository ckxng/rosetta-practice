#!/usr/bin/perl -T
use strict;
use warnings;
use 5.005;

=head1 NAME

100 Doors

=head1 METHODS

=head2 create_doors

Returns a 100 element long arrayref where every element is populated with
the value 0.  A 0 is representative of a closed door.

=cut
sub create_doors {
  my $d = [];
  for(my $i=0; $i<100; $i++) {
    @$d[$i]=0;
  }
  return $d;
}

=head2 toggle_doors($doors, $skip)

Toggle every other $skip doors in the $doors arrayref. (If the door
is closed, open it.  If the door is open, close it.)

If $skip is 1, visit door #1, #2, #3...
If $skip is 2, visit door #2, #4, #6...

    $doors      arrayref where elements evaluating to false represent
                closed doors and elements evaluating to true represent
                open doors
    $skip       number of doors to skip when toggling

Retuns $doors

=cut
sub toggle_doors {
  my $d = shift or die "toggle_doors: missing param \$d\n";
  my $skip = shift or die "toggle_doors: missing param \$skip\n";
  die "toggle_doors: \$d is not an arrayref\n" unless ref($d) eq "ARRAY";
  die "toggle_doors: \$skip is not a number\n" unless $skip eq ($skip*1);
  die "toggle_doors: \$skip cannot be negative\n" if $skip < 0;
  for(my $i=$skip-1; $i<=$#{$d}; $i+=$skip) {
    if(@$d[$i]) {
      @$d[$i] = 0;
    } else {
      @$d[$i] = 1;
    }
  }
  return $d;
}

=head2 print_doors($ar)

Display true or false state of every element in an arrayref.

    $ar         an arrayref

=cut
sub print_doors {
  my $ar = shift or die "print_doors: missing param \$ar\n";
  print "[";
  for(my $i=0; $i<=$#{$ar}; $i++) {
    printf "%d", @$ar[$i]?1:0;
    print "," if $i<$#{$ar};
  }
  print "]\n";
}

=head2 main

Create doors, flip every door, then every other door, then every
third door, to 100.  Print the final door states.

=cut
sub main {
  my $doors = create_doors();
  for(my $i=0; $i<100; $i++) {
    toggle_doors($doors, $i+1);
  }
  print_doors($doors);
}

main();
