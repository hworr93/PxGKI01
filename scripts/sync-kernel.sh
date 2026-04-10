mkdir Buildkernel
cd Buildkernel
git config --global user.email "hworr93@gmail.com"
git config --global user.name "hworr93"
repo init -u https://android.googlesource.com/kernel/manifest -b common-android15-6.6-2026-01 --depth=1
repo sync