import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EZDrawerHeader extends StatelessWidget {
  final String? userNetworkImage;
  final String userName;
  final String userEmail;
  const EZDrawerHeader(
      {Key? key,
      this.userNetworkImage,
      required this.userName,
      required this.userEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        userName,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      accountEmail: Text(userEmail),
      currentAccountPicture: CachedNetworkImage(
        imageUrl: "$userNetworkImage",
        imageBuilder: (context, imageProvider) {
          return CircleAvatar(
            backgroundImage: imageProvider,
            backgroundColor: Colors.grey,
          );
        },
        placeholder: (context, url) {
          return const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 15,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 48,
            ),
          );
        },
        errorWidget: (context, url, error) {
          return const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 48,
            ),
          );
        },
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
