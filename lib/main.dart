import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import 'package:dating_app/data/datasources/user_remote_data_source.dart';
import 'package:dating_app/data/repositories/user_repository_impl.dart';
import 'package:dating_app/domain/usecases/get_users_usecase.dart';
import 'package:dating_app/presentation/bloc/home_bloc.dart';
import 'package:dating_app/presentation/bloc/home_event.dart';
import 'package:dating_app/presentation/pages/main_scaffold.dart';

void main() {
  final httpClient = http.Client();
  final remoteDataSource = UserRemoteDataSourceImpl(client: httpClient);
  final userRepository = UserRepositoryImpl(remoteDataSource: remoteDataSource);
  final getUsersUseCase = GetUsersUseCase(userRepository);

  runApp(MyApp(getUsersUseCase: getUsersUseCase));
}

class MyApp extends StatelessWidget {
  final GetUsersUseCase getUsersUseCase;

  const MyApp({super.key, required this.getUsersUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(getUsersUseCase: getUsersUseCase)..add(LoadUsers()),
        ),
      ],
      child: MaterialApp(
        title: 'Dating App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: const Color(0xFFF8F5F2), // Light beige background
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const MainScaffold(),
      ),
    );
  }
}
