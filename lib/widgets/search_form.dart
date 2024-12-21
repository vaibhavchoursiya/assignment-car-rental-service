import 'package:car_rental_service/providers/home_provider.dart';
import 'package:car_rental_service/uitlites/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({
    super.key,
  });

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    final categoryValue = context
        .select<HomeProvider, String>((provider) => provider.categoryValue);

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            SizedBox(
              width: 90.0,
              child: DropdownButtonFormField(
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppTheme.primary,
                ),
                iconSize: 42.0,
                decoration: const InputDecoration(border: InputBorder.none),
                value: categoryValue,
                items: context.read<HomeProvider>().categoryList.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.dark.withOpacity(0.8),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  context
                      .read<HomeProvider>()
                      .changeCategoryValue(value.toString());
                },
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                style: GoogleFonts.roboto(),
                controller: context.read<HomeProvider>().searchController,
                onFieldSubmitted: (value) {
                  context.pushNamed("/show_result");
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type city, neighbourhood or address",
                  hintStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    color: AppTheme.dark.withOpacity(0.35),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
