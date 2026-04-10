cd Buildkernel
# Replace YOUR_USERNAME with your actual GitHub username
git clone https://github.com/hworr93/LXC-Patches.git
cd common
  
# Loop through and apply all .patch files found in the repo
for patch in ../LXC-Patches/*.patch; do
  if [ -f "$patch" ]; then
    echo -e "\e[32mApplying:\e[0m $patch"
    patch -p1 -F 3 < "$patch"
  fi
done