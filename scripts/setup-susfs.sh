cd Buildkernel
git clone https://gitlab.com/simonpunk/susfs4ksu.git -b gki-android15-6.6
cp susfs4ksu/kernel_patches/50_add_susfs_in_gki-android15-6.6.patch ./common/
cp susfs4ksu/kernel_patches/fs/* ./common/fs/
cp susfs4ksu/kernel_patches/include/linux/* ./common/include/linux/
cd common
patch -p1 -F 3 < 50_add_susfs_in_gki-android15-6.6.patch