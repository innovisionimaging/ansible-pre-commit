#! /bin/bash
# Verifies that files passed in are encrypted
set -e 

has_error=0
for file in $@ ; do
    head -1 "$file" | grep --quiet '^\$ANSIBLE_VAULT;' || {
        echo "ERROR: $file is not encrypted"
        has_error=1
    }
done

if [ $has_error ] ; then
    echo "To ignore, use --no-verify"
fi

exit $has_error