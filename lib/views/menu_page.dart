import 'package:flutter/material.dart';
import 'package:samba_pos_test/providers/yaml_service.dart';
import 'package:samba_pos_test/views/category_page.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    context.read<YamlService>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<YamlService>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text("Siparişinizi Oluşturun"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var i = provider.menus.elementAt(index);

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    item: i,
                  ),
                ),
              );
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
                        width: MediaQuery.of(context).size.width ,
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
        
        itemCount: provider.menus?.length ?? 0,
      ),
    );
  }
}
