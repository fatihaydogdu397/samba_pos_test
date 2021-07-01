// To parse this JSON data, do
//
//     final yamlDataModel = yamlDataModelFromJson(jsonString);

import 'dart:convert';

YamlDataModel yamlDataModelFromJson(String str) => YamlDataModel.fromJson(json.decode(str));

String yamlDataModelToJson(YamlDataModel data) => json.encode(data.toJson());

class YamlDataModel {
    YamlDataModel({
        this.menus,
    });

    List<Menu> menus;

    factory YamlDataModel.fromJson(Map<String, dynamic> json) => YamlDataModel(
        menus: List<Menu>.from(json["menus"].map((x) => Menu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "menus": List<dynamic>.from(menus.map((x) => x.toJson())),
    };
}

class Menu {
    Menu({
        this.key,
        this.description,
        this.items,
        this.orderTag,
    });

    String key;
    String description;
    List<Item> items;
    String orderTag;

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        key: json["key"],
        description: json["description"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        orderTag: json["orderTag"] == null ? null : json["orderTag"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "description": description,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "orderTag": orderTag == null ? null : orderTag,
    };
}

class Item {
    Item({
        this.name,
        this.caption,
        this.image,
        this.items,
        this.price,
        this.subMenus,
    });

    String name;
    String caption;
    String image;
    List<Item> items;
    dynamic price;
    List<String> subMenus;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"] == null ? null : json["name"],
        caption: json["caption"] == null ? null : json["caption"],
        image: json["image"],
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        price: json["price"],
        subMenus: json["subMenus"] == null ? null : List<String>.from(json["subMenus"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {

        "name": name == null ? null : name,
        "caption": caption == null ? null : caption,
        "image": image,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
        "price": price,
        "subMenus": subMenus == null ? null : List<dynamic>.from(subMenus.map((x) => x)),
    };
    double get getPrice{
      var p=double.tryParse((this.price??"0.0").toString());
      return p;      
    }
}

class SubMenu {
    SubMenu({
        this.key,
        this.description,
        this.orderTag,
        this.items,
    });

    String key;
    String description;
    String orderTag;
    List<SubMenuItem> items;

    factory SubMenu.fromJson(Map<String, dynamic> json) => SubMenu(
        key: json["key"],
        description: json["description"],
        orderTag: json["orderTag"],
        items: List<SubMenuItem>.from(json["items"].map((x) => SubMenuItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "description": description,
        "orderTag": orderTag,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class SubMenuItem {
    SubMenuItem({
        this.name,
        this.image,
    });

    String name;
    String image;

    factory SubMenuItem.fromJson(Map<String, dynamic> json) => SubMenuItem(
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
    };
}






// class YamlDataModel {
//   List<Menus> menus;

//   YamlDataModel({this.menus});

//   YamlDataModel.fromJson(Map<String, dynamic> json) {
//     if (json['menus'] != null) {
//       menus = new List<Menus>();
//       json['menus'].forEach((v) {
//         menus.add(new Menus.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.menus != null) {
//       data['menus'] = this.menus.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Menus {
//   String key;
//   String description;
//   List<Items> items;
//   String orderTag;

//   Menus({this.key, this.description, this.items, this.orderTag});

//   Menus.fromJson(Map<String, dynamic> json) {
//     key = json['key'];
//     description = json['description'];
//     if (json['items'] != null) {
//       items = new List<Items>();
//       json['items'].forEach((v) {
//         items.add(new Items.fromJson(v));
//       });
//     }
//     orderTag = json['orderTag'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['key'] = this.key;
//     data['description'] = this.description;
//     if (this.items != null) {
//       data['items'] = this.items.map((v) => v.toJson()).toList();
//     }
//     data['orderTag'] = this.orderTag;
//     return data;
//   }
// }

// class Items {
//   String name;
//   String caption;
//   String image;
//   List<SubItem> items;
//   dynamic price;

//   Items({this.name, this.caption, this.image, this.items, this.price});

//   Items.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     caption = json['caption'];
//     image = json['image'];
//     if (json['items'] != null) {
//       items = new List<SubItem>();
//       json['items'].forEach((v) {
//         items.add(new SubItem.fromJson(v));
//       });
//     }
//     price = json['price'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['caption'] = this.caption;
//     data['image'] = this.image;
//     if (this.items != null) {
//       data['items'] = this.items.map((v) => v.toJson()).toList();
//     }
//     data['price'] = this.price;
//     return data;
//   }
// }

// class SubItem {
//   String name;
//   String caption;
//   String image;
//   List<SubItemItem> items;

//   SubItem({this.name, this.caption, this.image, this.items});

//   SubItem.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     caption = json['caption'];
//     image = json['image'];
//     if (json['items'] != null) {
//       items = new List<SubItemItem>();
//       json['items'].forEach((v) {
//         items.add(new SubItemItem.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['caption'] = this.caption;
//     data['image'] = this.image;
//     if (this.items != null) {
//       data['items'] = this.items.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class SubItemItem {
//   String name;
//   String caption;
//   String price;
//   String image;

//   SubItemItem({this.name, this.caption, this.price, this.image});

//   SubItemItem.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     caption = json['caption'];
//     price = json['price'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['caption'] = this.caption;
//     data['price'] = this.price;
//     data['image'] = this.image;
//     return data;
//   }
// }


