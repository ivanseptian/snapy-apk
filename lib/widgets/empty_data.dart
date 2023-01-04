import 'package:flutter/cupertino.dart';
import '../config/assets.dart';

class BuildEmptyListView extends StatelessWidget {
  const BuildEmptyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsValue.emptyImage,
      fit: BoxFit.contain,
    );
  }
}