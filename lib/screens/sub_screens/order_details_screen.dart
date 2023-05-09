import 'package:flutter/material.dart';
import 'package:ojali/providers/order_provider.dart';
import 'package:provider/provider.dart';

import '../../helpers/const.dart';
import '../../providers/dark_theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/clickable_widgets/order_card.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    Provider.of<OrdersProvider>(context, listen: false).getOrderByUid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: themeListener.isDark ? darkColor : Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: themeListener.isDark ? lightColor : darkColor,
        ),
        backgroundColor:
            themeListener.isDark ? Colors.transparent : Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.orders,
          style: TextStyle(color: themeListener.isDark ? lightColor : appColor),
        ),
      ),
      body: SingleChildScrollView(
        child:
            Consumer<OrdersProvider>(builder: (context, orderProvider, child) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: orderProvider.orderList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return OrderCard(
                  onTap: () {},
                  orderModel: orderProvider.orderList[index],
                );
              });
        }),
      ),
    );
  }
}
