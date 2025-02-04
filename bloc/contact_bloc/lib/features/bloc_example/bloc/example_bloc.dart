import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    on<ExampleFindNameEvent>(_findNames);
    on<ExampleRemoveNameEvent>(_removeName);
    on<ExampleAddNameEvent>(_addName);
  }

  FutureOr<void> _addName(
    ExampleAddNameEvent event,
    Emitter<ExampleState> emit,
  ) async {
    final stateExample = state;

    if (stateExample is ExampleStateData) {
      final names = [...stateExample.names];

      names.add('Adicionando novo ${names.length}');

      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _removeName(
    ExampleRemoveNameEvent event,
    Emitter<ExampleState> emit,
  ) async {
    final stateExample = state;

    if (stateExample is ExampleStateData) {
      final names = [...stateExample.names];

      names.retainWhere((element) => element != event.name);
      emit(ExampleStateData(names: names));
    }
  }

  FutureOr<void> _findNames(
      ExampleFindNameEvent event, Emitter<ExampleState> emit) async {
    final names = [
      'Diego Lopes',
      'Academia do Flutter',
      'Bloc',
      'Pérola Lopes',
      'Stephane Taynan'
    ];

    await Future.delayed(const Duration(seconds: 3));

    emit(ExampleStateData(names: names));
  }
}
