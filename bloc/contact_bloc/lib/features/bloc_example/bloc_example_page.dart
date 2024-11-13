import 'dart:developer';

import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExamplePage extends StatelessWidget {
  const BlocExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
      ),
      //widget q fica escutando as alteracoes, nao rebuilda a tela
      body: BlocListener<ExampleBloc, ExampleState>(
        listener: (context, state) {
          if (state is ExampleStateData) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('A quantidade de nomes é ${state.names.length}'),
              ),
            );
          }
        },
        child: Column(
          children: [
            //Widget completo, escuta as alteracoe se rebuilda a tela
            BlocConsumer<ExampleBloc, ExampleState>(builder: (_, state) {
              if (state is ExampleStateData) {
                return Text('Total de nomes é ${state.names.length}');
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, listener: (context, state) {
              log('BlocConsumer evento do listener');
            }),

            BlocSelector<ExampleBloc, ExampleState, List<String>>(
                selector: (state) {
              if (state is ExampleStateData) {
                return state.names;
              }
              return [];
            }, builder: (context, names) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  final name = names[index];
                  return ListTile(
                    onTap: () => context
                        .read<ExampleBloc>()
                        .add(ExampleRemoveNameEvent(name: name)),
                    title: Text(name),
                  );
                },
              );
            }),

            // BlocBuilder<ExampleBloc, ExampleState>(
            //   builder: (context, state) {
            //     log(state.runtimeType.toString());
            //     if (state is ExampleStateData) {
            //       return ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: state.names.length,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             title: Text(state.names[index]),
            //           );
            //         },
            //       );
            //     }
            //     return const Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
