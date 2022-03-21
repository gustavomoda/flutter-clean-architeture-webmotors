
setup-fvm:
	@echo "[APP] install fvm"
	dart pub global activate fvm 

setup-flutter: setup-fvm
	@echo "[APP] init fltter version"
	fvm use 2.10.3

setup-coverage-console: setup-flutter
	@echo "[APP] install test_cov_console"
	fvm flutter pub global activate test_cov_console

flutter-install-dependences: setup-flutter
	@echo "[APP] install dependences"
	fvm flutter pub get

setup-dev: setup-fvm setup-flutter setup-coverage-console flutter-install-dependences 
	@echo "[APP] bootstraping..."


build_runner_clean:
	@echo "[APP] Cleanup build_runner ..."
	fvm flutter pub run build_runner clean

build_runner: build_runner_clean
	@echo "[APP] build_runner build ..."
	fvm flutter pub run build_runner build --delete-conflicting-outputs

build_runner_watch: build_runner_clean
	@echo "[APP] build_runner build ..."
	fvm flutter pub run build_runner watch --delete-conflicting-outputs
 

test_app:
	@echo "[APP] testing ..."
	fvm flutter test --coverage &&\
	fvm flutter pub global run test_cov_console
 