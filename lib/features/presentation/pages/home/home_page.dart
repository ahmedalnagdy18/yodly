import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/domain/entites/home/reviews_entity.dart';
import 'package:yodly/features/domain/models/reviews_model.dart';
import 'package:yodly/features/presentation/cubit/home_cubit/reviews_cubit/cubit/reviews_cubit.dart';
import 'package:yodly/features/presentation/widgets/drawer_widget/drawer_widget.dart';
import 'package:yodly/features/presentation/widgets/home_widget/home_widget.dart';
import 'package:yodly/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.reviewsModels}) : super(key: key);
  final ReviewsModels? reviewsModels;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReviewsCubit(reviewsUsecase: sl(), deleteReviewUsecase: sl()),
      child: _HomePage(reviewsModels, true),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage(this.reviewsModels, this.isNew);
  final bool isNew;
  final ReviewsModels? reviewsModels;
  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  final PagingController<int, ReviewsModels> _pagingController =
      PagingController(firstPageKey: 1, invisibleItemsThreshold: 4);
  int selectedindex = 0;
  bool isNew = true;
  @override
  void initState() {
    isNew = widget.isNew;
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    BlocProvider.of<ReviewsCubit>(context)
        .review(ReviewsEntity(page: pageKey, limit: 3));
  }

  void getItem(SucsessReviewsState state) {
    final list = state.postItems.data;
    if (state.postItems.pageInfo.currentPage <
        state.postItems.pageInfo.totalPages) {
      _pagingController.appendPage(
          list, state.postItems.pageInfo.currentPage + 1);
    } else {
      _pagingController.appendLastPage(list);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewsCubit, ReviewsState>(listener: (context, state) {
      if (state is ErrorDeleteReviewsState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Text(state.message.toString()),
          action: SnackBarAction(
            label: 'Undo',
            textColor: Colors.white,
            onPressed: () {},
          ),
        ));
      }
      // if (state is SucsessReviewsState && isNew == true) {
      //   isNew = false;
      //   BlocProvider.of<ReviewsCubit>(context).addPost(widget.reviewsModels);
      // }
      if (state is SucsessReviewsState) {
        getItem(state);
      }
    }, builder: (context, state) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        drawer: const DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          leadingWidth: 70,
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
        body: Center(
          child: RefreshIndicator(
            displacement: 100,
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 800));
              setState(() {});
            },
            child: PagedListView.separated(
              pagingController: _pagingController,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.vertical,
              builderDelegate: PagedChildBuilderDelegate(
                firstPageErrorIndicatorBuilder: (context) => Container(
                  color: Colors.blue,
                  width: 300,
                  height: 300,
                ),
                itemBuilder: (context, item, index) {
                  return PostWidget(model: _pagingController.itemList![index]);
                },
                firstPageProgressIndicatorBuilder: (context) {
                  return Center(
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
                  ));
                },
                newPageProgressIndicatorBuilder: (context) {
                  return const Center(child: CircularProgressIndicator());
                },
                noMoreItemsIndicatorBuilder: (context) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'images/about.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('No more data !')
                    ],
                  ));
                },
              ),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
            ),
          ),
        ),
      );
    });
  }
}
