import './translation.dart';

class EnUs implements Translation {
  @override
  String get msgEmailInUse => 'O email já está em uso.';
  @override
  String get msgInvalidCpf => 'Forneça um CPF válido';
  @override
  String get msgInvalidCredentials => 'Credenciais inválidas.';
  @override
  String get msgInvalidField => 'Campo inválido';
  @override
  String get msgRequiredField => 'Campo obrigatório';
  @override
  String get msgUnexpectedError => 'Algo errado aconteceu. Tente novamente em breve.';
  @override
  String get msgWeakPassword => 'Forneça uma senha mais forte!';

  @override
  String get addAccount => 'Cadastre-se';
  @override
  String get confirmPassword => 'Confirmar senha';
  @override
  String get dontHaveAccount => "Don't have an account?";
  @override
  String get email => 'Email';
  @override
  String get enter => 'Entrar';
  @override
  String get forgetPassword => 'Esqueceu sua senha?';
  @override
  String get haveAccount => 'Já possui uma conta?';
  @override
  String get login => 'Login';
  @override
  String get name => 'Nome';
  @override
  String get password => 'Senha';
  @override
  String get reload => 'Recarregar';
  @override
  String get signUp => 'Sign Up';
  @override
  String get wait => 'Aguarde...';
}
