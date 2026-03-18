clean: ## Cleans the environment
	echo "╠ Cleaning the project..."
	flutter clean

get: ## Gets the dependencies
	echo "╠ Getting dependencies..."
	flutter pub get

run_build: ## Builds the project
	echo "╠ Building the project..."
	dart pub run build_runner build --delete-conflicting-outputs

# Prepare the project for a new developer
setup:
	flutter clean
	flutter pub get
	cd ios && pod install

# This will create a flutter_launcher_icons.yaml file if it doesn't exist
icon_config:
	echo "╠ Generating app icons..."
	dart run flutter_launcher_icons:generate

create_icons: 
	@echo "╠ Creating app icons..."
	dart run flutter_launcher_icons
