import 'package:flutter/material.dart';

class Topup extends StatelessWidget {
  const Topup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Payment Method'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              PaymentOptionCard(
                logo: 'assets/esewa.png',
                title: 'Esewa',
                onTap: () {
                  // Handle Esewa payment
                },
              ),
              const SizedBox(height: 5),
              PaymentOptionCard(
                logo: 'assets/khalti.png',
                title: 'Khalti',
                onTap: () {
                  // Handle Khalti payment
                },
              ),
              const SizedBox(height: 5),
              PaymentOptionCard(
                logo: 'assets/bank.png',
                title: 'BankLink',
                onTap: () {
                  // Handle BankLink payment
                },
              ),
              const SizedBox(height: 5),
              PaymentOptionCard(
                logo: 'assets/card.png',
                title: 'Credit/Debit Card',
                onTap: () {
                  // Handle Credit/Debit Card payment
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentOptionCard extends StatelessWidget {
  final String logo;
  final String title;
  final VoidCallback onTap;
  final IconData? suffixIcon = Icons.arrow_forward_ios;

  const PaymentOptionCard({
    super.key,
    required this.logo,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                logo,
                width: 70,
                height: 70,
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 70,),
              Icon(suffixIcon)
            ],
          ),
        ),
      ),
    );
  }
}
