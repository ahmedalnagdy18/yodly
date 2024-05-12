import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/add_review/add_review_page.dart';

class SelectPlaceButton extends StatelessWidget {
  const SelectPlaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: Colors.white,
      elevation: 0,
      onPressed: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(
              "images/location.png",
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'Select Place Location',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.n1,
            ),
          ),
        ],
      ),
    );
  }
}

class AddServiceCancelButton extends StatelessWidget {
  const AddServiceCancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: 150,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.n1),
          borderRadius: BorderRadius.circular(25)),
      color: Colors.transparent,
      elevation: 0,
      onPressed: () {
        Navigator.of(context).pop(
            MaterialPageRoute(builder: (context) => const AddReviewPage()));
      },
      child: Row(
        children: [
          Text(
            "Cancel",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.n1,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
