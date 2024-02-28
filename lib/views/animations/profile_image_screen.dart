import 'package:flutter/material.dart';

class ProfileImageScreen extends StatelessWidget {

  final String imageUrl;
  const ProfileImageScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Hero(
          tag: 'profile-image-tag',
          child: CircleAvatar(
            radius: MediaQuery.sizeOf(context).width*0.8,
            foregroundColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
