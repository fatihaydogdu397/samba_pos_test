import 'package:flutter/material.dart';
import 'package:samba_pos_test/model/yaml_data_model.dart';
import 'package:provider/provider.dart';
import 'package:samba_pos_test/providers/yaml_service.dart';

class SubmenusPage extends StatefulWidget {
  final Item item;

  const SubmenusPage({Key key, this.item}) : super(key: key);
  @override
  _SubmenusPageState createState() => _SubmenusPageState();
}

class _SubmenusPageState extends State<SubmenusPage> {
  List<Menu> subMenu = [];
  Map<String, dynamic> selections = {};

  @override
  void initState() {
    subMenu = [];
    subMenu = context.read<YamlService>().getSubmenuItems(widget.item.subMenus);

    subMenu.forEach((element) {
      selections[element.key] = 0;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(selections);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text("${widget.item.caption}"),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          var i = subMenu.elementAt(index);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${i.description}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.red[900]),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: i.items.length,
                  itemBuilder: (_, aIndex) {
                    var k = i.items.elementAt(aIndex);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(4),
                        elevation: 5,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image(
                                image: AssetImage("${k.image}"),
                                width: 120,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<int>(
                                title: Text("${k.name}"),
                                subtitle: Text("${k?.price ?? 0} ₺"),
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                value: aIndex,
                                groupValue: selections[i.key],
                                onChanged: (int index) {
                                  print(selections[i.key]);
                                  print(index);
                                  setState(() {
                                    selections[i.key] = index;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          );
        },
        separatorBuilder: (_, index) {
          return Divider();
        },
        itemCount: subMenu?.length ?? 0,
      ),
    );
  }
}

