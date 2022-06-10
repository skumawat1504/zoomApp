import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/jitsiMeet_controller.dart';
import 'package:zoom_app/views/screens/widgets/dimensions.dart';
import 'package:zoom_app/views/screens/widgets/reusable_icon.dart';
import 'package:zoom_app/views/screens/widgets/video_call_screen.dart';

class MeetingScreen extends StatefulWidget {
  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final JitsiMeetController _jitsiMeetController = JitsiMeetController();

  createMeeting() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetController.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return VideoCallScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReusableIconWidget(
              icon: Icons.videocam,
              text: "New Meeting",
              onPressed: createMeeting,
            ),
            ReusableIconWidget(
                icon: Icons.add_box_rounded,
                text: "Join Meeting",
                onPressed: joinMeeting),
            ReusableIconWidget(
              icon: Icons.calendar_today,
              text: "Schedule",
              onPressed: () {},
            ),
            ReusableIconWidget(
              icon: Icons.arrow_upward_rounded,
              text: "Share Screen",
              onPressed: () {},
            ),
          ],
        ),
        Expanded(
            child: Center(
          child: Text(
            "Create/ Join a meeting in just one click",
            style: TextStyle(
                fontSize: Dimensions.font20, fontWeight: FontWeight.w500),
          ),
        ))
      ],
    ));
  }
}
