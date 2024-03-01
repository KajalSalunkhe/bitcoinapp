class CurrencyData {
  final String code;
  final String symbol;
  final String rate;
  final String description;

  CurrencyData({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
  });

  factory CurrencyData.fromJson(Map<String, dynamic> json) {
    return CurrencyData(
      code: json['code'],
      symbol: json['symbol'],
      rate: json['rate'],
      description: json['description'],
    );
  }
}
