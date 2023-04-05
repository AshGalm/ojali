import 'package:flutter/material.dart';

import '../../helpers/const.dart';

class MyTabs extends StatefulWidget {
  const MyTabs({super.key});

  @override
  State<MyTabs> createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0,
                left: 18,
                right: 0,
                bottom: MediaQuery.of(context).padding.bottom),
            child: Flexible(
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _index == 0 ? mainColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              color: _index == 0 ? Colors.white : Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                "Home",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: _index == 0
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // 2

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _index == 1 ? mainColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.shop,
                              color: _index == 1 ? Colors.white : Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                "Store",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: _index == 1
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  //
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 2;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _index == 2 ? mainColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: _index == 2 ? Colors.white : Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                "Search",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: _index == 2
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  //

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _index = 3;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _index == 3 ? mainColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.settings,
                              color: _index == 3 ? Colors.white : Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                "Setting",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: _index == 3
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
