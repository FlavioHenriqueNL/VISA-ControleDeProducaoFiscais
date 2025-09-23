import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:visa_arapiraca_app/core/utils/session_helper.dart';

class Logout {
  void call(BuildContext context){
    final helper = StaticSessionHelper();
    helper.clear();
    context.go('/login');
  }
}