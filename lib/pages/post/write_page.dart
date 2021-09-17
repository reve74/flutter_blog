import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_elevated_button.dart';
import 'package:flutter_blog/components/custom_text_formfield.dart';
import 'package:flutter_blog/components/custom_textarea.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class WritePage extends StatelessWidget {
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
              ),
              CustomTextArea(
                hint: "Content",
                funvalidator: validateContent(),
              ),
              CustomElevatedButton(
                text: "글쓰기",
                funPageRoute: () {
                  if (_formKey.currentState!.validate()) {
                    Get.off(HomePage());
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
