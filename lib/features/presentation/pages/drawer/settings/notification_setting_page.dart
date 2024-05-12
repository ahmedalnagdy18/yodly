import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationSettingPage extends StatefulWidget {
  const NotificationSettingPage({super.key});

  @override
  State<NotificationSettingPage> createState() =>
      _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage> {
  bool _isButtonEnabled = false;
  bool _isButtonEnabled2 = false;
  bool _isButtonEnabled3 = false;
  bool _isButtonEnabled4 = false;
  bool _isButtonEnabled5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Notification Settings',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.p4,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.p4),
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 30,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notify Me when:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.n1,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'someone Upvote/Downvote my Review',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.n1,
                    ),
                  ),
                  FlutterSwitch(
                    height: 20.0,
                    width: 36.0,
                    padding: 1.0,
                    toggleSize: 16.0,
                    borderRadius: 10.0,
                    activeColor: Colors.blue,
                    activeToggleColor: Colors.white,
                    inactiveColor: const Color.fromARGB(255, 179, 179, 179),
                    inactiveToggleColor:
                        const Color.fromARGB(255, 121, 120, 120),
                    activeSwitchBorder: Border.all(color: Colors.blue),
                    inactiveSwitchBorder: Border.all(color: Colors.grey),
                    value: _isButtonEnabled,
                    onToggle: (value) {
                      setState(() {
                        _isButtonEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'someone Give me a Reward',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.n1,
                    ),
                  ),
                  FlutterSwitch(
                    height: 20.0,
                    width: 36.0,
                    padding: 1.0,
                    toggleSize: 16.0,
                    borderRadius: 10.0,
                    activeColor: Colors.blue,
                    activeToggleColor: Colors.white,
                    inactiveColor: const Color.fromARGB(255, 179, 179, 179),
                    inactiveToggleColor:
                        const Color.fromARGB(255, 121, 120, 120),
                    activeSwitchBorder: Border.all(color: Colors.blue),
                    inactiveSwitchBorder: Border.all(color: Colors.grey),
                    value: _isButtonEnabled2,
                    onToggle: (value) {
                      setState(() {
                        _isButtonEnabled2 = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'someone comment on my Review',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.n1,
                    ),
                  ),
                  FlutterSwitch(
                    height: 20.0,
                    width: 36.0,
                    padding: 1.0,
                    toggleSize: 16.0,
                    borderRadius: 10.0,
                    activeColor: Colors.blue,
                    activeToggleColor: Colors.white,
                    inactiveColor: const Color.fromARGB(255, 179, 179, 179),
                    inactiveToggleColor:
                        const Color.fromARGB(255, 121, 120, 120),
                    activeSwitchBorder: Border.all(color: Colors.blue),
                    inactiveSwitchBorder: Border.all(color: Colors.grey),
                    value: _isButtonEnabled3,
                    onToggle: (value) {
                      setState(() {
                        _isButtonEnabled3 = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Someone Follow me',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.n1,
                    ),
                  ),
                  FlutterSwitch(
                    height: 20.0,
                    width: 36.0,
                    padding: 1.0,
                    toggleSize: 16.0,
                    borderRadius: 10.0,
                    activeColor: Colors.blue,
                    activeToggleColor: Colors.white,
                    inactiveColor: const Color.fromARGB(255, 179, 179, 179),
                    inactiveToggleColor:
                        const Color.fromARGB(255, 121, 120, 120),
                    activeSwitchBorder: Border.all(color: Colors.blue),
                    inactiveSwitchBorder: Border.all(color: Colors.grey),
                    value: _isButtonEnabled4,
                    onToggle: (value) {
                      setState(() {
                        _isButtonEnabled4 = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Someone reply on my comment',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.n1,
                    ),
                  ),
                  FlutterSwitch(
                    height: 20.0,
                    width: 36.0,
                    padding: 1.0,
                    toggleSize: 16.0,
                    borderRadius: 10.0,
                    activeColor: Colors.blue,
                    activeToggleColor: Colors.white,
                    inactiveColor: const Color.fromARGB(255, 179, 179, 179),
                    inactiveToggleColor:
                        const Color.fromARGB(255, 121, 120, 120),
                    activeSwitchBorder: Border.all(color: Colors.blue),
                    inactiveSwitchBorder: Border.all(color: Colors.grey),
                    value: _isButtonEnabled5,
                    onToggle: (value) {
                      setState(() {
                        _isButtonEnabled5 = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
