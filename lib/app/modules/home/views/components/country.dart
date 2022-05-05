import 'package:flutter/material.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';

class CountrySelect extends StatefulWidget {
  const CountrySelect({Key? key}) : super(key: key);

  @override
  _CountrySelectState createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  late CountryPicker c;
  Country country = Country.fromJson(countryCodes[94]);

  @override
  void initState() {
    super.initState();
    c = CountryPicker(onCountrySelected: (Country country) {
      print(country);
      setState(() {
        this.country = country;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage(country.flagUri, package: 'ola_like_country_picker'),
          ),
        ),
      ),
      onTap: () {
        c.launch(context);
      },
    );
  }
}
