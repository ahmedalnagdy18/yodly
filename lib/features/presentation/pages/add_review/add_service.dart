import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/add_review/add_review_page.dart';
import 'package:yodly/features/presentation/pages/home/navbar.dart';
import 'package:yodly/features/presentation/widgets/add_service_widget.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({super.key});

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  bool _isButtonEnabled = false;

  final TextEditingController _reivew = TextEditingController();

  final TextEditingController _description = TextEditingController();

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
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 196, 194, 194)),
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
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 196, 194, 194)),
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
                                  builder: (context) => const AddReviewPage()));
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
                            child: MaterialButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 1),
                                    content: const Text('post added'),
                                    action: SnackBarAction(
                                      label: 'ok',
                                      onPressed: () {},
                                    ),
                                  ),
                                );
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Navbar()));
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
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
                                    borderRadius: BorderRadius.circular(30.0)),
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
