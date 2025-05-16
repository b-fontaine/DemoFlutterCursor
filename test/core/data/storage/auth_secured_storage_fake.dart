import 'package:demo_flutter_cursor/core/data/storage/secured_storage.dart';
import 'package:demo_flutter_cursor/core/domain/models/credentials/credentials.dart';

/// This is a fake implementation of [SecuredStorage]
/// As it uses the [FlutterSecureStorage] it is not possible to use it without a real device
/// We prefer using a fake implementation instead of a mock
/// because we want our tests to not reflect the implementation details of the [SecuredStorage]
/// this also makes tests easier to maintain
class FakeAuthSecuredStorage implements SecuredStorage {
  Credentials? credentials;

  FakeAuthSecuredStorage({this.credentials});

  factory FakeAuthSecuredStorage.empty() => FakeAuthSecuredStorage();

  @override
  Future<Credentials?> read() {
    return Future.value(credentials);
  }

  @override
  Future<void> write({required Credentials value}) async {
    await Future.delayed(const Duration(milliseconds: 50));
    credentials = value;
  }

  @override
  Future<void> clear() async {
    credentials = null;
  }
}
