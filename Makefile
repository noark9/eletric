.PHONY: test

# Run the script over the test data.
test:
	@cat test/password | ./audit
