#!/bin/bash
wget http://build.chromium.org/buildbot/snapshots/chromium-rel-mac/`wget -qO- http://build.chromium.org/buildbot/snapshots/chromium-rel-mac/LATEST | cat`/chrome-mac.zip
