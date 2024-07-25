import 'package:first_pj/presentation/bloc/note_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'presentation/bloc/note_bloc.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/detail/detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteBloc>(
          create: (_) => di.sl<NoteBloc>()..add(LoadNotes()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Notes App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => HomePage(),
          '/detail': (context) => DetailPage(),
        },
      ),
    );
  }
}
