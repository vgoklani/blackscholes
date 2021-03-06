CFLAGS=-fwrapv -fno-strict-aliasing -fomit-frame-pointer -O3 -Wall -Wstrict-prototypes -g

all: _blackscholes.so

_blackscholes.c: _blackscholes.pyx
	cython $<

_blackscholes.so: _blackscholes.c
	$(CC) $(CFLAGS) -pthread -shared -DNDEBUG -fPIC -I/usr/include/python2.6 -Wl,-O1 -Wl,-Bsymbolic-functions -o $@ $<

clean:
	$(RM) _blackscholes.so _blackscholes.c
