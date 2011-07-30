#!perl
use 5.14.0;
use strict;
use warnings;

package FibActor {
    use Mouse;
    with 'Actor::Fake';

    sub act {
        my($self) = @_;
        $self->receive(sub {
            my($self, $n) = @_;
            say $self->name, ': ', $self->fib($n);
        });
    }

    sub fib {
        my($self, $n) = @_;
        given($n) {
            when(0) {
                return 1;
            }
            when(1) {
                return 1;
            }
            defualt {
                return $self->fib($n - 1) + $self->fib($n - 2);
            }
        }
    }
}

foreach my $n(1, 5, 10, 20) {
    my $fibactor = FibActor->new(name => "fib($n)");
    $fibactor->start();
    $fibactor->send($n);
}

