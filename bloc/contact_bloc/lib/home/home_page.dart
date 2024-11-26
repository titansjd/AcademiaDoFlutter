import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/bloc/example/'),
                child: const SizedBox(
                  height: 200,
                  width: 150,
                  child: Card(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Example',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/bloc/example/freezed'),
                child: const SizedBox(
                  height: 200,
                  width: 150,
                  child: Card(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Example Freezed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // _Button(
              //     onTap: () =>
              //         Navigator.of(context).pushNamed('/bloc/example/'),
              //     label: 'Example'),
              // _Button(
              //     onTap: () =>
              //         Navigator.of(context).pushNamed('/bloc/example/'),
              //     label: 'Example Freezed'),
              // _Button(
              //     onTap: () =>
              //         Navigator.of(context).pushNamed('/bloc/example/'),
              //     label: 'Contact'),
              // _Button(
              //     onTap: () =>
              //         Navigator.of(context).pushNamed('/bloc/example/'),
              //     label: 'Contact Cubit'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Button({required VoidCallback onTap, required String label}) =>
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 200,
          width: 150,
          child: Card(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
}
