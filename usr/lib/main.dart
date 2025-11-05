import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Speaking Practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const EnglishSpeakingPage(),
    );
  }
}

class EnglishSpeakingPage extends StatefulWidget {
  const EnglishSpeakingPage({super.key});

  @override
  State<EnglishSpeakingPage> createState() => _EnglishSpeakingPageState();
}

class _EnglishSpeakingPageState extends State<EnglishSpeakingPage> {
  final List<String> _sentences = [
    "Hello, how are you today?",
    "What's your name?",
    "I'm learning to speak English.",
    "Could you please speak a little slower?",
    "Thank you very much.",
    "Where is the nearest restaurant?",
    "Can I have the bill, please?",
    "The weather is beautiful today.",
    "I enjoy listening to music.",
    "Flutter is an amazing framework for building apps."
  ];

  int _currentIndex = 0;

  void _nextSentence() {
    setState(() {
      if (_currentIndex < _sentences.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _previousSentence() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Speaking Practice'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  _sentences[_currentIndex],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentIndex > 0 ? _previousSentence : null,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _currentIndex < _sentences.length - 1 ? _nextSentence : null,
                  child: const Text('Next'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for listen functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Listen functionality coming soon!')),
                );
              },
              icon: const Icon(Icons.volume_up),
              label: const Text('Listen'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                 ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Great job! Keep practicing.')),
                );
              },
              child: const Text("I've practiced"),
               style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
