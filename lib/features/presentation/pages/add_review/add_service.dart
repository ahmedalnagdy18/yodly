import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/data/models/home/api_reviews.dart';
import 'package:yodly/features/domain/entites/add_review/add_service_entity.dart';
import 'package:yodly/features/domain/models/reviews_model.dart';
import 'package:yodly/features/presentation/cubit/add_review_cubit/add_service_cubit/cubit/add_service_cubit.dart';
import 'package:yodly/features/presentation/pages/home/navbar.dart';
import 'package:yodly/features/presentation/widgets/add_service_widget/add_service_button_widget.dart';
import 'package:yodly/features/presentation/widgets/add_service_widget/add_service_widget.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:yodly/features/presentation/widgets/add_service_widget/add_specific_rate_widget.dart';
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
      create: (context) => AddServiceCubit(
          addReviewUsecase: sl(),
          addServiceUsecase: sl(),
          uploadFileUsecase: sl()),
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
  final imagepicker = ImagePicker();

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

//test test test test test
  List<Widget> dynamicWidgets = [];

  void addSpecificRate() {
    if (dynamicWidgets.length >= 2) {
      return;
    }
    setState(() {
      dynamicWidgets.add(buildSpecificRate());
    });
  }

  void removeSpecificRate(int index) {
    setState(() {
      dynamicWidgets.removeAt(index);
    });
  }

  Widget buildSpecificRate() {
    return AddSpecificRate(
      onTap: () {
        removeSpecificRate(0);
      },
    );
  }

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
          body: Stack(
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
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              pickImage();
                            },
                            child: Container(
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
                              child: image != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.file(
                                        image!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                          Column(
                            children: dynamicWidgets,
                          ),
                          if (dynamicWidgets.length < 2)
                            Row(
                              children: [
                                Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      color: AppColors.p4,
                                      shape: BoxShape.circle,
                                    ),
                                    child: InkWell(
                                      onTap: addSpecificRate,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    )),
                                const SizedBox(width: 10),
                                Text(
                                  'Add a Specific Rate',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.p4,
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
                          AddServiceTextField(controller: _reivew),
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
                              child: AddServiceDescription(
                                  controller: _description)),
                          const SizedBox(height: 15),
                          const Center(
                            child: SizedBox(
                              height: 50,
                              width: 250,
                              child: SelectPlaceButton(),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const AddServiceCancelButton(),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: BlocListener<AddServiceCubit,
                                    AddServiceState>(
                                  listener: (context, state) {
                                    if (state is SucsessAddServiceState) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.grey,
                                        content: const Text('Review Added'),
                                        action: SnackBarAction(
                                          label: 'Undo',
                                          textColor: Colors.white,
                                          onPressed: () {},
                                        ),
                                      ));
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                              builder: (context) => Navbar(
                                                    reviewsModels:
                                                        ReviewsModels(
                                                            id: widget.category,
                                                            city: "",
                                                            userName: "Nagdy",
                                                            name: widget
                                                                .reviewName,
                                                            description:
                                                                _description
                                                                    .text,
                                                            title: _reivew.text,
                                                            attachments: [
                                                              Attachment(
                                                                  attachmentType:
                                                                      "PHOTO",
                                                                  link:
                                                                      "comment-attachment/1709209526594-tree-736885_1280.jpg"),
                                                            ],
                                                            country: ''),
                                                  )));
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
                                        _addServiceButton(context);
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
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
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
                                            if (state is LoadingAddServiceState)
                                              SizedBox(
                                                width: 15,
                                                height: 15,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: AppColors.n1,
                                                ),
                                              ),
                                          ],
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
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _addServiceButton(BuildContext context) {
    BlocProvider.of<AddServiceCubit>(context).addServicee(AddServiceEntity(
      attachments: Attachment(
          attachmentType: "PHOTO",
          link: "comment-attachment/1709209526594-tree-736885_1280.jpg"),
      categoryId: widget.category,
      description: _description.text,
      name: widget.reviewName,
      overallRating: "HAPPY",
      subcategoryId: widget.subCategory,
      title: _reivew.text,
      type: "PLACE",
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
