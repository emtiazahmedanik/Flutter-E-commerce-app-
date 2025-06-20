import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.grey,
                    hintText: 'Search',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade100)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.grey.shade100)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.grey.shade100))
                  ),
                )
              ],
            ),
          )
      ),

    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: SvgPicture.asset('assets/images/logo_nav.svg'),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_2_outlined),
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 8,),
        CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.phone),
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 8,),
        CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active_outlined),
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 8,),

      ],
    );
  }
}
