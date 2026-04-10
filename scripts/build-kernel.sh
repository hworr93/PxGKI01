cd Buildkernel
sed -i '/^[[:space:]]*"protected_exports_list"[[:space:]]*:[[:space:]]*"android\/abi_gki_protected_exports_aarch64",$/d' ./common/BUILD.bazel
rm -rf ./common/android/abi_gki_protected_exports_*
sed -i 's/BUILD_SYSTEM_DLKM=1/BUILD_SYSTEM_DLKM=0/' common/build.config.gki.aarch64
sed -i '/MODULES_ORDER=android\/gki_aarch64_modules/d' common/build.config.gki.aarch64
sed -i '/KMI_SYMBOL_LIST_STRICT_MODE/d' common/build.config.gki.aarch64
tools/bazel run --config=fast --lto=thin //common:kernel_aarch64_dist -- --destdir=dist