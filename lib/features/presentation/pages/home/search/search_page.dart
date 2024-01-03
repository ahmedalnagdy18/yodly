import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/home/search/loadmore_page.dart';
import 'package:yodly/features/presentation/widgets/followers_page_widget.dart';
import 'package:yodly/features/presentation/widgets/search_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: SizedBox(
          height: 40,
          child: TextFormField(
            //   controller: _email,
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
                contentPadding: const EdgeInsets.only(top: 0, left: 25),
                prefixIcon: Icon(Icons.search, size: 16, color: AppColors.p4),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
                hintStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.p4),
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              //   horizontal: 25,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    '#Trending Reviews',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.n1,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const SearchWidget(),
                const SizedBox(height: 15),
                const SearchWidget(),
                const SizedBox(height: 15),
                const SearchWidget(),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    '#Featured Reviewers',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.n1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 25,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0x050b1a51),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Image.asset('images/fan2.png'),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mary Doe Ahmed',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.p4,
                                  ),
                                ),
                                Text(
                                  '95 followers',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.p4,
                                  ),
                                ),
                                Text(
                                  '30 Badges',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.n1,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const FollowButtom(),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Image.asset('images/fan3.png'),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Handmade store',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.p4,
                                  ),
                                ),
                                Text(
                                  '95 followers',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.p4,
                                  ),
                                ),
                                Text(
                                  '30 Badges',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.n1,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const FollowButtom(),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Image.asset('images/fan4.png'),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Allaa Ahmed',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.p4,
                                  ),
                                ),
                                Text(
                                  '95 followers',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.p4,
                                  ),
                                ),
                                Text(
                                  '30 Badges',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.n1,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const FollowButtom(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(thickness: 1, color: Colors.grey),
                        const SizedBox(height: 15),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const LoadmoreSuggestionPage()));
                            },
                            child: Text(
                              'Load More Suggestions',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.p2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const SearchWidget(),
                const SizedBox(height: 15),
                const SearchWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
