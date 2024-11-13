part of 'example_bloc.dart';

@immutable
abstract class ExampleState {}

class ExampleStateInitial extends ExampleState {}

class ExampleStateData extends ExampleState {
  ExampleStateData({
    required this.names,
  });

  final List<String> names;
}
