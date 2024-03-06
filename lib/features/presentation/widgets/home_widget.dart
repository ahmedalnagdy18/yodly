import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/domain/models/reviews_model.dart';
import 'package:yodly/features/presentation/cubit/home_cubit/reviews_cubit/cubit/reviews_cubit.dart';
import 'package:yodly/features/presentation/widgets/awards_widget.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key, required this.model});
  final ReviewsModels model;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 21,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      clipBehavior: Clip.antiAlias,
                      width: 60,
                      height: 60,
                      child: Image.asset(
                        'images/nagdi.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.userName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.n1,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'May 2, 2020 at 04:00 PM',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.n2,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const AwardsWidet(),
                        ],
                      ),
                    ), //aaaaaaaaaaaaaaaaaaaaaaaaaaa
                    Image.asset(
                      'images/present.png',
                      width: 20,
                    ),
                    PopupMenuButton(
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      icon: const Icon(Icons.more_vert, color: Colors.black),
                      elevation: 10,
                      itemBuilder: (context) => [
                        const PopupMenuItem(child: Text('edit')),
                        PopupMenuItem(
                            onTap: () {
                              BlocProvider.of<ReviewsCubit>(context)
                                  .delete(widget.model.id);
                              setState(() {});
                            },
                            child: const Text('delete')),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.n1,
                          ),
                        ),
                        Text(
                          widget.model.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.n2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Image.asset(
                              'images/shape.png',
                              width: 10,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "Domyat",
                              //widget.model.city,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 130, 128, 128),
                              ),
                            ),
                            const Text(
                              "-Egypt",
                              //  widget.model.country,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 130, 128, 128),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'images/ggood.png',
                      width: 50,
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.model.description,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.n2,
                  ),
                ),
              ],
            ),
          ),
          widget.model.attachments.isNotEmpty
              ? Center(
                  child: widget.model.attachments.length == 1
                      ? GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return Dialog(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Image.network(
                                      addBaseUrls(
                                          widget.model.attachments[0].link ??
                                              ''),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Image.network(
                            addBaseUrls(widget.model.attachments[0].link ?? ''),
                            height: MediaQuery.of(context).size.height * 0.3,
                            fit: BoxFit.contain,
                          ),
                        )
                      : GridView.builder(
                          itemBuilder: (context, index) {
                            return Image.network(
                              addBaseUrls(widget
                                      .model
                                      .attachments[
                                          widget.model.attachments.length - 1]
                                      .link ??
                                  ''),
                              height: MediaQuery.of(context).size.height * 0.3,
                              fit: BoxFit.contain,
                            );
                          },
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.model.attachments.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10.0,
                            crossAxisCount: 2,
                            mainAxisExtent: 150,
                          ),
                        ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 26,
              vertical: 21,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) => RadialGradient(
                          center: Alignment.topCenter,
                          //      stops: const [.5, 1],
                          colors: AppColors.g1,
                        ).createShader(bounds),
                        child: const Icon(
                          Icons.arrow_upward_outlined,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '2',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.p3,
                        ),
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) => RadialGradient(
                          center: Alignment.topCenter,
                          //      stops: const [.5, 1],
                          colors: AppColors.g1,
                        ).createShader(bounds),
                        child: const Icon(
                          Icons.arrow_downward_outlined,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                  child: const Row(
                    children: [
                      SizedBox(
                          child: Icon(
                        Icons.insert_comment,
                        color: Colors.grey,
                      )),
                      SizedBox(width: 5),
                      Text(
                        'Comment',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: const Row(
                    children: [
                      SizedBox(
                          child: Icon(
                        Icons.ios_share_outlined,
                        color: Colors.grey,
                      )),
                      SizedBox(width: 5),
                      Text(
                        'Share',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

String addBaseUrls(String url) {
  return "https://yodly.onrender.com/${url}";
}
