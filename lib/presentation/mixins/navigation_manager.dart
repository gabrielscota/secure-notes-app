import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

mixin NavigationManager on GetxController {
  final Rx<NavigationArguments> _navigateToWithArgs = Rx<NavigationArguments>(const NavigationArguments(route: ''));
  Stream<NavigationArguments> get navigateToWithArgsStream => _navigateToWithArgs.stream;
  set navigateToWithArgs(NavigationArguments value) => _navigateToWithArgs.subject.add(value);

  final Rx<NavigationArguments> _navigateToWithArgsAndClearStack =
      Rx<NavigationArguments>(const NavigationArguments(route: ''));
  Stream<NavigationArguments> get navigateToWithArgsAndClearStackStream => _navigateToWithArgsAndClearStack.stream;
  set navigateToWithArgsAndClearStack(NavigationArguments value) => _navigateToWithArgsAndClearStack.subject.add(value);
}

class NavigationArguments extends Equatable {
  final String route;
  final Object? arguments;

  const NavigationArguments({required this.route, this.arguments});

  @override
  List<Object?> get props => [route, arguments];
}
