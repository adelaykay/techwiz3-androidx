import 'dart:math';

class PaymentInfo {
  final String cardNumber;
  final String expiry;
  final String serviceProvider;
  final String cvv;

  PaymentInfo({
    required this.cardNumber,
    required this.expiry,
    required this.serviceProvider,
    required this.cvv,
  });
}

class PaymentInfoGenerator {
  static List<String> _serviceProviders = ['Visa', 'MasterCard', 'Verve'];

  static String _generateRandomCardNumber() {
    Random random = Random();
    String cardNumber = '';
    for (int i = 0; i < 4; i++) {
      cardNumber += (1000 + random.nextInt(9000)).toString();
      if (i < 3) cardNumber += '-';
    }
    return cardNumber;
  }

  static String _generateRandomExpiry() {
    Random random = Random();
    int month = random.nextInt(12) + 1;
    int year = DateTime.now().year + random.nextInt(5);
    return '$month/${year.toString().substring(2)}';
  }

  static PaymentInfo generateRandomPaymentInfo() {
    Random random = Random();
    String serviceProvider = _serviceProviders[random.nextInt(3)];
    return PaymentInfo(
      cardNumber: _generateRandomCardNumber(),
      expiry: _generateRandomExpiry(),
      serviceProvider: serviceProvider,
      cvv: random.nextInt(1000).toString(),
    );
  }

  static List<PaymentInfo> generateRandomPaymentInfoList(int count) {
    List<PaymentInfo> paymentInfoList = [];
    for (int i = 0; i < count; i++) {
      paymentInfoList.add(generateRandomPaymentInfo());
    }
    return paymentInfoList;
  }
}

