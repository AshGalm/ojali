import 'package:flutter/material.dart';
import 'package:ojali/models/branches_model.dart';

class BranchCard extends StatefulWidget {
  const BranchCard({super.key, required this.branch, required this.onTap});

  final BranchesModel branch;
  final Function onTap;
  @override
  State<BranchCard> createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 200,
            height: 50,
            child: Image.network(
              widget.branch.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
