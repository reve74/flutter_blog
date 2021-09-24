import 'package:flutter/material.dart';

import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_formfield.dart';
import 'package:flutter_blog/view/components/custom_textarea.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                hint: "Title",
                funvalidator: validateTitle(),
                value: "제목1",
              ),
              CustomTextArea(
                hint: "Content",
                funvalidator: validateContent(),
                value: "제목1" * 30,
              ),
              CustomElevatedButton(
                text: "수정완료",
                funPageRoute: () {
                  if (_formKey.currentState!.validate()) {
                    Get.back(); // 상태 관리 GetX 라이브러리 - Obs
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
