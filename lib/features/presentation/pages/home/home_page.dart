import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/cubit/home_cubit/reviews_cubit/cubit/reviews_cubit.dart';
import 'package:yodly/features/presentation/widgets/drawer_widget.dart';
import 'package:yodly/features/presentation/widgets/home_widget.dart';
import 'package:yodly/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewsCubit(reviewsUsecase: sl())..review(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewsCubit, ReviewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SucsessReviewsState) {
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
                    ListView.separated(
                      itemBuilder: (context, index) {
                        return PostWidget(model: state.postItems[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.postItems.length,
                    ),
                  ],
                ),
              ),
            ]),
          );
        } else if (state is ErrorReviewsState) {
          return Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset(
                    'images/about.png',
                  ),
                ),
                const SizedBox(height: 10),
                const Text("there is something went wrong",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          );
        } else {
          return Positioned.fill(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset(
                    'images/about.png',
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: AppColors.n1,
                  ),
                ),
              ],
            )),
          );
        }
      },
    );
  }
}
