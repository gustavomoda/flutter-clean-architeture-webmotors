# APP 

The Flutter test for Webmotors company to display vehicles.

The goal of this app is to evaluate senior programming skills.

---

## Getting Start

### Install Flutter version 2.10+.

> Suggestion: 
> - Install Flutter Version Manager ([FVM](https://fvm.app/docs/getting_started/installation)) and run: ```fvm use 2.10.3``` to install and activate flutter version in the project root path.
> - You can use [Makefile Tool](https://makefiletutorial.com) to configure the development environment with the command ```make setup-dev```. See all commands in ```Makefile``` in the project root path.


###  Run the code in the iOS/Android simulators*.
```bash
flutter run 
```
> \* There aren't keys, team and certificates, and the app must run with simulators.

---

# Development
## Generating codes with Flutter build_runner tool.
### Building:
```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
````

or

```bash
make build_runner
```

### Watching the file system for updates and rebuilding as appropriate.
```bash
fvm flutter pub run build_runner watch --delete-conflicting-outputs
````

or

```bash
make build_runner_watch
```
---

# Testing

### 1. Install ```test_cov_console```.
```bash
flutter pub global activate test_cov_console 
```

or use ```fvm```

```bash
flutter pub global activate test_cov_console 
```

or use ```Makefile```

```bash
make setup-coverage-console
```

### 2. Running tests

```bash
flutter test --coverage &&\
flutter pub global run test_cov_console
```

or use ```fvm```

```bash
fvm flutter test --coverage &&\
fvm flutter pub global run test_cov_console
```

or use ```Makefile```

```bash
make test-app
```


---

### References

- [Flutter 2.18.3](https://flutter.dev)
- [Flutter Version Management](https://fvm.app)
- [Get it](https://pub.dev/packages/get_it): dependency Injection and Service Locator.
- [Injectatble](https://pub.dev/packages/injectable): a convenient code generator for get_it.
- [Mobx](https://pub.dev/packages/mobx): A state-management library.
- [Retrofit](https://pub.dev/packages/retrofit): a type conversion Dio client generator. 
- [Logger](https://pub.dev/packages/logger): beautiful and modern logging system purpose.
- [freezed](https://pub.dev/packages/freezed): concepts such as data-classes or pattern matching and an automatic serialization/deserialization of your objects.
- [Cached Network Image](https://pub.dev/packages/cached_network_image): a  library to show images from the internet and keep them in the cache directory.

### For testing purpose
- [Mockito](https://pub.dev/packages/mockito): a mock framework inspired by Mockito: Fakes, Mocks, behavior verification and stubbing.
- [Faker](https://pub.dev/packages/faker/): a library for generating fake data heavily inspired by the Python faker package.
- [HTTP Mock Adapter](https://pub.dev/packages/http_mock_adapter/): a simple mocker to use mocking package for Dio intended to be used in tests. 
- [Makefile Tool](https://makefiletutorial.com)

---

## Author

Gustavo Moda <gustavo.moda@gmail.com>