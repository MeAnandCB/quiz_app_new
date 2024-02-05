import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.myCustomBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congrats!",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.myCustomWhite),
            ),
            Text(
              "90% Score",
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.myCustomGreen),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 250,
                height: 60,
                child: Center(
                    child: Text(
                  "Restart",
                  style: TextStyle(color: ColorConstants.myCustomWhite),
                )),
                decoration: BoxDecoration(
                    color: ColorConstants.myCustomOrange,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: ColorConstants.myCustomWhite, width: 2)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
