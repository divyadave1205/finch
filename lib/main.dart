import 'package:finch/src/auth/bloc/auth_bloc.dart';
import 'package:finch/src/auth/repository/auth_repository.dart';
import 'package:finch/src/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://mdobqpncmyfhhqqhldoc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1kb2JxcG5jbXlmaGhxcWhsZG9jIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQ2OTU4MjMsImV4cCI6MjA2MDI3MTgyM30.WISZqJHsgB6B0VXMEJr6THgzIqFNm3P61U5tnGznWb0',
  );

  final client = Supabase.instance.client;

  runApp(
    FinchApp(
      client: client,
    ),
  );
}

class FinchApp extends StatelessWidget {
  final SupabaseClient client;
  const FinchApp({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(AuthRepository(client)),
        ),
      ],
      child: MaterialApp(
        title: 'Finch',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: SplashScreen(client: client),
      ),
    );
  }
}
