import 'package:car_rental_service/providers/home_provider.dart';
import 'package:car_rental_service/uitlites/app_theme.dart';
import 'package:car_rental_service/widgets/card_body.dart';
import 'package:car_rental_service/widgets/drawer_line_painter.dart';
import 'package:car_rental_service/widgets/search_form.dart';
import 'package:car_rental_service/widgets/select_button_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List sections = [];

  @override
  Widget build(BuildContext context) {
    final currentScreenIndex = context
        .select<HomeProvider, int>((provider) => provider.currentScreenIndex);

    return Scaffold(
      bottomNavigationBar:
          AppBottomNavigationBar(currentScreenIndex: currentScreenIndex),
      backgroundColor: AppTheme.light,
      body: const ExploreSection(),
    );
  }
}

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentScreenIndex,
  });

  final int currentScreenIndex;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
      child: BottomNavigationBar(
        elevation: 10.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentScreenIndex,
        backgroundColor: AppTheme.primary,
        selectedItemColor: AppTheme.light,
        unselectedItemColor: AppTheme.light.withOpacity(0.6),
        selectedLabelStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
        ),
        iconSize: 28.0,
        onTap: (value) {
          context.read<HomeProvider>().changeScreenIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: Icon(
                Icons.search_rounded,
              ),
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: Icon(
                Icons.favorite_outline,
              ),
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: Icon(
                Icons.message,
              ),
            ),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: Icon(
                Icons.person_2_outlined,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class ExploreSection extends StatelessWidget {
  const ExploreSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const NavBar(),
              const SizedBox(
                height: 25.0,
              ),
              Text(
                "Thousands of cars \nwaiting for you",
                style: GoogleFonts.roboto(
                  fontSize: 30.0,
                  height: 1.2,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              const SearchForm(),
              const SizedBox(
                height: 20.0,
              ),
              const SelectButtonsRow(),
              const SizedBox(
                height: 25.0,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListItemCard();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ListItemCard extends StatelessWidget {
  const ListItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 12.0, bottom: 12.0, left: 12.0, right: 12.0),
      decoration: BoxDecoration(
        color: AppTheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CardImageStackWidget(),
          const SizedBox(
            height: 10.0,
          ),
          const CardBody(),
          const SizedBox(
            height: 5.0,
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(
              "View Details",
              style: GoogleFonts.roboto(
                color: AppTheme.primary.withOpacity(0.45),
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardImageStackWidget extends StatelessWidget {
  const CardImageStackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200.0,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2021/01/21/11/09/tesla-5937063_1280.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            // backgroundBlendMode: BlendMode.colorBurn,
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(125, 64, 88, 219),
                Color.fromARGB(45, 201, 195, 195)
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        )),
        Positioned(
          bottom: 8.0,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                backgroundColor: const Color.fromARGB(255, 61, 48, 85),
                elevation: 0.0,
                side: BorderSide.none,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                ),
                label: Text(
                  "1/32",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.light,
                  ),
                ),
              ),
              Chip(
                backgroundColor: AppTheme.primary,
                elevation: 0.0,
                side: BorderSide.none,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                ),
                label: Text(
                  "\$3,00000",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.light,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPaint(
          painter: DrawerLinePainter(strokeWidth: 3.5),
          child: const SizedBox(
            width: 56.0,
            height: 56.0,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundColor: AppTheme.primary,
            child: Text(
              "P",
              style: TextStyle(color: AppTheme.light),
            ),
          ),
        ),
      ],
    );
  }
}
