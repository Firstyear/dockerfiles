## `99-389-TEST.m4'
`USER' root

# Get the tests!
`RUN' /usr/bin/DNFYUM install -y 389-ds-base-tests 389-ds-base-debuginfo python34-pytest

# What else do we need to run the tests??
# Maybe we need a python34 version of lib389 ....

##### This should the CMD part. we should make a test runner?

# lib389 tests first.
`CMD' /usr/bin/py.test-3

# now do the 389 tests.

# How do we store and send the output?

