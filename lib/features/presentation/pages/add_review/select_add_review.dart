import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';

import 'package:yodly/features/presentation/pages/add_review/add_review_page.dart';
import 'package:yodly/features/presentation/widgets/select_add_review_widget.dart';

class SelectAddReview extends StatefulWidget {
  const SelectAddReview({super.key});

  @override
  State<SelectAddReview> createState() => _SelectAddReviewState();
}

class _SelectAddReviewState extends State<SelectAddReview> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: AppColors.n1,
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Add Review',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.n1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              opacity: .25,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: AppColors.g2,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.builder(
                      itemCount: reviewsList.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: ReviewItem(
                                review: reviewsList[index],
                                isSelected: _selectedIndex == index));
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddReviewPage()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: AppColors.g2,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Next",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final Review review;
  final bool isSelected;
  const ReviewItem({super.key, required this.review, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 29),
        height: 263,
        width: double.infinity, // Error??
        decoration: BoxDecoration(
          color: isSelected ? AppColors.n1 : Colors.transparent,
          border: Border.all(
            color: AppColors.n1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              //   width: 100,
              height: 90,
              child: Image.asset(
                review.image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              review.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : AppColors.n1,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              review.subtitle,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : AppColors.n1,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
