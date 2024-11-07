import 'package:counter_bloc/page_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  'Counter ${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrement());
                  },
                  label: const Text(''),
                  icon: const Icon(Icons.add),
                ),
                TextButton.icon(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrement());
                  },
                  label: const Text(''),
                  icon: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
