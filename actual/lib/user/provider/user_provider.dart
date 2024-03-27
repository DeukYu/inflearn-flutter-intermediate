import 'package:actual/common/const/data.dart';
import 'package:actual/common/secure_storage/secure_storage.dart';
import 'package:actual/user/model/user_model.dart';
import 'package:actual/user/repository/auth_repository.dart';
import 'package:actual/user/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final userProvider = StateNotifierProvider<UserStateNotifier, UserModelBase?>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final userRepository = ref.watch(userRepositoryProvider);
    final storage = ref.watch(secureStorageProvider);

    return UserStateNotifier(
      authRepository: authRepository,
      repository: userRepository,
      storage: storage,
    );
  },
);

class UserStateNotifier extends StateNotifier<UserModelBase?> {
  final AuthRepository authRepository;
  final UserRepository repository;
  final FlutterSecureStorage storage;
  UserStateNotifier({
    required this.authRepository,
    required this.repository,
    required this.storage,
  }) : super(UserModelLoading()) {
    getMe();
  }

  getMe() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) {
      state = null;
      return;
    }

    final repo = await repository.getMe();

    state = repo;
  }

  Future<UserModelBase> login({
    required String username,
    required String password,
  }) async {
    state = UserModelLoading();

    try {
      final res = await authRepository.login(
        username: username,
        password: password,
      );

      await storage.write(key: REFRESH_TOKEN_KEY, value: res.refreshToken);
      await storage.write(key: ACCESS_TOKEN_KEY, value: res.accessToken);

      final userRes = await repository.getMe();

      state = userRes;

      return userRes;
    } catch (e) {
      state = UserModelError(message: '로그인 실패했습니다.');
      return Future.value(state);
    }
  }

  Future<void> logout() async {
    state = null;

    Future.wait(
      [
        storage.delete(key: REFRESH_TOKEN_KEY),
        storage.delete(key: ACCESS_TOKEN_KEY),
      ],
    );
  }
}
