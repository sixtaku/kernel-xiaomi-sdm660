#!/bin/bash

export KERNELNAME=Moonlight

export LOCALVERSION=rebase-Izanagi

export KBUILD_BUILD_USER=Frost

export KBUILD_BUILD_HOST=Otaku

export TOOLCHAIN=clang

export DEVICES=whyred

export CI_ID=-1001463706805

export GROUP_ID=-1001401101008

source helper

gen_toolchain

send_msg "⏳ Start building ${KERNELNAME} ${LOCALVERSION} | DEVICES: whyred - tulip - lavender - wayne - jasmine"

send_pesan "⏳ Start building ${KERNELNAME} ${LOCALVERSION} | DEVICES: whyred - tulip - lavender - wayne - jasmine"

START=$(date +"%s")

for i in ${DEVICES//,/ }
do
	build ${i} -oldcam

	build ${i} -newcam
done

send_msg "⏳ Start building Overclock version | DEVICES: whyred - tulip"

send_pesan "⏳ Start building Overclock version | DEVICES: whyred - tulip"

git apply oc.patch

for i in ${DEVICES//,/ }
do
	if [ $i == "whyred" ] || [ $i == "tulip" ]
	then
		build ${i} -oldcam -overclock

		build ${i} -newcam -overclock
	fi
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "✅ Build completed in $((DIFF / 60))m $((DIFF % 60))s, get nightly builds in @MoonlightCI | Linux version : $(make kernelversion) | Last commit: $(git log --pretty=format:'%s' -5)"

send_pesan "✅ Build completed in $((DIFF / 60))m $((DIFF % 60))s | Linux verison : $(make kernelversion) | Last commit: $(git log --pretty=format:'%s' -5)"