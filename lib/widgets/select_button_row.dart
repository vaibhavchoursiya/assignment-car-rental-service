import 'package:car_rental_service/providers/home_provider.dart';
import 'package:car_rental_service/uitlites/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectButtonsRow extends StatelessWidget {
  const SelectButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectButton(
          text: "Buy",
          category: "Buy",
        ),
        SelectButton(
          text: "Rent",
          category: "Rent",
        ),
        SelectButton(
          text: "Sell",
          category: "Sell",
        ),
      ],
    );
  }
}

class SelectButton extends StatelessWidget {
  final String text;
  final String category;
  const SelectButton({
    super.key,
    required this.text,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final selectedCategory = context
        .select<HomeProvider, String>((provider) => provider.selectedCategory);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor:
            selectedCategory == category ? AppTheme.primary : AppTheme.light,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 45.0,
          vertical: 15.0,
        ),
      ),
      onPressed: () {
        context.read<HomeProvider>().changeSelectedCategory(category);
      },
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: selectedCategory == category
              ? AppTheme.light
              : AppTheme.dark.withOpacity(0.6),
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
