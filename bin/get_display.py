#!/usr/bin/env python

import json
from subprocess import check_output
import unicodedata

out = check_output(["i3-msg", "-t", "get_workspaces"])
workspaces = json.loads(out.decode("utf-8"))
for i in workspaces:
    if i["focused"] == True:
        focused_workspace = i["output"]
focused_workspace = unicodedata.normalize('NFKD', focused_workspace).encode('ascii', 'ignore')
print(focused_workspace)
