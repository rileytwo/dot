#!/usr/bin/perl -w
exec "perldoc $0" unless @ARGV;
$_ = shift;
$, = " ";			# print @a will print $a[0]," ",$a[1] ...
s/([a-z]+)/\$$1/ig;		# Replace barewords by perl $variables
@a{$_ =~ /(\$\w+)/g} = 1;	# Get all variable names in @v
@v = sort keys %a;		# All the variables
@e = split /\s*,\s*/;
$e = join('." | ".',map({('sprintf("%-'.(length()-(y/$/$/)).'d",!!(('.$_.')*1))')} @e));
#print "\$e = '", $e, "'\n";
s/\s*,\s*/ | /g;
($t="@v  |  $_") =~ s/\$//g;	# Header
s/<=>/==/g;			# Replace logical <=> w/ arithmetic ==
s/=>/<=/g;			# Replace logical  => w/ arithmetic <=
($l=$t) =~ s/./-/g;		# Decoration : Separator line
print "\n\t$t\n\t$l\n";
eval join "",(map{"for $_ (0,1){"}@v),"print \"\\t@v  | \",$e,\"\\n\"","}"x@v, "\n";
print "\n";

=head1 ttable - Print truth table of a logical proposition

Prints the truth table of a logical proposition in which variable names
consist of any number of consecutive letters, true is 1, false is 0,
and operators are

  Not !     And &&    Or ||  

in that order of precedence. You may also use
 
  Then =>   Iff <=>

B<but their precedence is greater than that of "!" and they cannot be
chained>.

=head2 EXAMPLES

  >> ttable 'A && (B || A)'
 
        A B  |  A && (B || A)
        ---------------------
        0 0  |  0
        0 1  |  0
        1 0  |  1
        1 1  |  1
 
  >> ttable '(B && (B || A)) <=> B'
 
        A B  |  (B && (B || A)) <=> B
        -----------------------------
        0 0  |  1
        0 1  |  1
        1 0  |  1
        1 1  |  1
 
=head1 AUTHOR Etienne Grossmann E<lt>etienne@cs.uky.eduE<gt>

If you have never seen unreadable code, read this program's.

=cut
