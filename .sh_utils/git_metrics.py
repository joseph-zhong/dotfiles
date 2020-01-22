#!/usr/bin/env python
"""
git_awesome_status.py
---

    Adapted from https://github.com/sr228822/srpub
"""

import operator
import sys

# A map of known aliases -> name
from sh_utils import dur_to_human, cmd

kauths = {}

# A map of kname to longest-name
longname = {}

class TimeRange:
    def __init__(self, start, end):
        self.start = start
        self.end = end

all_cnt = {}
all_tim = TimeRange(9999999999, 0)
sme_cnt = {}
sme_tim = TimeRange(9999999999, 0)
l100_cnt = {}
l100_tim = TimeRange(9999999999, 0)

overall = False
MY_NAME = "joseph zhong"
if len(sys.argv) > 1:
    if sys.argv[1] == "overall":
        overall = True
        MY_NAME = "zzzzzzzzzzz"
    else:
        MY_NAME = sys.argv[1]
STRIP_PREFX = "ctrl"

def looks_similar(a, b):
    a = a.lower().strip()
    b = b.lower().strip()
    if a == b:
        return True
    words_a = a.split(" ")
    words_b = b.split(" ")
    if len(words_a) != len(words_b):
        return False
    for idx in range(len(words_a)):
        if words_a[idx] in words_b[idx] or words_b[idx] in words_a[idx]:
            continue
        return False
    return True

def put_in_known(name, email):
    global kauths
    name = name
    email = email

    # if we have both the name and email, we're done
    if name in kauths and email in kauths:
        #if kauths[name] == kauths[email]:
        #    return
        return

    if name in kauths:
        # we have the name, but not the email
        kauths[email] = kauths[name]
        return

    if email in kauths:
        # we have the email, but not the name
        kauths[name] = kauths[email]
        return

    # we have neither the exact email nor exact name
    found = False
    for other_auth in kauths.keys():
        if looks_similar(name, other_auth):
            kauths[name] = kauths[other_auth]
            kauths[email] = kauths[other_auth]
            return

    # we did not find any similar name matches
    # so add a new entry
    fname = name
    if name.startswith(STRIP_PREFX):
        fname = name[len(STRIP_PREFX):]
    kauths[name] = fname
    kauths[email] = fname

def get_aliases(name, emails=True):
    global kauths
    res = {}
    for k, v in kauths.items():
        if v == name:
            if "@" in k or not emails:
                res[k] = True
    return res.keys()

def print_cnt_dict(title, cnts, tim, limit=10):
    sorted_x = sorted(cnts.items(), key=operator.itemgetter(1), reverse=True)
    did_me = False
    total_time = (tim.end - tim.start)
    print("\n\n=== {} === \t ({})".format(title, dur_to_human(total_time)))
    print("%3s" % "" + "  " + "%5s" % "cnt " + " " + "/week" + " " + "name")
    print("%3s" % "" + "  " + "%5s" % "--- " + " " + "-----" + " " + "----")
    for i, x in enumerate(sorted_x):
        kname = x[0]
        is_me = looks_similar(kname, MY_NAME)
        name = longname[kname].title()
        if is_me:
            did_me = True
            name = blue_str(name)
        cnt = x[1]
        rate = (float(cnt) / (total_time / 604800))
        if i == limit:
            if did_me:
                break
            else:
                print("                  ...")
        if i >= limit and not is_me:
            continue
        print("%3d" % (i+1) + ". " + "%5d  " % cnt + " %.1f " % rate + " {0: <20}".format(name))

git_log_raw = cmd("git log master --format='%H,%aN,%ae,%at'")

seen_me = False
commits = git_log_raw.split('\n')
for i, c in enumerate(reversed(commits)):
    cs = c.strip().split(',')
    if len(cs) != 4:
        continue
    sha = cs[0].strip()
    name = cs[1].strip().lower()
    email = cs[2].strip().lower()
    dt = int(cs[3].strip())

    is_mine = looks_similar(name, MY_NAME)
    if is_mine:
        seen_me = True

    put_in_known(name, email)
    kname = kauths[name]

    # set the longest-name which kname maps to
    if kname not in longname:
        longname[kname] = kname
    if len(name) >len( longname[kname]):
        longname[kname] = name

    all_cnt[kname] = all_cnt.get(kname, 0) + 1
    all_tim.start = min(all_tim.start, dt)
    all_tim.end = max(all_tim.end, dt)
    if seen_me:
        sme_cnt[kname] = sme_cnt.get(kname, 0) + 1
        sme_tim.start = min(sme_tim.start, dt)
        sme_tim.end = max(sme_tim.end, dt)
    if i > len(commits) - 100:
        l100_cnt[kname] = l100_cnt.get(kname, 0) + 1
        l100_tim.start = min(l100_tim.start, dt)
        l100_tim.end = max(l100_tim.end, dt)

#print("\n\n== kauth map ==")
#for k,v in kauths.items():
#    print("%50s" % k, "   ", "%50s" % v)

#print("\n\n== kauth map ==")
#for k,v in all_cnt.items():
#    print("%50s" % k, "   ", "%50s" % v)

if overall:
    print_cnt_dict("Overall", all_cnt, all_tim, limit=100)
else:
    # print personalized
    print_cnt_dict("Overall", all_cnt, all_tim)
    print_cnt_dict("Since-First", sme_cnt, sme_tim)
    print_cnt_dict("Last 100", l100_cnt, l100_tim)
