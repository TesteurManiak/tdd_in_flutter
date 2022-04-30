import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'my_http_client.dart';
import 'random_user_repository.dart';
import 'remote_datasource.dart';
import 'user_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(
        repository: RandomUserRepositoryImpl(
          remoteDataSource: RemoteDataSourceImpl(
            httpClient: DioClientImpl(dio: Dio()),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final RandomUserRepository repository;

  const MyHomePage({Key? key, required this.repository}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel? _user;

  Future<void> _fetchRandomUser() async {
    final user = await widget.repository.fetchRandomUser();
    setState(() => _user = user);
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = _user; // Reassigned for type shadowing.
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (currentUser != null) ...[
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.network(
                  currentUser.thumbnailUrl,
                  loadingBuilder: (_, __, ___) =>
                      const CircularProgressIndicator(),
                  errorBuilder: (_, __, ___) => const Icon(Icons.error),
                ),
              ),
              Text.rich(
                TextSpan(
                  text: '${currentUser.firstName} ${currentUser.lastName}',
                  children: [
                    TextSpan(text: '\nemail: ${currentUser.email}'),
                    TextSpan(text: '\nphone: ${currentUser.phone}'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            ElevatedButton.icon(
              onPressed: _fetchRandomUser,
              icon: const Icon(Icons.shuffle),
              label: const Text('Fetch Random User'),
            ),
          ],
        ),
      ),
    );
  }
}
