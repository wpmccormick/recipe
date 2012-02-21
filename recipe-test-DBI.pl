#!/usr/bin/perl -w

use strict;

use Time::HiRes qw( clock );

my $ticktock;
my $tick;
my $start;

BEGIN {
	print qq/***** Start Test *****\n/;
	$start = clock();
	print qq/Start: $start\n/;
}

use DBI;
use DBD::SQLite;

$tick = clock();
$ticktock = $tick - $start;
print qq/Load Use: $ticktock\n/;


my $recipes_sql = q/SELECT * FROM recipe/;
	
my $dbfile="/home/fiber/data/recipe.db3";

my $dbh = DBI->connect("dbi:SQLite:$dbfile") or croak $DBI::errstr;

$tick = clock();
$ticktock = $tick - $start;
print qq/Connect: $ticktock\n/;

my $recipe_ary_ref  = $dbh->selectall_arrayref($recipes_sql,{ Slice => {} });

$tick = clock();
$ticktock = $tick - $start;
print qq/Query: $ticktock\n/;

foreach my $recipe ( @$recipe_ary_ref ) {
	print qq/$recipe->{ID} $recipe->{NAME}\n/;
}

$tick = clock();
$ticktock = $tick - $start;
print qq/print: $ticktock\n/;
