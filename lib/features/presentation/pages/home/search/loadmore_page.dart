import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/widgets/followers_page_widget.dart';

class LoadmoreSuggestionPage extends StatelessWidget {
  const LoadmoreSuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '#Suggested Reviewers',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    clipBehavior: Clip.antiAlias,
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'images/fan1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const FollowersPageWidget(text: 'Amir Ahmed Ali'),
                  const Spacer(),
                  const FollowButtom(),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    clipBehavior: Clip.antiAlias,
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'images/fan2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const FollowersPageWidget(text: 'Mary Doe Ahmed'),
                  const Spacer(),
                  const FollowButtom(),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    clipBehavior: Clip.antiAlias,
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'images/fan3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const FollowersPageWidget(text: 'Allaa Ahmed'),
                  const Spacer(),
                  const FollowButtom(),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    clipBehavior: Clip.antiAlias,
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'images/fan4.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const FollowersPageWidget(text: 'Ahmed gasser'),
                  const Spacer(),
                  const FollowButtom(),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    clipBehavior: Clip.antiAlias,
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'images/nagdi.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const FollowersPageWidget(text: 'Ahmed Alnagdy'),
                  const Spacer(),
                  const FollowButtom(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
