cd Buildkernel
perl -pi -e "s{UTS_VERSION=\"\\\$\(echo \\\$UTS_VERSION \\\$CONFIG_FLAGS \\\$TIMESTAMP \\| cut -b -\\\$UTS_LEN\)\"}{UTS_VERSION=\"#1 SMP PREEMPT Mon Jan  19 02:06:09 UTC 2026\"}" ./common/scripts/mkcompile_h
sed -i -e "s|\$(preempt-flag-y) \"\$(build-timestamp)\"|\$(preempt-flag-y) \"Mon Jan  19 02:06:09 UTC 2026\"|" ./common/init/Makefile
echo -e "\e[33m[Done]\e[0m" Set up kernel build timestamp