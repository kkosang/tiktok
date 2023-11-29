import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/widgets/form_button.dart';
import 'package:tiktok/features/onboarding/interests_screen.dart';

class BirthDayScreen extends StatefulWidget {
  const BirthDayScreen({super.key});

  @override
  State<BirthDayScreen> createState() => _BirthDayScreenState();
}

class _BirthDayScreenState extends State<BirthDayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  late DateTime initialDate;
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    initialDate = DateTime(now.year - 26);
    _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  void _setTextFieldDate(DateTime date) {
    final String textDate = date.toString().split(' ').first;
    _birthdayController.value =
        TextEditingValue(text: textDate); // controller를 통해 value값 지정하기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Gaps.v40,
          const Text(
            "When's your birthday?",
            style: TextStyle(
              fontSize: Sizes.size24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gaps.v8,
          const Text(
            "Your birthday won't be shown publicly",
            style: TextStyle(
              fontSize: Sizes.size16,
              color: Colors.black54,
            ),
          ),
          Gaps.v16,
          TextField(
            controller: _birthdayController,
            decoration: InputDecoration(
              enabled: false, // 입력 비활성화
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            cursorColor: Theme.of(context).primaryColor,
          ),
          Gaps.v20,
          GestureDetector(
              onTap: _onNextTap, child: const FormButton(disabled: false))
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: 250,
        child: CupertinoDatePicker(
          maximumDate: initialDate,
          initialDateTime: initialDate,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: _setTextFieldDate,
        ),
      )),
    );
  }
}
