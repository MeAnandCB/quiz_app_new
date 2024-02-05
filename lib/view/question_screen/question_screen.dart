import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constant.dart';
import 'package:quiz_app/utils/question_db.dart';
import 'package:quiz_app/view/result_screen/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;
  int? selectedAnswerIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.myCustomBG,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Text(
            "${questionIndex + 1}/${QuestionsDb.questions.length}",
            style: TextStyle(
                color: questionIndex >= 5
                    ? Colors.red
                    : ColorConstants.myCustomBlue),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstants.myCustomGrey),
                child: Text(
                  QuestionsDb.questions[questionIndex]["question"],
                  style: TextStyle(
                      color: ColorConstants.myCustomWhite, height: 1.5),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:
                    QuestionsDb.questions[questionIndex]["options"].length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    selectedAnswerIndex = index;
                    print(selectedAnswerIndex);
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: getRightAnswer(index),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: getRightAnswer(index),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            QuestionsDb.questions[questionIndex]["options"]
                                [index],
                            style: TextStyle(
                                color: ColorConstants.myCustomWhite,
                                height: 1.5),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: ColorConstants.myCustomGrey,
                            child: CircleAvatar(
                              radius: 13,
                              backgroundColor: ColorConstants.myCustomBG,
                              child: buildRightAnswerIcons(index),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  selectedAnswerIndex = null;
                  if (questionIndex < QuestionsDb.questions.length - 1) {
                    questionIndex++;
                    print(questionIndex);
                    setState(() {});
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: ColorConstants.myCustomBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: ColorConstants.myCustomWhite, height: 1.5),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// to show the correct color on answer selection
  Color getRightAnswer(int index) {
    if (selectedAnswerIndex != null &&
        index == QuestionsDb.questions[questionIndex]["answer"]) {
      return ColorConstants.myCustomGreen;
    }

    if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex ==
          QuestionsDb.questions[questionIndex]["answer"]) {
        return ColorConstants.myCustomGreen;
      } else {
        return ColorConstants.myCustomRed;
      }
    } else {
      return ColorConstants.myCustomGrey;
    }
  }

  Widget buildRightAnswerIcons(int index) {
    if (selectedAnswerIndex != null &&
        index == QuestionsDb.questions[questionIndex]["answer"]) {
      return Icon(
        Icons.done,
        color: ColorConstants.myCustomGreen,
      );
    }
    if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex ==
          QuestionsDb.questions[questionIndex]["answer"]) {
        return Icon(
          Icons.done,
          color: ColorConstants.myCustomGreen,
        );
      } else {
        return Icon(Icons.close, color: ColorConstants.myCustomRed);
      }
    } else {
      return SizedBox();
    }
  }
}
