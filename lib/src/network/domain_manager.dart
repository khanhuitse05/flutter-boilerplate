import 'data/user/user_repository.dart';
import 'data/user/user_repository_impl.dart';

class DomainManager {
  late UserRepository userRepository;
  DomainManager() {
    userRepository = UserRepositoryImpl();
  }
}
