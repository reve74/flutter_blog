import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';

import 'package:flutter_blog/size.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:flutter_blog/view/pages/post/write_page.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:flutter_blog/view/pages/user/user_info.dart';
import 'package:get/get.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // put 없으면 만들고, 있으면 찾기!
    UserController u = Get.find();
    PostController p = Get.put(PostController());
    p.findAll();
    

    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text("${u.isLogin}"),
      ),
      body: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.to(DetailPage(index), arguments: "argument 속성 테스트");
            },
            title: Text("제목1"),
            leading: Text("1"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    UserController u = Get.find();

    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(WritePage());
                },
                child: Text(
                  "글쓰기",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Get.to(UserInfo());
                },
                child: Text(
                  "회원 정보보기",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  u.logout();
                  Get.to(LoginPage());
                },
                child: Text(
                  "로그아웃",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
