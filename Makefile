# Check if yarn is installed
HAS_YARN := $(shell command -v yarn 2> /dev/null)

# Variables
APP_NAME := expo51-template

# If yarn is not found, display a message and exit
ifndef HAS_YARN
$(error Yarn is not installed. Please install it from https://yarnpkg.com/getting-started/install)
endif

# Install dependencies
.PHONY: install
install:
	@echo "Installing dependencies..."
	yarn install

# Clean node_modules and reset the project (similar to 'reset-project' in package.json)
.PHONY: clean
clean:
	@echo "Cleaning project and removing node_modules..."
	rm -rf node_modules
	rm -rf .expo
	rm -rf ios/build android/build
	yarn run reset-project

# Start the Expo development server
.PHONY: start
start:
	@echo "Starting Expo development server..."
	yarn start

.PHONY: start-tunnel
start-tunnel:
	@echo "Starting Expo development server..."
	yarn start --tunnel

# Run the Expo project on Android
.PHONY: start-android
start-android:
	@echo "Starting Android build..."
	yarn android

# Run the Expo project on iOS
.PHONY: start-ios
start-ios:
	@echo "Starting iOS build..."
	yarn ios

# Run tests with Jest
.PHONY: test
test:
	@echo "Running tests with Jest..."
	yarn test

# Lint the project
.PHONY: lint
lint:
	@echo "Linting the project..."
	yarn lint

# Clean build artifacts and reset the project
.PHONY: reset
reset: clean install
	@echo "Project cleaned and reset."

# Display help message
.PHONY: help
help:
	@echo ""
	@echo "Available commands:"
	@echo ""
	@echo "  install		- Install dependencies using yarn"
	@echo "  clean     		- Clean project and remove node_modules"
	@echo "  reset     		- Clean and reset the project (like 'reset-project' script)"
	@echo "  start     		- Start the Expo development server"
	@echo "  start-tunnel     	- Try this if unable to access development server using a physical device"
	@echo "  start-android   	- Run the project on Android"
	@echo "  start-ios       	- Run the project on iOS"
	@echo "  test      		- Run tests using Jest"
	@echo "  lint      		- Lint the project"
	@echo "  help    		- Display this help message"
	@echo ""
