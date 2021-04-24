import 'package:book_shop/models/sizas_center_model.dart';
import 'package:book_shop/screens/sizas_center/components/group_details_body.dart';
import 'package:book_shop/screens/sizas_center/components/group_list.dart';
import 'package:book_shop/services/article_api_manager.dart';
import 'package:flutter/material.dart';

class GroupBody extends StatefulWidget {
  final int zoneId;

  const GroupBody({Key key, this.zoneId}) : super(key: key);
  @override
  _GroupBodyState createState() => _GroupBodyState();
}

class _GroupBodyState extends State<GroupBody> {
  Future<SizasCenter> _sizas_center;

  @override
  void initState() {
    print("api calling starting............");
    _sizas_center =
        API_Manager().getSIzasCenterMember(widget.zoneId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Container(
            height: 196.5,
            width: double.infinity,
            child: Image.asset("assets/images/coverphoto/islamic.jpg"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: FutureBuilder<SizasCenter>(
                future: _sizas_center,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (context, index) {
                          print("list builder calling........");
                          var group = snapshot.data.data[index];
                          return GroupList(
                            groupName: group.name,
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GroupDetailsBody(
                                      memberDetails: group.member,
                                    ),
                                  ));
                            },
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.amber,
    elevation: 0,
    title: Text(
      "Sizas Center",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
