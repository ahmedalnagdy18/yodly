import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/cubit/add_review_cubit/add_service_cubit/cubit/add_service_cubit.dart';
import 'package:yodly/features/presentation/pages/add_review/add_service.dart';
import 'package:yodly/injection_container.dart';

class AddReviewPage extends StatelessWidget {
  const AddReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddServiceCubit(addServiceUsecase: sl(), addReviewUsecase: sl()),
      child: const _AddReviewPage(),
    );
  }
}

class _AddReviewPage extends StatefulWidget {
  const _AddReviewPage();

  @override
  State<_AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<_AddReviewPage> {
  final TextEditingController reviewName = TextEditingController();

  final TextEditingController category = TextEditingController();
  var items = ['Fashions', 'Clothes', 'photos & videos', 'places'];

  final TextEditingController subCategory = TextEditingController();
  var items2 = ['mobile', 'Clothes', 'Covers', 'Electronics'];

  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddServiceCubit, AddServiceState>(
      listener: (context, state) {},
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 30,
                  ),
                  child: SafeArea(
                    child: Form(
                      onChanged: _isEnabled,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3B4773),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: category,
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
                                          Color.fromARGB(255, 203, 202, 202)),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '  Tech',
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                                suffixIcon: PopupMenuButton<String>(
                                  icon: const Icon(Icons.arrow_drop_down),
                                  onSelected: (String value) {
                                    category.text = value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return items.map<PopupMenuItem<String>>(
                                        (String value) {
                                      return PopupMenuItem(
                                          value: value, child: Text(value));
                                    }).toList();
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Sub Category',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3B4773),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 50,
                            child: Form(
                              onChanged: _isEnabled,
                              child: TextFormField(
                                controller: subCategory,
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
                                            Color.fromARGB(255, 203, 202, 202)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: PopupMenuButton<String>(
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onSelected: (String value) {
                                      subCategory.text = value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return items2.map<PopupMenuItem<String>>(
                                          (String value) {
                                        return PopupMenuItem(
                                            value: value, child: Text(value));
                                      }).toList();
                                    },
                                  ),
                                  hintText: '  Mobile',
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3B4773),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: reviewName,
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
                                          Color.fromARGB(255, 203, 202, 202)),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '  Product name',
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            height: 50,
                            child:
                                BlocListener<AddServiceCubit, AddServiceState>(
                              listener: (context, state) {
                                if (subCategory.text.isEmpty ||
                                    category.text.isEmpty ||
                                    reviewName.text.isEmpty) {
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
                                } else {
                                  if (state is SucsessAddReviewState) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddServicePage(
                                                  category:
                                                      state.reviewModel[0].id,
                                                  subCategory: state
                                                      .reviewModel[0]
                                                      .subcategories[0]
                                                      .id,
                                                  reviewName: reviewName.text,
                                                )));
                                  }
                                }
                              },
                              child: MaterialButton(
                                onPressed: () {
                                  BlocProvider.of<AddServiceCubit>(context)
                                      .addReview();
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
                                padding: const EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: !_isButtonEnabled
                                          ? Colors.grey
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
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "Next",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        if (state is LoadingAddReviewState)
                                          SizedBox(
                                            width: 15,
                                            height: 15,
                                            child: CircularProgressIndicator(
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

  void _isEnabled() {
    if (subCategory.text.isNotEmpty &&
        category.text.isNotEmpty &&
        reviewName.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}
