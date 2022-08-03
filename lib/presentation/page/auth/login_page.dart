import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:record_money_apps/config/app_asset.dart';
import 'package:record_money_apps/config/app_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  login() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DView.nothing(),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(AppAsset.logo),
                        DView.spaceHeight(40),
                        TextFormField(
                          controller: controllerEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value == '' ? 'Email Tidak boleh kosong' : null,
                          decoration: InputDecoration(
                              fillColor: AppColor.primary.withOpacity(0.5),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Email',
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              )),
                        ),
                        DView.spaceHeight(),
                        TextFormField(
                          controller: controllerPassword,
                          validator: (value) => value == ''
                              ? 'Password Tidak boleh kosong'
                              : null,
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            fillColor: AppColor.primary.withOpacity(0.5),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Password',
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                          ),
                        ),
                        DView.spaceHeight(),
                        Material(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            onTap: () => login(),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 16),
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'Belum punya akun?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
