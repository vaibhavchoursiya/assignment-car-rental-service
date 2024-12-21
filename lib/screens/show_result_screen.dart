import 'package:car_rental_service/screens/home_screen.dart';
import 'package:car_rental_service/uitlites/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowResultScreen extends StatelessWidget {
  const ShowResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.light,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 120.0,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    foregroundColor: AppTheme.dark,
                    backgroundColor: Colors.transparent,
                  ),
                  label: const Text("Tesla"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Showing Result",
                          style: GoogleFonts.roboto(
                            color: Colors.deepPurple.withOpacity(0.8),
                            fontSize: 19.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "4 Matches found",
                          style: GoogleFonts.roboto(
                            color: AppTheme.dark.withOpacity(0.35),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.pushNamed("/filter");
                      },
                      icon: const Icon(Icons.category),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppTheme.dark.withOpacity(0.6),
                        backgroundColor: AppTheme.light,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            color: AppTheme.dark.withOpacity(0.6),
                          ),
                        ),
                      ),
                      label: Text(
                        "Filter",
                        style: GoogleFonts.roboto(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: AppTheme.primary,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45.0,
                        vertical: 10.0,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "For Sale",
                      style: GoogleFonts.roboto(
                        color: AppTheme.light,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: AppTheme.light,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45.0,
                        vertical: 10.0,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Rent",
                      style: GoogleFonts.roboto(
                        color: AppTheme.dark,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListItemCard();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
