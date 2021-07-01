import 'package:flutter/material.dart';
import 'package:samba_pos_test/model/yaml_data_model.dart';
import 'package:samba_pos_test/views/submenus_page.dart';
import 'package:provider/provider.dart';
import '../providers/yaml_service.dart';

class CategoryPage extends StatefulWidget {
  final Item item;

  const CategoryPage({Key key, this.item}) : super(key: key);
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text("${widget.item.name}"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var i = widget.item.items.elementAt(index);
          return InkWell(
            onTap: () {
              var sMenusLength =
                  context.read<YamlService>().getSubmenuItems(i.subMenus);
              if ((sMenusLength.length ?? 0) > 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubmenusPage(
                      item: i,
                    ),
                  ),
                );
              }
            },
            child: Container(
                height: 100,
                padding: EdgeInsets.all(8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        image: AssetImage("${i.image}"),
                      ),
                    ),
                    Material(
                      elevation: 5,
                      color: Colors.transparent,
                      child: Text("${i.name}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    ),
                  ],
                )),
          );
        },
        itemCount: widget.item?.items?.length ?? 0,
      ),
    );
  }
}
