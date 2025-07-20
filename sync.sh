#!/bin/bash
# Sync Firefox profile to S3/Dropbox (run hourly via cron)
rclone sync /config remote:bucket/firefox-profiles --progress
