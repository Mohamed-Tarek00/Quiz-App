import 'package:finalproject/models/user_model.dart';
import 'package:finalproject/providers/quiz_main_provider.dart';
import 'package:finalproject/routes/app_routes_name.dart';
import 'package:finalproject/services/auth_service.dart';
import 'package:finalproject/services/firebase_storage.dart';
import 'package:finalproject/utils/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider with ChangeNotifier {
  AuthState _state = AuthState.login;
  AuthState get state => _state;

  String? errMessage;
  String selectedGender = "Male";

  UserModel? currentUser;

  XFile? selectedImage;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phonrController = TextEditingController();

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void deleteImage() {
    selectedImage = null;
    notifyListeners();
  }

  Future<void> uploadImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    selectedImage = pickedImage;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    if (!loginFormKey.currentState!.validate()) return;

    _state = AuthState.loading;
    notifyListeners();

    try {
      await AuthService.instance.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      _state = AuthState.alreadyLogin;
      notifyListeners();
      AuthService.instance.currentUser =
          (await FireBaseStorage.instance.getUserData())!;
      currentUser = (AuthService.instance.currentUser);

      Navigator.pushReplacementNamed(context, AppRoutesName.homeRouteName);
    } catch (e) {
      errMessage = e.toString();
      _state = AuthState.error;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errMessage!)));
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    if (!signinFormKey.currentState!.validate()) return;
    _state = AuthState.loading;
    notifyListeners();
    try {
      await AuthService.instance.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      AuthService.instance.currentUser = UserModel(
        userImage: selectedImage?.path,
        email: emailController.text,
        userName: nameController.text,
        phoneNumber: phonrController.text,
        totalCorrectAnswers: 0,
        totalQuestions: 0,
        totalQuizsCompelete: 0,
        isMale: selectedGender == "Male" ? true : false,
      );
      await FireBaseStorage.instance.storeUserData(
        AuthService.instance.currentUser!,
      );
      _state = AuthState.register;
      notifyListeners();
      emailController.clear();
      passwordController.clear();
      Navigator.pushReplacementNamed(context, AppRoutesName.loginRouteName);
    } catch (e) {
      errMessage = e.toString();
      _state = AuthState.error;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errMessage!)));
      print(e.toString());
    }
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    _state = AuthState.loading;
    notifyListeners();

    try {
      await AuthService.instance.signOut();
      emailController.clear();
      passwordController.clear();
      QuizMainProvider().resetQuiz();
      _state = AuthState.login;
      notifyListeners();

      Navigator.pushReplacementNamed(context, AppRoutesName.loginRouteName);
    } catch (e) {
      errMessage = e.toString();
      _state = AuthState.error;
      notifyListeners();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errMessage!)));
    }
  }

  void navigateBetweenPages(BuildContext context, {required pageName}) {
    emailController.clear();
    passwordController.clear();
    selectedImage = null;
    Navigator.pushReplacementNamed(context, pageName);
  }

  Future<void> handleSplashLogic(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (AuthService.instance.isUserLoggedIn()) {
      final value = await FireBaseStorage.instance.getUserData();

      if (value != null) {
        AuthService.instance.currentUser = value;
        currentUser = value;

        print(AuthService.instance.currentUser?.userName ?? "No username");

        Navigator.pushReplacementNamed(context, AppRoutesName.homeRouteName);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutesName.loginRouteName);
      }
    } else {
      Navigator.pushReplacementNamed(context, AppRoutesName.loginRouteName);
    }
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }
}
