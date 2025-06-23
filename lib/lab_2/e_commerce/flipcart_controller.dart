import 'flipcart_model.dart';

class DashboardController {
  List<DashboardModel> getCategories() {
    return [
      DashboardModel(name: "Mobiles", imageUrl: "", icon: "📱"),
      DashboardModel(name: "Fashion", imageUrl: "", icon: "👗"),
      DashboardModel(name: "Electronics", imageUrl: "", icon: "💻"),
      DashboardModel(name: "Home", imageUrl: "", icon: "🏠"),
      DashboardModel(name: "Toys", imageUrl: "", icon: "🧸"),
    ];
  }

  List<DashboardModel> getProducts() {
    return [
      DashboardModel(name: "iPhone 14", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQALRRnU0Nh6fLckRJrawR7rb014wNYl4PRBQ&s", price: 999.0),
      DashboardModel(name: "Samsung TV", imageUrl: "https://t4.ftcdn.net/jpg/10/80/95/83/360_F_1080958396_20twt6n5dj2GVLzM0E3l2uG6PrxPFAvA.jpg", price: 499.0),
      DashboardModel(name: "Nike Shoes", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQHzFc42BCRJn5UR7Bp7WB8FERK9G6mGwBqQ&s", price: 149.0),
      DashboardModel(name: "Washing Machine", imageUrl: "https://media.istockphoto.com/id/172485535/photo/washing-machine.jpg?s=612x612&w=0&k=20&c=heH0vH2hfuP7QLt4lGQvILj61sD5iuzs8sZk_izSazc=", price: 299.0),
    ];
  }
}
