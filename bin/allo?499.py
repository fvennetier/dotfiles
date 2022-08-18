#!/usr/bin/env python

from __future__ import print_function
import sys
import urllib3


def read_url(url):
    http = urllib3.PoolManager()
    req = http.request('GET', url, preload_content=False)
    req.read(1024)
    for kv in sorted(req.info().items()):
        print("%s: %s" % kv)
    req.close()


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('usage: %s URL' % sys.argv[0])
    else:
        read_url(sys.argv[1])
