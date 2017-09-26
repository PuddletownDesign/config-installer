#!/bin/bash

cd ~/Config/Installer
git fetch upstream
git checkout mac
git merge upstream/mac --no-edit

