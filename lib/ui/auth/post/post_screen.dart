import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/auth/login_screen.dart';
import 'package:flutter_application_1/utils/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _auth = FirebaseAuth.instance;

  Future<void> signOut(context) async {
    try {
      final value = await _auth.signOut();
      debugPrint("Successfully sign out");
      Utils().toastMessage("Successfully sign out");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      debugPrint("failed to sign out");
      Utils().toastMessage("failed to sign out");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        actions: [
          IconButton(onPressed: () async => signOut(context), icon: Icon(Icons.login_outlined)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(),
    );
  }
}
