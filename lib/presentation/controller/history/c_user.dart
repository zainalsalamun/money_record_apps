import 'package:get/get.dart';
import 'package:record_money_apps/data/model/user.dart';

class CUser extends GetxController {
  final _data = User().obs;
  User get data => _data.value;

  setData(n) => _data.value = n;
}
