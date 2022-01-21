import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

mixin NavigationManager on GetxController {
  final Rx<NavigationArguments> _navigateToWithArgs = Rx<NavigationArguments>(const NavigationArguments(route: ''));
  Stream<NavigationArguments> get navigateToWithArgsStream => _navigateToWithArgs.stream;
  set navigateToWithArgs(final NavigationArguments value) => _navigateToWithArgs.value = value;
}

class NavigationArguments extends Equatable {
  final String route;
  final bool clearStack;
  final Map arguments;

  const NavigationArguments({required this.route, this.clearStack = false, this.arguments = const {}});

  @override
  List<Object> get props => [route, clearStack, arguments];
}
