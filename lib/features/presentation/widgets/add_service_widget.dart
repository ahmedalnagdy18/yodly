import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';

class AddServiceReactionWidget extends StatefulWidget {
  const AddServiceReactionWidget({Key? key}) : super(key: key);

  @override
  State<AddServiceReactionWidget> createState() =>
      _AddServiceReactionWidgetState();
}

class _AddServiceReactionWidgetState extends State<AddServiceReactionWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildReactionButton("images/happy.png", "Happy", 0),
        _buildReactionButton("images/good.png", "Good", 1),
        _buildReactionButton("images/ok.png", "Ok", 2),
        _buildReactionButton("images/sad.png", "Sad", 3),
        _buildReactionButton("images/angry.png", "Angry", 4),
      ],
    );
  }

  Widget _buildReactionButton(String imagePath, String label, int index) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: isSelected
                ? ShaderMask(
                    shaderCallback: (Rect bounds) => RadialGradient(
                      center: Alignment.topCenter,
                      colors: AppColors.g1,
                    ).createShader(bounds),
                    child: Image.asset(imagePath),
                  )
                : Image.asset(imagePath),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.n1,
            ),
          ),
        ],
      ),
    );
  }
}
