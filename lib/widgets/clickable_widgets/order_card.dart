import 'package:flutter/material.dart';
import 'package:ojali/helpers/const.dart';
import 'package:ojali/models/order_model.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key, required this.orderModel, required this.onTap});
  final OrderModel orderModel;
  final Function onTap;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    // final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.only(),
          child: Container(
            margin: const EdgeInsets.only(
                right: 25.0, left: 25.0, top: 5, bottom: 5),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: GestureDetector(
                onTap: () {
                  widget.onTap();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Text(
                            widget.orderModel.createdAt,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          )),
                      ListTile(
                        title: Text(
                          widget.orderModel.name,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          widget.orderModel.phone,
                          style: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                        trailing: Text(
                          widget.orderModel.status,
                          style: const TextStyle(
                              color: subColor, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
