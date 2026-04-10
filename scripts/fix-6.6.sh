cd Buildkernel/common

FORMATTED_BRANCH="android15-6.6"
# Fake Patch to fix failures
fake_patched=0
if [ "$FORMATTED_BRANCH" = "android15-6.6" ]; then
  if ! grep -qxF $'\tunsigned int nr_subpages = __PAGE_SIZE / PAGE_SIZE;' ./fs/proc/task_mmu.c; then
    echo "Can't find nr_subpages try to repair"
    sed -i -e '/int ret = 0, copied = 0;/a \\tunsigned int nr_subpages \= __PAGE_SIZE \/ PAGE_SIZE;' -e '/int ret = 0, copied = 0;/a \\tpagemap_entry_t \*res = NULL;' ./fs/proc/task_mmu.c
    fake_patched=1
  fi
fi
if [ "$fake_patched" = 1 ]; then
  if [ "$FORMATTED_BRANCH" = "android15-6.6" ]; then
    if grep -qxF $'\tunsigned int nr_subpages = __PAGE_SIZE / PAGE_SIZE;' ./fs/proc/task_mmu.c; then
      sed -i -e '/unsigned int nr_subpages \= __PAGE_SIZE \/ PAGE_SIZE;/d' -e '/pagemap_entry_t \*res = NULL;/d' ./fs/proc/task_mmu.c
    fi
  fi
fi