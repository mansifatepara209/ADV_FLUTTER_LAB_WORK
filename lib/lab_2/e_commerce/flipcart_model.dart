class DashboardModel {
  final String name;
  final String imageUrl;
  final double? price;
  final String? icon;

  DashboardModel({
    required this.name,
    required this.imageUrl,
    this.price,
    this.icon,
  });
}
