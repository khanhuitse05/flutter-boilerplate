
clean: 
	@echo "$ Cleaning the project"
	@rm -rf pubspec.lock
	@flutter clean && flutter pub get
get:
	flutter pub get
format:
	dart format .
lint:
	dart analyze
runner: 
	flutter packages pub run build_runner build
pop:
	pod install --project-directory=ios