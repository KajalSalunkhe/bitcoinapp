import 'package:bitcoinapp/bloc/currency_bloc.dart';
import 'package:bitcoinapp/model/currency_data_model.dart';
import 'package:bitcoinapp/widget/currency_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => CurrencyBloc(),
        child: HomeScreenContent(),
      ),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  String? _selectedCurrency;

  final currencies = [
    '',
    'EUR',
    'GBP',
    'USD',
    'EUR',
    'GBP',
    'USD',
    'EUR',
    'GBP',
    'USD',
    'EUR',
    'GBP',
    'USD'
  ];

  @override
  void initState() {
    super.initState();
    context.read<CurrencyBloc>().add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        if (state is CurrencyLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CurrencyLoadedState) {
          final currencyData = state.currencyData;
          final currencyBpi = currencyData.bpi;
        
          final price =
              _selectedCurrency == null || _selectedCurrency == currencies.first
                  ? "Price"
                  : _getRate(currencyBpi, _selectedCurrency!);
          return Container(
            color: Color(0xFF04929B),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/bitcoin.png',
                  height: 160,
                ),
                Center(
                  child: Text(
                    ' $price',
                    style: const TextStyle(fontSize: 38, color: Colors.amber),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: CurrencyPickerWidget(
                    currencies: currencies,
                    selectedCurrency: _selectedCurrency ?? currencies.first,
                    // selectedCurrency: 'EUR',

                    onCurrencyChanged: (currency) {
                      setState(() {
                        _selectedCurrency = currency;
                        print("selected currency=$_selectedCurrency");
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is CurrencyErrorState) {
          print(state.errorMessage);
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }
}

String _getRate(Bpi? bpi, String currencyCode) {
  switch (currencyCode) {
    case 'USD':
      return bpi?.uSD?.rate ?? "Price";
    case 'GBP':
      return bpi?.gBP?.rate ?? "Price";
    case 'EUR':
      return bpi?.eUR?.rate ?? "Price";
    default:
      return "Price";
  }
}
