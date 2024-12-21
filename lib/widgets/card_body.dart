import 'package:car_rental_service/uitlites/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Chip(
                backgroundColor: const Color.fromARGB(47, 193, 181, 216),
                elevation: 0.0,
                side: BorderSide.none,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                ),
                label: Text(
                  "On Sale",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(
                width: 6.0,
              ),
              Chip(
                backgroundColor: const Color.fromARGB(47, 193, 181, 216),
                elevation: 0.0,
                side: BorderSide.none,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                ),
                label: Text(
                  "Installment",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "Tesla Model Y",
            style: GoogleFonts.roboto(
              color: const Color.fromARGB(234, 51, 61, 114),
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
              ),
              const SizedBox(
                width: 2.0,
              ),
              Expanded(
                child: Text(
                  "123 Elm Street, Springfield, IL 62704, USA",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.dark.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
