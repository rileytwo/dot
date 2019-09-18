#!/bin/sh
SED=$(if [ -x /usr/bin/sed ]; then echo /usr/bin/sed; else which sed; fi)

function ValidateOtherKexts
{
	if [[ $(echo $(kextutil -t -v 0 /System/Library/Extensions/AppleGraphicsControl.kext 2>&1 >/dev/null)) == "" \
	&& $(echo $(kextutil -t -v 0 /System/Library/Extensions/AppleGraphicsControl.kext/Contents/PlugIns/AppleGPUWrangler.kext 2>&1 >/dev/null)) == "" \
	&& $(echo $(kextutil -t -v 0 /System/Library/Extensions/AppleGraphicsControl.kext/Contents/PlugIns/AppleGraphicsDevicePolicy.kext 2>&1 >/dev/null)) == "" \
	&& $(echo $(kextutil -t -v 0 /System/Library/Extensions/IOGraphicsFamily.kext 2>&1 >/dev/null)) == "" \
	&& $(echo $(kextutil -t -v 0 /System/Library/Extensions/IONDRVSupport.kext 2>&1 >/dev/null)) == "" ]]
	then
		return 0
	else
		return 1
	fi
}

if [[ ! $(ValidateOtherKexts && echo 1) ]]
then
	echo "Invalid system kext found."
else
	echo "No modified kexts found. Your system is clean."
fi
