import 'package:equatable/equatable.dart';

class UserViewModel extends Equatable {
  final String name;

  const UserViewModel({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}
