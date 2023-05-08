import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ojali/widgets/clickable_widgets/main_button.dart';
import 'package:ojali/widgets/input_widgets/text_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../helpers/const.dart';
// import '../../providers/cart_provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/dark_theme_provider.dart';
import '../../widgets/input_widgets/addres_field_widget.dart';
import '../handling_screens/order_succed.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);
    CartProvider cartProvider = Provider.of<CartProvider>(
      context,
    );
    return Scaffold(
        backgroundColor: themeListener.isDark ? darkColor : lightColor,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.order,
            style: TextStyle(
                color: themeListener.isDark ? Colors.white : Colors.black),
          ),
          centerTitle: true,
          backgroundColor:
              themeListener.isDark ? Colors.transparent : Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: themeListener.isDark
                ? lightColor
                : darkColor, //change your color here
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                AppLocalizations.of(context)!.user_data,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: themeListener.isDark ? subColor : appColor),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFieldWidget(
                  label: AppLocalizations.of(context)!.name,
                  controller: nameController,
                  hintText: '',
                  validator: (value) {
                    return null;
                  },
                  obSecureText: false),
              const SizedBox(
                height: 10.0,
              ),
              TextFieldWidget(
                  label: AppLocalizations.of(context)!.phonenumber,
                  controller: phoneController,
                  hintText: AppLocalizations.of(context)!.phone,
                  validator: (value) {
                    return null;
                  },
                  obSecureText: false),
              const SizedBox(
                height: 10.0,
              ),
              AddresFieldWidget(
                  label: AppLocalizations.of(context)!.address,
                  controller: addressController,
                  hintText: '',
                  validator: (value) {
                    return null;
                  },
                  obSecureText: false),
              const SizedBox(
                height: 10.0,
              ),
              MainButton(
                  text: AppLocalizations.of(context)!.continu,
                  withBorder: false,
                  widthFromScreen: 0.9,
                  isloading: false,
                  onPressed: () async {
                    firestore.collection('orders').add({
                      'uid': auth.currentUser!.uid,
                      'name': nameController.text,
                      'phone': phoneController.text,
                      'address': addressController.text,
                      'order': cartProvider.getCartProductList
                          .map((e) => e.toJson())
                          .toList(),
                      'status': ""
                    }).then((value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const SuccedOrder()),
                          (route) => false);
                    });
                  })
            ]),
          ),
        ));
  }
}
