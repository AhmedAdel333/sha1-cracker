# sha1 dictionary crack test
# admin :: d033e22ae348aeb5660fc2140aec35850c4da997

use feature 'say';

use Digest::SHA qw( sha1_hex );

my $hash = $ARGV[0];
my $pass_list = $ARGV[1];

open(p, $pass_list) or die "cannot open the list";
my @pass_array = <p>;
close(p);

sub SHA1_method{
	my ($var1, $var2) = @_;
	foreach my $line (@pass_array) {
		$line =~ s/\n//;
		my $sha1_out = sha1_hex($line);
		if ($sha1_out eq $hash) {
			say "[+] sha1 hash cracked: $line";
			last;
		}
		else {
			say "[-] failed: $line";
		}
	}
}
SHA1_method($hash, @pass_array)