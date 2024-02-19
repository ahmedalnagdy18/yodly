import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/widgets/awards_widget.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                            'Ahmed Alnagdy',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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
                        const PopupMenuItem(child: Text('delete')),
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
                          'Diet Pepsi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.n2,
                          ),
                        ),
                        Text(
                          'The new skinny can',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.n1,
                          ),
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                            ),
                            Text(
                              'Domyat- Egypt',
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
                      'images/good.png',
                      width: 50,
                    )
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  'A Perfect Bold Refreshment for All Parties, Events, & \nSocial Gatherings! Perfect Size For Drinking With',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.n2,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'images/pepsi.png',
            fit: BoxFit.contain,
          ),
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
