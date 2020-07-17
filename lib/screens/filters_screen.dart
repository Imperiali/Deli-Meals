import 'package:delimeals/widget/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegeterian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];

    super.initState();
  }

  void _saveFilters() {
    final _filters = {
      'gluten': _glutenFree,
      'vegetarian': _vegeterian,
      'vegan': _vegan,
      'lactose': _lactoseFree,
    };
    widget.saveFilters(_filters);
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Filter')),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only gluten-free meals',
                    _glutenFree,
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                      _saveFilters();
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose-free',
                    'Only lactose-free meals',
                    _lactoseFree,
                    (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                      _saveFilters();
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'Only vegetarian meals',
                    _vegeterian,
                    (newValue) {
                      setState(() {
                        _vegeterian = newValue;
                      });
                      _saveFilters();
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only vegan meals',
                    _vegan,
                    (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                      _saveFilters();
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
