// ignore: undefined_prefixed_name

import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart'  if (dart.library.html)  'dart:ui' as ui;
import 'package:universal_html/html.dart' as html;
import 'package:core/utils/logger/Logger.dart';
import 'package:flutter/material.dart';



class Recaptcha extends StatefulWidget {
  const Recaptcha({
    super.key,
    required this.onChangeToken,
  });

  final Function(String) onChangeToken;

  @override
  State<Recaptcha> createState() => _RecaptchaState();
}

class _RecaptchaState extends State<Recaptcha> {
  String createdViewId = 'map_element';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: HtmlElementView(
        viewType: createdViewId,
      ),
    );
  }

  @override
  void initState() {
    Logger.d('initializing');

    ui.platformViewRegistry.registerViewFactory(
      createdViewId,
      (int viewId) => html.IFrameElement()
        ..style.height = '100%'
        ..style.width = '100%'
        ..src =
            'assets/assets/html/recaptcha.html' // Path to your HTML file containing the reCAPTCHA widget.
        ..style.border = 'none',
    );
    Logger.d('initialized');
    listenResponse();
    super.initState();
  }

  void listenResponse() {
    Logger.d('listenning');
    html.window.onMessage.listen((msg) {
      widget.onChangeToken.call(msg.data);
      Logger.d('msg is ${msg.data}');
    });
  }
}
