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
    "Flutter is an amazing framework for building apps.",
    "What time is it?",
    "I'm sorry, I don't understand.",
    "Could you repeat that, please?",
    "Have a great day!",
    "Practice makes perfect."
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      _sentences[_currentIndex],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Sentence ${_currentIndex + 1} of ${_sentences.length}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _currentIndex > 0 ? _previousSentence : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                ),
                ElevatedButton.icon(
                  onPressed: _currentIndex < _sentences.length - 1 ? _nextSentence : null,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Next'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Placeholder for listen functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Listen functionality coming soon!')),
                );
              },
              icon: const Icon(Icons.volume_up),
              label: const Text('Listen to Pronunciation'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                 ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Great job! Keep practicing.')),
                );
              },
              icon: const Icon(Icons.check_circle_outline),
              label: const Text("I've Practiced This"),
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[100],
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
