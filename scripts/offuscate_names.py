import os
import hmac
import base64
import glob
import hashlib
from itertools import izip
import csv

in_dir='/home/pabloa/imagenet_tiny/test'
out_dir='/home/pabloa/imagenet_tiny/test_o'
cats_file='/home/pabloa/imagenet_tiny/cats_o.csv'
key='gBWJPpeNYUeotZfCXacO'

os.chdir(in_dir)

imgs = glob.glob('*/*.JPEG')
hashes = [base64.urlsafe_b64encode(hmac.new(key,f,hashlib.sha1).hexdigest()) for f in imgs ]
for f,o in izip(imgs,hashes):
    os.symlink(os.path.join(in_dir,f),os.path.join(out_dir,o+".JPEG"))

with open(cats_file,"wb") as csv_file:
    w=csv.writer(csv_file)
    w.writerows(l for l in izip(hashes,(os.path.split(f)[0] for f in imgs)) )
