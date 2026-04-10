cd Buildkernel/dist
curl -LO "https://raw.githubusercontent.com/ShirkNeko/SukiSU_patch/refs/heads/main/kpm/patch_linux"
chmod 777 patch_linux
./patch_linux
rm Image
mv oImage Image
echo -e "\e[33m[Done]\e[0m" KPM feature is enabled