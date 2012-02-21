#!/usr/bin/perl -w

use strict;
#use warnings;
use Time::HiRes qw( clock );

use lib '/home/fiber/data';

my $ticktock;
my $tick;
my $start;

BEGIN {
	print qq/***** Start Test *****\n/;
	$start = clock();
	print qq/Start: $start\n/;
}

# Connect to your database.
use FibeRio::Schema;

$tick = clock();
$ticktock = $tick - $start;
print qq/Load Use: $ticktock\n/;


my $dbfile  = qq(/home/fiber/data/recipe.db3);
my $dbi     = qq(dbi:SQLite);
my $dbi_dsn = qq($dbi:$dbfile);

my $user = undef;
my $pass = undef;
#my %dbi_params = undef;

my $schema = FibeRio::Schema->connect($dbi_dsn) || die "Cannot connect to $dbi_dsn\n";

$tick = clock();
$ticktock = $tick - $start;
print qq/Connect: $ticktock\n/;


 # Query for all recipes and put them in an array,
 # or retrieve them as a result set object.
 # $schema->resultset returns a DBIx::Class::ResultSet
 my @all_recipes = $schema->resultset('Recipe')->all;
 #my $all_recipes_rs = $schema->resultset('Recipe');

$tick = clock();
$ticktock = $tick - $start;
print qq/Query: $ticktock\n/;

 # Output all artists names
 # $artist here is a DBIx::Class::Row, which has accessors
 # for all its columns. Rows are also subclasses of your Result class.
 foreach my $recipe (@all_recipes) {
	print $recipe->NAME, "\n";
 }

$tick = clock();
$ticktock = $tick - $start;
print qq/Complete: $ticktock\n/;
