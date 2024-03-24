import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yum_yard/utils/utils.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Container(
                height: 420,
                width: 280,
                decoration: BoxDecoration(
                  boxShadow: const [
                    const BoxShadow(
                      color: AppColors.ambient100,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                  color: AppColors.primary100,
                  image: const DecorationImage(
                    image: AssetImage('assets/onboarding.png'),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/logo.svg',
                    height: 120,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Delight Delivered,\nCravings Satisfied.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.primary100,
                    ),
              ),
              const SizedBox(height: 20),
              Text(
                'Savor the convenience of delicious meals delivered right to your doorstep.\nLet'
                's embark on a culinary journey together!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary100,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward,
                      size: 40,
                      color: AppColors.background,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
