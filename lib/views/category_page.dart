import 'package:flutter/material.dart';
import 'package:samba_pos_test/model/yaml_data_model.dart';
import 'package:samba_pos_test/views/submenus_page.dart';

import '../service.dart';

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
        
        centerTitle: true,
        title: Text("${widget.item.name}"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var i = widget.item.items.elementAt(index);
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubmenusPage(item: i,),
                ),
              );
            },
            child: Container(
                padding: EdgeInsets.all(8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.9,
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
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.black,
          );
        },
        itemCount: widget.item?.items?.length ?? 0,
      ),
    );
  }
}
