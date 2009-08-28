# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl IPC-Semaphore-Concurrency.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 3;
BEGIN { use_ok('IPC::Semaphore::Concurrency') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

system('rm -rf /tmp/.IPC::Semaphore::Concurrency.test*');

# Simple semaphore usage
my $c = IPC::Semaphore::Concurrency->new('/tmp/.IPC::Semaphore::Concurrency.test1.$$');
ok(defined($c), "Simple usage");

# Full semaphore usage
$c = IPC::Semaphore::Concurrency->new(
	path    => '/tmp/.IPC::Semaphore::Concurrency.test2.$$',
	touch   => 1,
	project => 8,
	count   => 20,
	value   => 1,
	);
ok(defined($c), "Full usage");


system('rm -rf /tmp/.IPC::Semaphore::Concurrency.test*');

