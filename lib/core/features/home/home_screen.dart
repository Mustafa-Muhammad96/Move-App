import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';

import '../../utils/custom_footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
static const String routeName = '/home';
  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Text(
          "Page $_selectedIndex",
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if(index == 3){
              Navigator.of(context).pushNamed('/UpdateProfileScreen');
            }

          });
        },
      ),
    );
  }
}
