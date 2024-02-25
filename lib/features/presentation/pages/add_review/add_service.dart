import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/data/models/home/api_reviews.dart';
import 'package:yodly/features/domain/entites/add_review/add_service_entity.dart';
import 'package:yodly/features/presentation/cubit/add_review_cubit/add_service_cubit/cubit/add_service_cubit.dart';
import 'package:yodly/features/presentation/pages/add_review/add_review_page.dart';
import 'package:yodly/features/presentation/pages/home/navbar.dart';
import 'package:yodly/features/presentation/widgets/add_service_widget.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:yodly/injection_container.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage(
      {super.key,
      required this.category,
      required this.subCategory,
      required this.reviewName});
  final String category;
  final String subCategory;
  final String reviewName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddServiceCubit(addReviewUsecase: sl(), addServiceUsecase: sl()),
      child: AddServicePageBody(
          category: category, subCategory: subCategory, reviewName: reviewName),
    );
  }
}

class AddServicePageBody extends StatefulWidget {
  const AddServicePageBody(
      {super.key,
      required this.category,
      required this.subCategory,
      required this.reviewName});
  final String category;
  final String subCategory;
  final String reviewName;
  @override
  State<AddServicePageBody> createState() => AddServicePageState();
}

class AddServicePageState extends State<AddServicePageBody> {
  bool _isButtonEnabled = false;

  final TextEditingController _reivew = TextEditingController();

  final TextEditingController _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddServiceCubit, AddServiceState>(
      listener: (context, state) {
        if (state is ErrorAddServiceState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.message.toString()),
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ));
        }
      },
      builder: (context, state) {
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
              'Place location',
              style: TextStyle(
                fontSize: 16,
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
                      vertical: 12,
                    ),
                    child: Form(
                      onChanged: _isEnabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 155,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              // color: Colors.cyan,
                              border: DashedBorder.all(
                                dashLength: 10,
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.file_upload_outlined,
                                  size: 45,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Upload image or video',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.n1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 115,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 15,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Over All Rate',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.n1,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const AddServiceReactionWidget()
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    color: AppColors.n1,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 15,
                                  )),
                              const SizedBox(width: 10),
                              Text(
                                'Add a Specific Rate',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.n1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Title of Reivew*',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3B4773),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 53,
                            child: TextFormField(
                              controller: _reivew,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 196, 194, 194)),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Description*',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3B4773),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 120,
                            child: TextFormField(
                              controller: _description,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 115,
                                  horizontal: 20,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 196, 194, 194)),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Center(
                            child: SizedBox(
                              height: 50,
                              width: 250,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
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
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MaterialButton(
                                height: 50,
                                minWidth: 150,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: AppColors.n1),
                                    borderRadius: BorderRadius.circular(25)),
                                color: Colors.transparent,
                                elevation: 0,
                                onPressed: () {
                                  Navigator.of(context).pop(MaterialPageRoute(
                                      builder: (context) =>
                                          const AddReviewPage()));
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
                              ),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: BlocListener<AddServiceCubit,
                                    AddServiceState>(
                                  listener: (context, state) {
                                    if (state is SucsessAddServiceState) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: Colors.grey,
                                        content: const Text('Review Added'),
                                        action: SnackBarAction(
                                          label: 'Undo',
                                          textColor: Colors.white,
                                          onPressed: () {},
                                        ),
                                      ));
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Navbar()));
                                    }
                                  },
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (_reivew.text.isEmpty ||
                                          _description.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          backgroundColor: Colors.red,
                                          content: const Text(
                                              'Error ! you must write all field'),
                                          action: SnackBarAction(
                                            label: 'Undo',
                                            textColor: Colors.white,
                                            onPressed: () {},
                                          ),
                                        ));
                                      }
                                      if (_isButtonEnabled) {
                                        _loginButton(context);
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                    padding: const EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          color: !_isButtonEnabled
                                              ? const Color.fromARGB(
                                                  230, 211, 211, 211)
                                              : null,
                                          gradient: !_isButtonEnabled
                                              ? null
                                              : LinearGradient(
                                                  colors: AppColors.g2,
                                                  begin: Alignment.centerRight,
                                                  end: Alignment.centerLeft,
                                                ),
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Container(
                                        constraints: const BoxConstraints(),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Add Review",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: !_isButtonEnabled
                                                ? const Color.fromARGB(
                                                    255, 145, 145, 145)
                                                : Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _loginButton(BuildContext context) {
    BlocProvider.of<AddServiceCubit>(context).addServicee(AddServiceEntity(
      attachments: Attachment(
          attachmentType: "PHOTO",
          link:
              "https://group.mercedes-benz.com/bilder/unternehmen/news/2021/absatz-2021-01-w1680xh945-cutout.jpg"),
      categoryId: widget.category,
      description: _description.text,
      name: widget.reviewName,
      overallRating: "HAPPY",
      subcategoryId: widget.subCategory,
      title: _reivew.text,
      type: "PRODUCT",
    ));
  }

  void _isEnabled() {
    if (_reivew.text.isNotEmpty && _description.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
