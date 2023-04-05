import 'package:flutter/material.dart';

class BranchCard extends StatefulWidget {
  const BranchCard({super.key});

  @override
  State<BranchCard> createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 200,
          height: 50,
          child: Image.asset(
            'assets/ogbranches/t2.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
