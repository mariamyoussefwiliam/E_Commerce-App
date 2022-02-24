class HomeModel {
  bool? success;
  Data? data;
  String? message;

  HomeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  List<Sliders>? sliders;
  List<Categories>? categories;
  List<MostSeller>? mostSeller;
  List<NewProducts>? newProducts;
  List<HappinessAchievements>? happinessAchievements;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(Sliders.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['most_seller'] != null) {
      mostSeller = <MostSeller>[];
      json['most_seller'].forEach((v) {
        mostSeller!.add(MostSeller.fromJson(v));
      });
    }

    if (json['new_products'] != null) {
      newProducts = <NewProducts>[];
      json['new_products'].forEach((v) {
        newProducts!.add(NewProducts.fromJson(v));
      });
    }
    if (json['happiness_achievements'] != null) {
      happinessAchievements = <HappinessAchievements>[];
      json['happiness_achievements'].forEach((v) {
        happinessAchievements!.add(HappinessAchievements.fromJson(v));
      });
    }
  }
}

class Sliders {
  int? id;
  String? imageWithBase;

  Sliders({this.id, this.imageWithBase});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageWithBase = json['image_with_base'];
  }
}

class Categories {
  int? id;
  int? status;
  int? showHome;
  String? name;

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    showHome = json['show_home'];
    name = json['name'];
  }
}

class MostSeller {
  int? id;
  String? name;
  int? price;
  String? categoriesName;
  String? imageWithBase;

  MostSeller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    categoriesName = json['categories_name'];
    imageWithBase = json['image_with_base'];
  }
}

class NewProducts {
  int? id;
  String? name;
  int? price;
  String? categoryName;
  String? imageWithBase;

  NewProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    categoryName = json['categoryName'];
    imageWithBase = json['image_with_base'];
  }
}

class HappinessAchievements {
  int? id;
  String? thumb;
  String? imageWiteBase;

  HappinessAchievements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumb = json['thumb'];
    imageWiteBase = json['image_wite_base'];
  }
}
