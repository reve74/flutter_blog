import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';

import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_formfield.dart';
import 'package:flutter_blog/view/components/custom_textarea.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class UpdatePage extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PostController p = Get.find();
    _title.text = "${p.post.value.title}";
    _content.text = "${p.post.value.content}";
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                controller: _title,
                hint: "Title",
                funvalidator: validateTitle(),
              ),
              CustomTextArea(
                controller: _content,
                hint: "Content",
                funvalidator: validateContent(),
              ),
              CustomElevatedButton(
                text: "수정완료",
                funPageRoute: () async{
                  if (_formKey.currentState!.validate()) {
                    await p.updateById(p.post.value.id ?? 0, _title.text, _content.text);
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
