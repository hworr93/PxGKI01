cd Buildkernel
if [ "6.6" = "6.1" ] &&  [ "g6eb5b2a8c46b-ab14739656-4k" = "no" ]; then
 sed -i "/stable_scmversion_cmd/s/-maybe-dirty//g" ./build/kernel/kleaf/impl/stamp.bzl
 echo -e "\e[33m[Done]\e[0m" Delete the dirty suffix
fi
if [ "6.6" = "6.6" ] &&  [ "g6eb5b2a8c46b-ab14739656-4k" = "no" ]; then
 sed -i "/stable_scmversion_cmd/s/-maybe-dirty//g" ./build/kernel/kleaf/impl/stamp.bzl
 sed -i '/^CONFIG_LOCALVERSION=/ s/="\([^"]*\)"/=""/' ./common/arch/arm64/configs/gki_defconfig
 echo -e "\e[33m[Done]\e[0m" Delete the dirty suffix
fi         
if [ "6.6" = "6.1" ] && [ "g6eb5b2a8c46b-ab14739656-4k" != "no" ]; then
 sed -i "/stable_scmversion_cmd/s/-maybe-dirty//g" ./build/kernel/kleaf/impl/stamp.bzl
 sed -i '$s|echo "\$res"|echo "$res-g6eb5b2a8c46b-ab14739656-4k"|' ./common/scripts/setlocalversion
 echo -e "\e[33m[Done]\e[0m" Set up custom suffix
fi
if [ "6.6" = "6.6" ] && [ "g6eb5b2a8c46b-ab14739656-4k" != "no" ]; then
 sed -i "/stable_scmversion_cmd/s/-maybe-dirty//g" ./build/kernel/kleaf/impl/stamp.bzl
 sed -i "\$s|echo \"\\\$res\"|echo \"-g6eb5b2a8c46b-ab14739656-4k\"|" ./common/scripts/setlocalversion
 sudo sed -i "s/-4k/-g6eb5b2a8c46b-ab14739656-4k/g" ./common/arch/arm64/configs/gki_defconfig
 echo -e "\e[33m[Done]\e[0m" Set up custom suffix
fi