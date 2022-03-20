
setup-fvm:
	@echo "[APP] install fvm"
	dart pub global activate fvm 

setup-flutter:
	@echo "[APP] init fltter version"
	fvm use 2.10.3

flutter-install-dependences:
	@echo "[APP] install dependences"
	fvm flutter pub get

setup-dev: setup-fvm setup-flutter flutter-install-dependences
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
 