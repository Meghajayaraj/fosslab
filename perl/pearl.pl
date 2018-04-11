#!/usr/bin/perl
print "My name is Megha vk";
print	 	"Whitespaces and tabs don't matter\n";
$a = 4;
print "The data types are  Scalars Arrays Hashes\n";
print "a = $a\n";
print "Escape characters \" \' \$ \\ \n";

@array = (6,8,2);
print "Full array : @array\n";
print "Elements one by one : $array[0] $array[1] $array[2] \n";

%hash = ('a',1,'b',2,'c',3);
print "Hash elements one by one : $hash{'a'} $hash{'b'} $hash{'c'}\n";

$str = "meg"."ha";
print "Concatenated strings of abc, def : $str";

$add = 1 + 2;
$sub = 1 - 2;
$mul = 1 * 2;
$div = 1 / 2;
print "\nVarious operations : $add $sub $mul $div\n";

$multiline = "Abc
def
ghi";
print "Perl has multiline strings : $multiline \n";
