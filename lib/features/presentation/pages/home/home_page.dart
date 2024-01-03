import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/widgets/drawer_widget.dart';
import 'package:yodly/features/presentation/widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      drawer: const DrawerWidget(),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          floating: false,
          forceMaterialTransparency: false,
          pinned: false,
          snap: false,
          leadingWidth: 70,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.n1,
          ),
          actions: [
            Row(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: AppColors.n1,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(width: 20),
          ],
        ),
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Opacity(
                opacity: .15,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: AppColors.g2,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: SafeArea(
                  child: Column(
                    children: [
                      PostWidget(),
                      SizedBox(height: 30),
                      PostWidget(),
                      SizedBox(height: 30),
                      PostWidget(),
                      SizedBox(height: 30),
                      PostWidget(),
                      SizedBox(height: 30),
                      PostWidget(),
                      SizedBox(height: 30),
                      PostWidget(),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
