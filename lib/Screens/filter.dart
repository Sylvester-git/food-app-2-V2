import 'package:flutter/material.dart';
import '../Widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter_screen';
  final Function savefilters;
  final Map<String, bool> currentfilters;
  FiltersScreen(this.currentfilters, this.savefilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenfree = false;
  var _lactosefree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  initState() {
    _glutenfree = widget.currentfilters['Gluten']!;
    _lactosefree = widget.currentfilters['Lactose']!;
    _vegan = widget.currentfilters['Vegan']!;
    _vegetarian = widget.currentfilters['Vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            icon: Icon(Icons.save_outlined),
            onPressed: () {
              final selectedfilters = {
                'Gluten': _glutenfree,
                'Lactose': _lactosefree,
                'Vegan': _vegan,
                'Vegetarian': _vegetarian,
              };

              widget.savefilters(selectedfilters);
            },
          ),
        ]),
        drawer: Drawerwidget(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Adjust your meal selection',
                  style: Theme.of(context).textTheme.headline5),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildswitches(
                      'Gluten-Free',
                      'Only includes Gluten free meals',
                      _glutenfree, (newvalue) {
                    setState(() {
                      _glutenfree = newvalue;
                    });
                  }),
                  _buildswitches(
                      'Lactose-Free',
                      'Only includes Gluten free meals',
                      _lactosefree, (newvalue) {
                    setState(() {
                      _lactosefree = newvalue;
                    });
                  }),
                  _buildswitches('Vegan', 'Only includes Vegan meals', _vegan,
                      (newvalue) {
                    setState(() {
                      _vegan = newvalue;
                    });
                  }),
                  _buildswitches('Vegetarian', 'Only includes Vegitarian meals',
                      _vegetarian, (newvalue) {
                    setState(() {
                      _vegetarian = newvalue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildswitches(
    String title,
    String subtitle,
    bool currentvalue,
    Function(bool) newvalue,
  ) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentvalue,
        onChanged: newvalue);
  }
}
