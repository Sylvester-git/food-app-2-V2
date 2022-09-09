import 'package:flutter/material.dart';
import '../Screens/filter.dart';

class Drawerwidget extends StatelessWidget {
  const Drawerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 150,
            color: Colors.teal,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.food_bank_rounded,
                  color: Colors.white,
                  size: 50,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'DELIFOODS',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 25,
                  ),
                ),
              ],
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildlisttile('Favorite', Icons.favorite_rounded, () {
            //Tabscreen
            //Using pushReplacementNamed is more efficient because if removes the
            //previous page from the stack which if not done, the stack could keep on growing causng issues

            //To verify this the pushRwplacementNamed will not give you a back button icon at the appbar level.
            Navigator.of(context).pushReplacementNamed('./');
          }),
          _buildlisttile('Filter', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }

  Widget _buildlisttile(String text, IconData icon, VoidCallback ontaphandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 17,
        ),
      ),
      onTap: ontaphandler,
    );
  }
}
