import 'package:flutter/material.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({super.key});

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
                height: size.width * 0.7,
                width: size.width,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.asset('assets/ogbranches/t1.jpg'))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 4),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Our Main Brance is salemn",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "Address is",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "work hourse is ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
