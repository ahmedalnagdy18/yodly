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
      create: (context) => AddServiceCubit(
          addServiceUsecase: sl(),
          addReviewUsecase: sl(),
          uploadFileUsecase: sl()),
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
  final TextEditingController subCategory = TextEditingController();

  final Map<String, List<String>> categoryMap = {
    'Electronics': ['mobile', 'Covers', 'Electronics'],
    'Clothes': ['Shirts', 'Pants', 'Shoes'],
    'photos & videos': ['Camera', 'Lens', 'Tripod'],
    'places': ['Beach', 'Mountains', 'City'],
  };

  List<String> items2 = []; // Initialize items2 as an empty list

  @override
  void initState() {
    super.initState();
    category.addListener(_isEnabled);
    subCategory.addListener(_isEnabled);
  }

  @override
  void dispose() {
    category.removeListener(_isEnabled);
    subCategory.removeListener(_isEnabled);
    super.dispose();
  }

  void updateSubCategoryOptions(String selectedCategory) {
    setState(() {
      items2 = categoryMap[selectedCategory] ?? [];
      subCategory.clear();
    });
  }

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
                          TextFormField(
                            readOnly: true,
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
                                    color: Color.fromARGB(255, 203, 202, 202)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: ' category',
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return ListView.builder(
                                    itemCount: categoryMap.keys.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final category =
                                          categoryMap.keys.toList()[index];
                                      return ListTile(
                                        title: Text(category),
                                        onTap: () {
                                          setState(() {
                                            this.category.text = category;
                                            updateSubCategoryOptions(category);
                                          });
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
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
                          Form(
                            onChanged: _isEnabled,
                            child: TextFormField(
                              readOnly: true,
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
                                hintText: ' subCategory',
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ListView.builder(
                                      itemCount: items2.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final subCategory = items2[index];
                                        return ListTile(
                                          title: Text(subCategory),
                                          onTap: () {
                                            setState(() {
                                              this.subCategory.text =
                                                  subCategory;
                                            });
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    );
                                  },
                                );
                              },
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
                          TextFormField(
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
                                    color: Color.fromARGB(255, 203, 202, 202)),
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
                                    child: Text(
                                      state is LoadingAddReviewState
                                          ? "loading..."
                                          : "Next",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
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
