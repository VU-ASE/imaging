# Makefile in accordance with the docs on git management (to use in combination with meta)
.PHONY: build start clean test

BUILD_DIR=bin/
BINARY_NAME=imaging

lint:
	@echo "No linting"


build: #lint
	@mkdir -p bin/
	@echo "building ${BINARY_NAME}"
	@cd src/ && go build -buildvcs=false -o "../$(BUILD_DIR)${BINARY_NAME}" ${buildargs}

#
# You can specify run arguments and build arguments using runargs and buildargs, like this:
# make start runargs="-debug"
# make start runargs="-debug" buildargs="-verbose"
# make build buildargs="-verbose"
#
start: build
	@echo "starting ${BINARY_NAME}"
	./${BUILD_DIR}${BINARY_NAME} ${runargs}

clean:
	@echo "Cleaning all targets for ${BINARY_NAME}"
	rm -rf $(BUILD_DIR)

# No tests implemented for imaging
test: 
	@echo "No tests implemented"
