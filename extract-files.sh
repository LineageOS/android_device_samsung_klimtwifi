#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

export DEVICE=klimtwifi
export DEVICE_COMMON=exynos5420-common
export VENDOR=samsung
export INITIAL_COPYRIGHT_YEAR=2016

if [ -z "$STOCK_ROM_DIR" ]; then
    if [ "$(adb root | grep -c 'adbd')" -eq 1  ]; then
	echo "adbd root: OK!"
	adb wait-for-device
    else
	echo "/system/bin/gpsd requires root privileges to be extracted"
	echo "root access is disabled by system setting - enable in settings -> development options"
	adb wait-for-device
	exit
    fi
fi

./../$DEVICE_COMMON/extract-files.sh $@
