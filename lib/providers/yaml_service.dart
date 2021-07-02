import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:samba_pos_test/model/yaml_data_model.dart';
import 'package:yaml/yaml.dart';
import 'dart:convert';
import "package:flutter/services.dart" as s;

class YamlService with ChangeNotifier {
  YamlDataModel data;
  List<Item> get menus => data?.menus?.first?.items ?? [];
  List<Item> get submenus => data?.menus?.first?.items?.first?.items ?? [];

  //Dosyanın yüklenmesi ve modellenmesi işlerini yapar.
  init() {
    s.rootBundle.loadString('./menu.yaml').then((value) {
      final mapData = loadYaml(value);
      var jsondata = json.decode(json.encode(mapData));
      log(json.encode(mapData));
      data = YamlDataModel.fromJson(jsondata);
      notifyListeners();
    });
  }

    //Submenus arrayindeki keylere göre subMenu objelerini döndürür.
  List<Menu> getSubmenuItems(List<String> subMenus) {
    List<Menu> _menus = [];
    try {
      subMenus.forEach((element) {
        var sub = data.menus.singleWhere((i) => i.key == element);
        _menus.add(sub);
      });
    } catch (e) {}
    return _menus;
  }
}
