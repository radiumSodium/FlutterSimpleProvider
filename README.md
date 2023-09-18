# Flutter Simple Provider

A flutter practice project to understand provider with Two page with counter

## Key Changes

#### - changes on `main.dart`:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

// ---- retured MultiProvider instead of Material app ---

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IncrementProvider()),
      ],

// ----  Material app as child ---

      child: MaterialApp(
          title: 'Provider Practice',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Home()),
    );
  }
}
```

#### - inside `provider_class.dart`:

```dart
import 'package:flutter/material.dart';

class IncrementProvider extends ChangeNotifier {
  int number = 0;
  void Increment() {
    number++;
    notifyListeners();
  }
}
```

#### - on the page where we will use the provider method suppose : `home.dart`

- Use consumer as the wrapper over the parent of the widget we wanna use the provider properties.

```dart
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

// --- Wrapped with Consumer widget ---

    return Consumer<IncrementProvider>(
      builder: (context, incrementProvider, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Provider Practice'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'First Page',
              ),
              Text(

// --- used provider values ---

                '${incrementProvider.number.toString()}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondPage()));
                  },
                  child: Text('Second Page'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

// --- used provider values ---

            incrementProvider.Increment();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

```
