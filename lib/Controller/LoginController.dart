import 'package:mobx/mobx.dart';
part 'LoginController.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {

  final String email = "teste@teste.com.br";
  final String senha = "12345678";

  @observable
  bool logado = false;

  @observable
  bool loading = false;

  @action
  alterarLoading(bool value){
    loading = value;
  }

  @action
  fazerLogin(String email, String senha) {
    if(email == this.email && senha == this.senha){
      logado = true;
    }
    else{
      logado = false;
    }
  }
}