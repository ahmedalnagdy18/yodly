import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/add_review/add_service.dart';

class AddReviewPage extends StatefulWidget {
  const AddReviewPage({super.key});

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
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
                          controller: _controller,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 203, 202, 202)),
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
                                _controller.text = value;
                              },
                              itemBuilder: (BuildContext context) {
                                return items
                                    .map<PopupMenuItem<String>>((String value) {
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
                            controller: _controller2,
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
                              suffixIcon: PopupMenuButton<String>(
                                icon: const Icon(Icons.arrow_drop_down),
                                onSelected: (String value) {
                                  _controller2.text = value;
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
                          controller: _name,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.grey),
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
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        height: 50,
                        child: MaterialButton(
                          onPressed: () {
                            if (_controller2.text.isNotEmpty &&
                                _controller.text.isNotEmpty &&
                                _name.text.isNotEmpty) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddServicePage()));
                            } else {
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
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: !_isButtonEnabled ? Colors.grey : null,
                                gradient: !_isButtonEnabled
                                    ? null
                                    : LinearGradient(
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
              ),
            )
          ],
        ),
      ),
    );
  }

  void _isEnabled() {
    if (_controller2.text.isNotEmpty &&
        _controller.text.isNotEmpty &&
        _name.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
      setState(() {});
    }
    setState(() {});
  }
}

final TextEditingController _name = TextEditingController();

final TextEditingController _controller = TextEditingController();
var items = ['food & drinks', 'tech', 'photos & videos', 'places'];

final TextEditingController _controller2 = TextEditingController();
var items2 = ['mobile', 'computer', 'mac', 'Lunix'];

bool _isButtonEnabled = false;
