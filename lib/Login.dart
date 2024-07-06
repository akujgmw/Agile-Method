import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_me/home-again.dart';
import 'main.dart';
import 'register.dart';

class MyloginPage extends StatefulWidget {
  const MyloginPage({super.key});

  @override
  State<MyloginPage> createState() => _MyloginPageState();
}

class _MyloginPageState extends State<MyloginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  bool? isUsernameEmpty;
  bool? isPasswordEmpty;

  @override
  void initState() {
    isUsernameEmpty = false;
    isPasswordEmpty = false;

    super.initState();
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 56),
        child: AppBar(
          toolbarHeight: 100,
          leadingWidth: 100, // set the width of the leading area
          leading: GestureDetector(
            child: SizedBox(
              width: 40, // set the width of the leading widget
              height: 60, // set the height of the leading widget
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyApp();
              }));
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return MyApp();
              // }));
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: SizedBox(
                height: 100,
                width: 420,
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Welcome Back! Glad To See You Again!',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF202244),
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ])),
              ),
            ),
            SizedBox(
              height: 130,
              width: 500,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 15, 30, 9),
                    child: TextField(
                      controller: usernameController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        errorText: isUsernameEmpty == true
                            ? 'Username harus diisi'
                            : null,
                        labelText: 'Enter Your Username',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Color(0xFFF7F8F9),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0, 30, 10),
                    child: TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscured,
                      focusNode: textFieldFocusNode,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          errorText: isPasswordEmpty == true
                              ? 'Password Harus Diisi'
                              : null,
                          labelText: 'Enter Your Password',
                          filled: true,
                          // isDense: true,
                          fillColor: Color(0xFFF7F8F9),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          // prefixIcon: Icon(Icons.lock_rounded, size: 24),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: _toggleObscured,
                              child: Icon(
                                _obscured
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 24,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: 420,
              child: GestureDetector(
                onTap: () {},
                child: Text.rich(
                  TextSpan(
                    text: 'Forgot Password?',
                    style: GoogleFonts.poppins(
                      color: Colors.blue,
                    ),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyHome();
                }));
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF7456F6),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFF7456F6), width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 195),
              ),
              child: Text(
                'Login',
                style: GoogleFonts.poppins(
                    fontSize: 13.0, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            const SizedBox(
              width: 420,
              height: 275,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyRegisterApp();
                }));
              },
              child: Text.rich(
                TextSpan(
                  text: 'Dont Have an Account?',
                  style: GoogleFonts.poppins(
                    color: Color(0xff8A94A4),
                  ),
                  children: [
                    TextSpan(
                        text: ' Register Now',
                        style: GoogleFonts.poppins(color: Color(0xff7456F6))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
