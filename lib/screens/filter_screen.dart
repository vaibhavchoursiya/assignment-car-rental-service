import 'package:car_rental_service/providers/filter_provider.dart';
import 'package:car_rental_service/uitlites/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    final sliderValue = context
        .select<FilterProvider, double>((provider) => provider.sliderValue);
    final radioValue = context
        .select<FilterProvider, String>((provider) => provider.radioValue);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.cancel_outlined,
            color: AppTheme.dark.withOpacity(0.6),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Filter",
          style: GoogleFonts.roboto(
            color: Colors.deepPurple.withOpacity(0.6),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Text(
              "reset",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: AppTheme.dark.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelWidget(
                text: "Preferred Model",
              ),
              SizedBox(
                height: 80.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80, // Diameter of the circle
                      height: 80, // Diameter of the circle
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: AppTheme.primary,
                        shape: BoxShape.circle, // Ensures the shape is circular
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS47T5d8KWBGd2fIx2liI3KJnMKdC-PUSyYQ&s",
                          ),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const LabelWidget(
                text: "Vehicle Type",
              ),
              SizedBox(
                height: 60.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Chip(
                          labelStyle: GoogleFonts.roboto(
                            color: AppTheme.dark.withOpacity(
                              0.3,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                          side: const BorderSide(
                            color: Colors.grey,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          label: const Text("SUV"),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LabelWidget(text: "Price Range"),
                  LabelWidget(
                      text: sliderValue == 0.0
                          ? "\$0 - \$3000000"
                          : sliderValue.toStringAsFixed(0)),
                ],
              ),
              Slider(
                activeColor: AppTheme.primary,
                value: sliderValue,
                onChanged: (value) {
                  context.read<FilterProvider>().changeSliderValue(value);
                },
                min: 0.0,
                max: 3000000.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const LabelWidget(text: "Number of seats"),
              const SizedBox(
                height: 15.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectSeatWidget(
                    text: "any",
                  ),
                  SelectSeatWidget(
                    text: "1",
                  ),
                  SelectSeatWidget(
                    text: "2",
                    selected: true,
                  ),
                  SelectSeatWidget(
                    text: "3",
                  ),
                  SelectSeatWidget(
                    text: "4+",
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Radio(
                      activeColor: AppTheme.primary,
                      value: radioValue,
                      groupValue: context.read<FilterProvider>().radioValues[0],
                      onChanged: (value) {
                        context
                            .read<FilterProvider>()
                            .changeRadioValue(value.toString());
                      }),
                  Text(
                    "Sort by A-Z",
                    style: GoogleFonts.roboto(),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                      activeColor: AppTheme.primary,
                      value: radioValue,
                      groupValue: context.read<FilterProvider>().radioValues[1],
                      onChanged: (value) {
                        context
                            .read<FilterProvider>()
                            .changeRadioValue(value.toString());
                      }),
                  Text(
                    "Sort by default",
                    style: GoogleFonts.roboto(),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              const SetFilterButton()
            ],
          ),
        ),
      ),
    );
  }
}

class SetFilterButton extends StatelessWidget {
  const SetFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
          onPressed: () {
            context.pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          child: Text(
            "Set Filters",
            style: GoogleFonts.roboto(
              color: AppTheme.light,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          )),
    );
  }
}

class SelectSeatWidget extends StatelessWidget {
  final String text;
  final bool selected;
  const SelectSeatWidget({
    super.key,
    required this.text,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 22.0,
      ),
      margin: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: selected ? AppTheme.primary : AppTheme.light,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: selected ? AppTheme.light : AppTheme.dark,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class LabelWidget extends StatelessWidget {
  final String text;
  const LabelWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
