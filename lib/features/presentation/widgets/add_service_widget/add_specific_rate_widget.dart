import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/widgets/add_service_widget/add_service_widget.dart';

class AddSpecificRate extends StatefulWidget {
  final void Function()? onTap;
  const AddSpecificRate({super.key, this.onTap});

  @override
  State<AddSpecificRate> createState() => _AddSpecificRateState();
}

class _AddSpecificRateState extends State<AddSpecificRate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
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
                    'Ex: Price, Quality, Performance, etc.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.n1,
                    ),
                  ),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 10),
                  const AddServiceReactionWidget()
                ],
              ),
            ),
            InkWell(
              onTap: widget.onTap,
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
