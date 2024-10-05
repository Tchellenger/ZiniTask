import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zini_task/src/provider/message_sync.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  static const routeName = '/homepage';

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  @override
  Widget build(BuildContext context) {
  final messageSync = Provider.of<MessageSync>(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 80),
          Center(
            child: AvatarGlow(
              animate: messageSync.isSync,
              glowColor: messageSync.isSync? Colors.lightGreen : Colors.red,
              child: Material(
                // Replace this child with your own
                elevation: 0.0,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: messageSync.isSync? const Color(0xFF4CD964) : Colors.red,
                  radius: 50.0,
                  child: Icon(
                    messageSync.isSync? Icons.done : Icons.clear,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            messageSync.isSync? 'Active' : 'Inactive',
            style: const TextStyle(
              fontFamily: 'Acme',
              fontSize: 36,
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            child: ElevatedButton(
              onPressed: () {
                messageSync.sync = !messageSync.isSync;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1976D2),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 80),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Set the border radius
                ),
              ),
              child: Text(
                messageSync.isSync? 'Stop' : 'Start',
                style: const TextStyle(
                  fontFamily: 'Acme',
                  fontSize: 36,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
