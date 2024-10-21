import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';

import '../../../../core/widgets/text_widget.dart';

class MoreRatingBar extends StatefulWidget {
  const MoreRatingBar({super.key});

  @override
  State<MoreRatingBar> createState() => _MoreRatingBarState();
}

class _MoreRatingBarState extends State<MoreRatingBar> {
  var _myColorOne = Colors.grey;
  var _myColorTwo = Colors.grey;
  var _myColorThree = Colors.grey;
  var _myColorFour = Colors.grey;
  var _myColorFive = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(50, 80, 190, 1.0),
              Color.fromRGBO(60, 90, 220, 1.0),
              Color.fromRGBO(72, 120, 217, 1.0),
              Color.fromRGBO(86, 142, 222, 1.0),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 60.0),
              child: Container(
                height: 5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: _myColorOne != Colors.grey ? const Icon(Icons.star, size: 35) : const Icon(Icons.star_border, size: 35),
                    onPressed: () => setState(() {
                      _myColorOne = Colors.orange;
                      _myColorTwo = Colors.grey;
                      _myColorThree = Colors.grey;
                      _myColorFour = Colors.grey;
                      _myColorFive = Colors.grey;
                    }),
                    color: _myColorOne,
                  ),
                  IconButton(
                    icon: _myColorTwo != Colors.grey ? const Icon(Icons.star, size: 35) : const Icon(Icons.star_border, size: 35),
                    onPressed: () => setState(() {
                      _myColorOne = Colors.orange;
                      _myColorTwo = Colors.orange;
                      _myColorThree = Colors.grey;
                      _myColorFour = Colors.grey;
                      _myColorFive = Colors.grey;
                    }),
                    color: _myColorTwo,
                  ),
                  IconButton(
                    icon: _myColorThree != Colors.grey ? const Icon(Icons.star, size: 35) : const Icon(Icons.star_border, size: 35),
                    onPressed: () => setState(() {
                      _myColorOne = Colors.orange;
                      _myColorTwo = Colors.orange;
                      _myColorThree = Colors.orange;
                      _myColorFour = Colors.grey;
                      _myColorFive = Colors.grey;
                    }),
                    color: _myColorThree,
                  ),
                  IconButton(
                    icon: _myColorFour != Colors.grey ? const Icon(Icons.star, size: 35) : const Icon(Icons.star_border, size: 35),
                    onPressed: () => setState(() {
                      _myColorOne = Colors.orange;
                      _myColorTwo = Colors.orange;
                      _myColorThree = Colors.orange;
                      _myColorFour = Colors.orange;
                      _myColorFive = Colors.grey;
                    }),
                    color: _myColorFour,
                  ),
                  IconButton(
                    icon: _myColorFive != Colors.grey ? const Icon(Icons.star, size: 35) : const Icon(Icons.star_border, size: 35),
                    onPressed: () => setState(() {
                      _myColorOne = Colors.orange;
                      _myColorTwo = Colors.orange;
                      _myColorThree = Colors.orange;
                      _myColorFour = Colors.orange;
                      _myColorFive = Colors.orange;
                    }),
                    color: _myColorFive,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            CustomTextWidget("Help us improve KWork?", textColor: context.appTheme.primary, fontWeight: FontWeight.bold, fontSize: 20),
            const SizedBox(height: 5),
            CustomTextWidget("Tell us improve we're doing well\n and what we can improve",
                textColor: context.appTheme.primary, fontWeight: FontWeight.w400, fontSize: 14),
            MaterialButton(
              onPressed: () {},
              shape: const StadiumBorder(),
              color: context.appTheme.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: CustomTextWidget("Rate KWork", textColor: context.appTheme.secondary),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}