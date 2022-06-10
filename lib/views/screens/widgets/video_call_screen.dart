import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/controllers/jitsiMeet_controller.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/views/screens/widgets/dimensions.dart';
import 'package:zoom_app/views/screens/widgets/meeting_options.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIDControoller;

  late TextEditingController usernameControoller;
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  final AuthController _authController = AuthController();
  final JitsiMeetController _jitsiMeetController = JitsiMeetController();
  @override
  void initState() {
    // TODO: implement initState
    meetingIDControoller = TextEditingController();
    usernameControoller =
        TextEditingController(text: _authController.user!.displayName);
    super.initState();
  }

  _joinMeeting() {
    _jitsiMeetController.createMeeting(
        roomName: meetingIDControoller.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: usernameControoller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          "Join Meeting",
          style: TextStyle(
              fontSize: Dimensions.font16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: meetingIDControoller,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Room ID",
                contentPadding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    right: Dimensions.width10,
                    left: Dimensions.width10)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Dimensions.height16,
          ),
          TextField(
            controller: usernameControoller,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "username",
                contentPadding: EdgeInsets.only(
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                    right: Dimensions.width10,
                    left: Dimensions.width10)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width8, vertical: Dimensions.height8),
              child: Text(
                "Join",
                style: TextStyle(fontSize: Dimensions.font16),
              ),
            ),
          ),
          MeetingOptions(
            text: "Mute Audio",
            isMuted: isAudioMuted,
            onChange: onAudioMuted,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          MeetingOptions(
            text: "Turn OFF Video",
            isMuted: isVideoMuted,
            onChange: onVideoMuted,
          )
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
