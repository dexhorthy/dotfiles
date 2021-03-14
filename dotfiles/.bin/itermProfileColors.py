#!/usr/bin/env python
import os
import sys
import plistlib

"""
    A Script to read in an iterm2 plist and
    dump the colors for a profile by name.
"""

def get_name(argv):
    if len(argv) > 1:
        return argv[1]
    else:
        return 'Pearl'

path = os.path.join(
    os.environ.get("HOME"),
    'meta',
    'iterm',
    'com.googlecode.iterm2.plist'
)


RED = 'Red Component'
GREEN = 'Green Component'
BLUE = 'Blue Component'

def encode(color_dict):
    r = int(256 * color_dict.get(RED) - 1)
    g = int(256 * color_dict.get(GREEN) - 1)
    b = int(256 * color_dict.get(BLUE) -1 )
    return r,g,b

def to_hex_duple(byte):
    h = hex(byte)
    if byte < 1:
        return '00'
    elif len(h) == 3:
        ret = '0' + h[-1]
    else:
        ret = h[2:]

    return ret

def to_hex(r,g,b):
    return reduce(
        lambda x,y: x + y,
        map(
            to_hex_duple,
            [r,g,b]
        )
    )


def main():
    plist_file = plistlib.readPlist(path)
    profiles = plist_file['New Bookmarks']
    target_profile = filter(
        lambda n: n.get('Name') == get_name(sys.argv),
        profiles
    )

    if len(target_profile) != 1:
        raise ValueError("Found %s profiles with name %s, profiles were %s"
                         % (len(target_profile), get_name(sys.argv), map(lambda n: n.get('Name'), profiles)))



    for col, components in target_profile[0].items():
        if 'color' in col.lower():
            print col
            try:
                print to_hex(*encode(components))
            except:
                print components
            print

if __name__ == '__main__':
    main()

