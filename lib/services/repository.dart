import 'api_service.dart';

class Repository {
  static final Repository _singletonRepository = Repository._internal();

  factory Repository() {
    return _singletonRepository;
  }

  Repository._internal();
  RestClient restClient = RestClient();

  Future login(String username, String password) async {
    return await restClient.login(username, password);
  }

  Future getOffice() async {
    return await restClient.getoffice();
  }
}
