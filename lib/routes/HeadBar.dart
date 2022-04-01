import 'package:flutter/material.dart';

class HeadBar extends StatefulWidget with PreferredSizeWidget {
  const HeadBar({Key? key}) : super(key: key);

  @override
  _HeadBar createState() => _HeadBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HeadBar extends State<HeadBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Retail Store Management System',
        style: TextStyle(
          fontFamily: 'Cairo_Bold',
          fontSize: 25,
        ),
      ),
      automaticallyImplyLeading: true,
      centerTitle: true,
      backgroundColor: Colors.white,
      //leading: Image.asset('../assets/images/store-logo.png'),
      leadingWidth: 100,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
