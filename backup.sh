#!/bin/bash
type ./pre-backup.sh && ./pre-backup.sh
cd /data-dir/
git add -A && git commit -m "Daily backup"
git push
