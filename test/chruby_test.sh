#!/bin/sh

. ./test/helper.sh

tearDown()
{
	chruby_reset
}

test_chruby_1_9()
{
	chruby "1.9"

	assertEquals "did not match 1.9" "$TEST_RUBY_DIR" "$RUBY_DIR"
}

test_chruby_system()
{
	chruby "$TEST_RUBY_VERSION"
	chruby system

	assertNull "did not reset the Ruby" "$RUBY_DIR"
}

test_chruby_unknown()
{
	chruby "foo" 2>/dev/null

	assertEquals "did not return 1" $? 1
}

SHUNIT_PARENT=$0 . $SHUNIT2
