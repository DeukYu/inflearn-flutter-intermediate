import 'package:actual/common/const/data.dart';
import 'package:actual/user/model/user_model.dart';
import 'package:actual/user/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStateNotifier extends StateNotifier<UserModelBase?> {
  final UserRepository repository;
  final FlutterSecureStorage storage;
  UserStateNotifier({
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
}
