import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  static final String name = 'create-review-screen';

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded)
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15.0,
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(hintText: 'First Name'),
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(hintText: 'Last Name'),
                ),
                TextFormField(
                  controller: _reviewController,
                  maxLines: 8,
                  decoration: InputDecoration(hintText: 'Write Review'),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }
}
