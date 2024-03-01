import 'package:flutter/cupertino.dart';

class CurrencyPickerWidget extends StatefulWidget {
  final List<String> currencies;
  final String? selectedCurrency;
  // final Map<String, double> prices;
  final Function(String)? onCurrencyChanged;

  const CurrencyPickerWidget({
    required this.currencies,
    this.selectedCurrency,
    // required this.prices,
    this.onCurrencyChanged,
  });

  @override
  _CurrencyPickerWidgetState createState() => _CurrencyPickerWidgetState();
}

class _CurrencyPickerWidgetState extends State<CurrencyPickerWidget> {
  String? _selectedCurrency;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   // height: 200,
    //   child:
    return CupertinoPicker.builder(
      itemExtent: 40,
      onSelectedItemChanged: (index) {
        setState(() {
          _selectedCurrency = widget.currencies[index];
        });
        if (widget.onCurrencyChanged != null) {
          widget.onCurrencyChanged!(widget.currencies[index]);
        }
      },
      childCount: widget.currencies.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Text(
            widget.currencies[index],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      // ),
    );
  }
}
