import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var _razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print('success');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print('faild');
  }

  TextEditingController paymentTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.yellowAccent,
                )),
            backgroundColor: Colors.black.withOpacity(0.7300000190734863),
            title: const Text(
              'Pay Fee',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'asset/img/karate-graduation-blackbelt-martial-arts.jpg'),
              ),
            ),
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: screenWidth / 1,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color.fromARGB(136, 0, 0, 0)),
                          child: Lottie.asset(
                              'asset/lottie/animation_lk7xcas0.json')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Card(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: paymentTextController,
                          decoration: const InputDecoration(
                              icon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.payments_sharp,
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: 'Enter Fees Amount',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHight / 4,
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.yellowAccent)),
                        onPressed: () {
                          var options = {
                            'key': 'rzp_test_g408urDfkHx1PE',
                            'amount':
                                (int.parse(paymentTextController.text) * 100),
                            'name': 'Shorinryu',
                            'description': 'Pay Fees',
                            'timeout': 300,
                            'prefill': {
                              'contact': '9742588812',
                              'email': 'muhammedmidlaj@gmail.com'
                            }
                          };
                          _razorpay.open(options);
                        },
                        child: const Text(
                          '        Pay       ',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
