import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:http/http.dart' as http;

class PaymentHelper {
  Map<String, dynamic> paymentIntentData = {};
  Future<void> makePayment() async {
    try {
      paymentIntentData =
          await createPaymentIntent('20', 'AED'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  setupIntentClientSecret:
                      'sk_test_51POCosHLwuueJajRToD4C7WYvhDMDnr8CHpAtxeWV5cWP1sHMfaeZZSM5lhDrextiMphZEoSVQBhthYE8VeeJEP000oNK81vJ2',
                  paymentIntentClientSecret: paymentIntentData['client_secret'],
                  //applePay: PaymentSheetApplePay.,
                  //googlePay: true,
                  //testEnv: true,
                  //  customFlow: true,
                  style: ThemeMode.dark,

                  //  merchantCountryCode: 'US',
                  merchantDisplayName: 'Kashif'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  Future<String> createToken(
      CardFieldInputDetails details, String postalCode, String name) async {
    try {
      final cardDetails = CardDetails(
          number: '4242424242424242',
          expirationMonth: details.expiryMonth ?? 0,
          expirationYear: details.expiryYear ?? 0,
          cvc: '123');
      await Stripe.instance.dangerouslyUpdateCardDetails(cardDetails);
      var token = await Stripe.instance.createToken(
        CreateTokenParams.card(
          params: CardTokenParams(
            name: name ?? '',
            address: Address(
              line1: "abc",
              line2: "xyz",
              city: "Alpha",
              state: "Beta",
              country: "xy",
              postalCode: postalCode ?? '',
            ),
            currency: "AED",
            type: TokenType.Card,
          ),
        ),
      );

      String tokenId = token.id;
      logger.i("TOKEN DATA : $tokenId");
      return tokenId;
    } catch (e) {
      logger.e('$e');
      return 'No TOKEN';
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
              //       parameters: PresentPaymentSheetParameters(
              // clientSecret: paymentIntentData!['client_secret'],
              // confirmPayment: true,
              // )
              )
          .then((newValue) async {
        // var token = await getToken();
        // logger.i("TOKEN : $token");
        print('payment intent' + paymentIntentData['id'].toString());
        print('payment intent' + paymentIntentData['client_secret'].toString());
        print('payment intent' + paymentIntentData['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());

        //  var token = await getToken();
        //  logger.i(token);

        paymentIntentData = {};
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showSnackBarMessage(
          content: '$e',
          backgroundColor: allColors.errorColor,
          contentColor: allColors.canvasColor);
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51POCosHLwuueJajRToD4C7WYvhDMDnr8CHpAtxeWV5cWP1sHMfaeZZSM5lhDrextiMphZEoSVQBhthYE8VeeJEP000oNK81vJ2',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');

      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  Future<String> getToken() async {
    // Replace 'YOUR_STRIPE_SECRET_KEY' with your actual secret key
    String apiKey =
        'sk_test_51POCosHLwuueJajRToD4C7WYvhDMDnr8CHpAtxeWV5cWP1sHMfaeZZSM5lhDrextiMphZEoSVQBhthYE8VeeJEP000oNK81vJ2';

    // Construct the request body
    Map<String, dynamic> requestBody = {
      'card': {
        'token': 'tok_visa', // Use a test token provided by Stripe
      },
    };

    // Encode the request body
    String encodedBody = Uri.encodeQueryComponent(json.encode(requestBody));

    // Make the API call
    http.Response response = await http.post(
      Uri.parse('https://api.stripe.com/v1/tokens'),
      headers: {
        'Authorization':
            'Bearer pk_test_51POCosHLwuueJajREITZbz2DbdM3hoqfkZURrNuouM62i4FcYiyC6sy91TRtdmnqFxT2OoLEXbrCkd7EdwRgE1jP00oigPAnKH',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body:
          'card[number]=${requestBody['card']['number']}&card[exp_month]=${int.parse(requestBody['card']['exp_month'])}&card[exp_year]=${int.parse(requestBody['card']['exp_year'])}&card[cvc]=${int.parse(requestBody['card']['cvc'])}',
    );

    // Check the response
    if (response.statusCode == 200) {
      // Token created successfully
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      String tokenId = jsonResponse['id'];
      return tokenId;
    } else {
      // Error occurred
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      logger.e(jsonResponse);
      throw Exception('Failed to create token: ${response.statusCode}');
    }
  }
}
