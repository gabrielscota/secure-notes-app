import './translation.dart';

class PtBr implements Translation {
  String get msgEmailInUse => 'O email já está em uso.';
  String get msgInvalidCpf => 'Forneça um CPF válido';
  String get msgInvalidCredentials => 'Credenciais inválidas.';
  String get msgInvalidField => 'Campo inválido';
  String get msgRequiredField => 'Campo obrigatório';
  String get msgUnexpectedError => 'Algo errado aconteceu. Tente novamente em breve.';
  String get msgWeakPassword => 'Forneça uma senha mais forte!';

  String get addAccount => 'Cadastre-se';
  String get confirmPassword => 'Confirmar senha';
  String get dontHaveAccount => 'Não tem uma conta?';
  String get email => 'Email';
  String get enter => 'Entrar';
  String get forgetPassword => 'Esqueceu sua senha?';
  String get haveAccount => 'Já possui uma conta?';
  String get login => 'Login';
  String get name => 'Nome';
  String get password => 'Senha';
  String get reload => 'Recarregar';
  String get signUp => 'Cadastrar';
  String get wait => 'Aguarde...';
}
