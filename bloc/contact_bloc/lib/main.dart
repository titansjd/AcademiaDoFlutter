import 'package:contact_bloc/features/bloc_example/bloc_example_page.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'package:contact_bloc/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:contact_bloc/features/contacts/list/contacts_list_page.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/bloc_example/bloc/example_bloc.dart';
import 'features/bloc_example/bloc_freezed_example_page.dart';
import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ContactsRepository(),
      child: MaterialApp(
        initialRoute: '/home',
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/home': (_) => const HomePage(),
          '/bloc/example/': (_) => BlocProvider(
              create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
              child: const BlocExamplePage()),
          '/bloc/example/freezed': (context) => BlocProvider(
                create: (_) => ExampleFreezedBloc()
                  ..add(const ExampleFreezedEvent.findNames()),
                child: const BlocFreezedExamplePage(),
              ),
          '/contacts/list': (context) => BlocProvider(
                create: (_) => ContactListBloc(
                    repository: context.read<ContactsRepository>())
                  ..add(
                    ContactListEvent.findAll(),
                  ),
                child: ContactsListPage(),
              ),
        },
      ),
    );
  }
}
