#!/usr/bin/env python

# Modified from https://github.com/tewtal/sm_practice_hack/blob/master/resources/create_dummies.py

import sys
import os

if sys.argv[1] == "":
	print("ff_file.py <ff_file>")
	sys.exit()
else:
	ff_name = sys.argv[1]

fo_f = open(os.path.dirname(os.path.realpath(__file__)) + "/" + ff_name, "wb")

fo_f.write(bytearray([0xff] * 1024 * 1024 * 3))

fo_f.close()
