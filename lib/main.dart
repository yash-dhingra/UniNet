// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: UniNetApp(),
    ));

class UniNetApp extends StatefulWidget {
  const UniNetApp({super.key});

  @override
  _UniNetAppState createState() => _UniNetAppState();
}

class _UniNetAppState extends State<UniNetApp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLogin = true;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniNet'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isLogin ? 'Login' : 'Sign Up',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_isLogin) {
                  if (_emailController.text == 'sha@gmail.com' &&
                      _passwordController.text == '1234') {
                    if (kDebugMode) {
                      print('Login successful');
                    }
                    _errorMessage = '';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  } else {
                    setState(() {
                      _errorMessage = 'Invalid email or password';
                    });
                  }
                } else {
                  if (kDebugMode) {
                    print(
                        'Sign up with email: ${_emailController.text}, password: ${_passwordController.text}');
                  }
                  _errorMessage = '';
                }
              },
              child: Text(_isLogin ? 'Login' : 'Sign Up'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  _isLogin = !_isLogin;
                  _errorMessage = '';
                });
              },
              child: Text(
                  _isLogin ? 'New User? Sign Up' : 'Already a User? Login'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (kDebugMode) {
            print('know about us');
          }
        },
        child: const Text('📞'),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniNet Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to shuttle services page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShuttleServicesPage()),
                );
              },
              child: const Text('Shuttle Services Around You'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to pooling mates page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PoolingMatesPage()),
                );
              },
              child: const Text('Pooling Mates Near You'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to PG mate finder page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuestionnaireScreen()),
                );
              },
              child: const Text('PG Mate Finder'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to get your mentor page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MentorListScreen()),
                );
              },
              child: const Text('Get Your Mentor'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShuttleServicesPage extends StatelessWidget {
  const ShuttleServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shuttle Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to shuttles nearby page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShuttlesNearbyPage()),
                );
              },
              child: const Text('Shuttles Nearby'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to get your shuttle service enlisted page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShuttleEnlistPage()),
                );
              },
              child: const Text('Get Your Shuttle Service Enlisted'),
            ),
          ],
        ),
      ),
    );
  }
}

class ShuttlesNearbyPage extends StatelessWidget {
  const ShuttlesNearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shuttles Nearby'),
      ),
      body: const Center(
        child: Text('Shuttles Nearby Page'),
      ),
    );
  }
}

class ShuttleEnlistPage extends StatelessWidget {
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  ShuttleEnlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shuttle Enlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _sourceController,
              decoration: const InputDecoration(
                labelText: 'Source',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _destinationController,
              decoration: const InputDecoration(
                labelText: 'Destination',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _timeController,
              decoration: const InputDecoration(
                labelText: 'Time of Departure',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit shuttle enlist form
                if (kDebugMode) {
                  print('Shuttle enlist form submitted');
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class PoolingMatesPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  PoolingMatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pooling Mates'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to 'I will drive' form
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriverFormPage()),
                );
              },
              child: const Text('I Will Drive'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to 'I will pool' form
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PoolFormPage()),
                );
              },
              child: const Text('I Want to Pool'),
            ),
          ],
        ),
      ),
    );
  }
}

class DriverFormPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  DriverFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _sourceController,
              decoration: const InputDecoration(
                labelText: 'Source',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _destinationController,
              decoration: const InputDecoration(
                labelText: 'Destination',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _timeController,
              decoration: const InputDecoration(
                labelText: 'Time of Departure',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit driver form
                if (kDebugMode) {
                  print('Driver form submitted');
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class PoolFormPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  PoolFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pool Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _sourceController,
              decoration: const InputDecoration(
                labelText: 'Source',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _destinationController,
              decoration: const InputDecoration(
                labelText: 'Destination',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _timeController,
              decoration: const InputDecoration(
                labelText: 'Time of Departure',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Check for pool mate match
                if (_sourceController.text == 'gaur city' &&
                    _destinationController.text == 'jiit 62' &&
                    _timeController.text == '10:00') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PoolMateMatchPage()),
                  );
                } else {
                  if (kDebugMode) {
                    print('No pool mate match found');
                  }
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class PoolMateMatchPage extends StatelessWidget {
  const PoolMateMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pool Mate Match'),
      ),
      body: const Center(
        child: Text('Nearby Pool Mate: Shashant'),
      ),
    );
  }
}

class PgMateFinderPage extends StatelessWidget {
  const PgMateFinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PG Mate Finder'),
      ),
      body: const Center(
        child: Text('PG Mate Finder Page'),
      ),
    );
  }
}

class MentorPage extends StatelessWidget {
  const MentorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Your Mentor'),
      ),
      body: const Center(
        child: Text('Mentor Page'),
      ),
    );
  }
}

class QuestionnaireScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _characteristicsController =
      TextEditingController();

  QuestionnaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PG Mate Finder Questionnaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.streetAddress,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _characteristicsController,
              decoration: const InputDecoration(
                labelText: 'Characteristics',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit questionnaire
                if (kDebugMode) {
                  print(
                      'Name: ${_nameController.text}, Age: ${_ageController.text}, LOcation: ${_locationController.text}, Characteristics: ${_characteristicsController.text}');
                }
                // Navigate to page displaying details of all users
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserDetailsScreen(
                            name: _nameController.text,
                            age: _ageController.text,
                            characteristics: _characteristicsController.text,
                          )),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserDetailsScreen extends StatelessWidget {
  final String name;
  final String age;
  final String characteristics;

  const UserDetailsScreen(
      {super.key,
      required this.name,
      required this.age,
      required this.characteristics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Details:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Name: $name'),
            Text('Age: $age'),
            Text('Characteristics: $characteristics'),
          ],
        ),
      ),
    );
  }
}

class MentorListScreen extends StatelessWidget {
  MentorListScreen({super.key});

  // Dummy data for mentors
  final List<Map<String, dynamic>> mentors = [
    {
      'name': 'John Doe',
      'qualification': 'Semester ${Random().nextInt(8) + 1}',
      'rating': '⭐️⭐️⭐️⭐️',
    },
    {
      'name': 'Jane Smith',
      'qualification': 'Semester ${Random().nextInt(8) + 1}',
      'rating': '⭐️⭐️⭐️',
    },
    {
      'name': 'Alice Johnson',
      'qualification': 'Semester ${Random().nextInt(8) + 1}',
      'rating': '⭐️⭐️⭐️⭐️⭐️',
    },
    {
      'name': 'Bob Brown',
      'qualification': 'Semester ${Random().nextInt(8) + 1}',
      'rating': '⭐️⭐️⭐️⭐️',
    },
    {
      'name': 'Emma Wilson',
      'qualification': 'Semester ${Random().nextInt(8) + 1}',
      'rating': '⭐️⭐️⭐️',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mentor List'),
      ),
      body: ListView.builder(
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          final mentor = mentors[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(mentor['name']),
              subtitle: Text('Semester: ${mentor['qualification']}'),
              trailing: Text('Rating: ${mentor['rating']}'),
              onTap: () {
                // Display a message when the appointment is booked
                _showBookedSessionMessage(context, mentor['name']);
              },
            ),
          );
        },
      ),
    );
  }
}

class _showBookedSessionMessage {
  _showBookedSessionMessage(BuildContext context, mentor);
}
  // Remove the incomplete code block

