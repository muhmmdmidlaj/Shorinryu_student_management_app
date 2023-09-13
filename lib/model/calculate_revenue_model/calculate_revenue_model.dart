class RevenueData {
  final double totalRevenue;
  // final int difference;

  RevenueData({
    required this.totalRevenue,
    // required this.difference,
  });

  factory RevenueData.fromJson(Map<String, dynamic> json) {
    return RevenueData(
      totalRevenue: json['total_revenue'] as double,
      // difference: json['difference'] as int,
    );
  }
}
