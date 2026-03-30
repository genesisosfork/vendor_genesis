# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
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

# -----------------------------------------------------------------
# Genesis OTA update package

GENESIS_TARGET_PACKAGE := $(PRODUCT_OUT)/$(GENESIS_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

$(GENESIS_TARGET_PACKAGE): $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(GENESIS_TARGET_PACKAGE)
	$(hide) $(SHA256) $(GENESIS_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(GENESIS_TARGET_PACKAGE).sha256sum
	echo -e "${CL_BLD}${CL_GRN}================================================================================${CL_RST}" >&2
	echo -e "" >&2
	echo -e "${CL_BLD}${CL_WHT}Package:${CL_RST}  ${CL_BLD}${CL_YEL}$(notdir $(GENESIS_TARGET_PACKAGE))${CL_RST}" >&2
	echo -e "${CL_BLD}${CL_WHT}Location:${CL_RST} ${CL_BLD}${CL_BLU}$(dir $(GENESIS_TARGET_PACKAGE))${CL_RST}" >&2
	echo -e "${CL_BLD}${CL_WHT}Size:${CL_RST}     ${CL_BLD}${CL_YEL}$(shell du -h $(GENESIS_TARGET_PACKAGE) | cut -f1)${CL_RST}" >&2
	echo -e "${CL_BLD}${CL_WHT}Finished At:${CL_RST} ${CL_BLD}${CL_MAG}$(shell date '+%Y-%m-%d %H:%M:%S')${CL_RST}" >&2
	echo -e "" >&2
	echo -e "${CL_BLD}${CL_GRN}=============================================================================${CL_RST}" >&2

.PHONY: genesis
genesis: $(GENESIS_TARGET_PACKAGE) $(DEFAULT_GOAL)
