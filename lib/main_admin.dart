import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      name: 'Admin App',
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCOy8N88DhRhrOUg4AnSeJlUBxCuJqKWBI',
        appId: '1:778700099683:android:5cc6cdd345c59c27432856',
        messagingSenderId: '778700099683',
        projectId: 'pushnotification-bedfc',
      ),
    ); // or use DefaultFirebaseOptions.currentPlatform if you have that file
    print('✅ Firebase connected successfully!');
  } catch (e) {
    print('❌ Firebase connection failed: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String userId;

  @override
  void initState() {
    super.initState();
    userId = "10";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(userId, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final user = await FirebaseAuth.instance.signInAnonymously();
          userId = user.user!.uid;
          setState(() {});
          print('✅ Firebase Auth success! UID: ${user.user?.uid}');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
