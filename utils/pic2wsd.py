#!/usr/bin/env python3

'''A transpiler from PIC (as recognized by GNU `pic2plot`) to "WSD" as I call
it --- which is defined by <https://www.websequencediagrams.com/>.

Usage: Basically a Unix-style filter, interpreted using Python 3.

    $ cat some.pic | python {path to this script} > output.wsd

Then just dump the .wsd file into <https://www.websequencediagrams.com/>.

WSD language defined here:

    https://www.websequencediagrams.com/examples.html
'''

import re

pat_message_template = r'''^\s*{type}\(
    (?P<from>\w+),
    (?P<to>\w+),
    (?P<msg>.+)
    \);\s*$'''
pat_message = re.compile(
    pat_message_template.format(type='message'),
    re.VERBOSE)
pat_return_message = re.compile(
    pat_message_template.format(type='return_message'),
    re.VERBOSE)
# no pattern for matching the "active" and "inactive" PIC macros -- now it's
# generated automatically

while True:
    try:
        line = input()
        match = pat_message.search(line)
        if match:
            print("{}->>+{}: {}".format(
                match.group('from'),
                match.group('to'),
                match.group('msg')))
        else:
            match = pat_return_message.search(line)
            if match:
                print("{}-->>-{}: {}".format(
                    match.group('from'),
                    match.group('to'),
                    match.group('msg')))
    except EOFError:
        break
