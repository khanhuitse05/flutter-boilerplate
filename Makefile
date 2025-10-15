
clean: 
	@echo "$ Cleaning the project"
	@rm -rf pubspec.lock
	@flutter clean && flutter pub get

get:
	flutter pub get

pubUpgrade:
	flutter pub upgrade --major-versions --tighten

format:
	dart format .

lint:
	dart analyze

runner: 
	dart run build_runner build -d

pod:
	pod install --project-directory=ios

podRemove:
	cd ios; rm -rf Podfile.lock; pod deintegrate; pod install; cd ..

signingReport:
	cd android && ./gradlew signingReport && cd ..

genLanguage:
	flutter gen-l10n

envStag:
	cat .env.staging > .env

envProd:
	cat .env.production > .env

buildAndroidStag:
	cat .env.staging > .env; flutter build appbundle --flavor staging -t lib/main_staging.dart

buildAndroidProd:
	cat .env.production > .env; flutter build appbundle --flavor production
	
# keytool -list -v -keystore android/app/release-keystore.jks -alias <key alias>
