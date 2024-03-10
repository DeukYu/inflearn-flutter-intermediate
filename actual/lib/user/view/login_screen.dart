import 'dart:convert';

import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:actual/common/const/colors.dart';
import 'package:actual/common/const/data.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/common/view/root_tab.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    return DefaultLayout(
        child: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Title(),
              _SubTitle(),
              Image.asset(
                'assets/img/misc/logo.png',
                width: MediaQuery.of(context).size.width / 5 * 2,
                height: MediaQuery.of(context).size.height / 5 * 2,
              ),
              CustomTextFormField(
                hintText: "이메일을 입력해주세요.",
                onChanged: (String value) {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                  hintText: "비밀번호를 입력해주세요.",
                  obscureText: true,
                  onChanged: (String value) {}),
              ElevatedButton(
                  onPressed: () async {
                    final rawString = 'test@codefactory.ai:testtest';

                    Codec<String, String> stringToBase64 = utf8.fuse(base64);

                    String token = stringToBase64.encode(rawString);

                    final res = await dio.post('http://$ip/auth/login',
                        options: Options(
                            headers: {'authorization': 'Basic $token'}));

                    final refreshToken = res.data['refreshToken'];
                    final accessToken = res.data['accessToken'];

                    await storage.write(
                        key: REFRESH_TOKEN_KEY, value: refreshToken);
                    await storage.write(
                        key: ACCESS_TOKEN_KEY, value: accessToken);

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => RootTab(),
                    ));
                    print(res.data);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: PRIMARY_COLOR),
                  child: Text('로그인')),
              ElevatedButton(
                  onPressed: () async {
                    final refreshToken = '';
                    final res = await dio.post('http://$ip/auth/token',
                        options: Options(headers: {
                          'authorization': 'Bearer $refreshToken'
                        }));

                    print(res.data);
                  },
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(color: Colors.black)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: Text('회원가입'))
            ],
          ),
        ),
      ),
    ));
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '환영합니다!',
      style: TextStyle(
          fontSize: 34.0, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요! \n오늘도 성공적인 주문이 되길 :)',
      style: TextStyle(fontSize: 16.0, color: BODY_TEXT_COLOR),
    );
  }
}
