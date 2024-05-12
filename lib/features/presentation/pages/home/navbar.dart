import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/domain/models/reviews_model.dart';
import 'package:yodly/features/presentation/pages/add_review/select_add_review.dart';
import 'package:yodly/features/presentation/pages/home/home_page.dart';
import 'package:yodly/features/presentation/pages/home/search/search_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({
    super.key,
    this.reviewsModels,
  });
  final ReviewsModels? reviewsModels;
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedindex = 0;
  List name = [];
  @override
  void initState() {
    name.addAll([
      HomePage(
        reviewsModels: widget.reviewsModels,
      ),
      const SearchPage()
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        tooltip: 'Add Review',
        elevation: 4.0,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SelectAddReview()));
        },
        child: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: AppColors.g2)),
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        //  child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: name.elementAt(selectedindex),
      bottomNavigationBar: Container(
        height: 85,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: AppColors.n1,
          onTap: _onItemTapped,
          iconSize: 30,
          currentIndex: selectedindex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: "Explore"),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      selectedindex = value;
    });
  }
}
