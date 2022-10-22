import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'service_locator.dart';
import 'core/constants/constants.dart';
import 'presentation/bloc/gutendex_bloc.dart';
import 'presentation/pages/gutendex_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await initializeServiceLocator().then(
    (_) => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => serviceLocator.get<GutendexBloc>()
              ..add(
                const GutendexGetBookByQueryEvent(query: gutendexApi),
              ),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gutendex",
      home: GutendexPage(),
    );
  }
}
