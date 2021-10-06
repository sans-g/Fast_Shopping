import 'package:flutter/material.dart';
import 'package:practice_time/current_widgets/current0.dart';
import 'package:practice_time/current_widgets/editlistdialog.dart';
import 'package:practice_time/current_widgets/new_list_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice_time/operations.dart';

class Current extends StatefulWidget {
  @override
  _CurrentState createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
  bool archived = false;
  int length;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
        body: Stack(
      children: [
        ListView(children: [
          StreamBuilder<QuerySnapshot>(
              stream:
                  Firestore.instance.collection("Shopping_lists").snapshots(),
              builder: (context, snapshot) {
                length = snapshot.data.documents.length;

                return !snapshot.hasData
                    ? Center(child: CircularProgressIndicator())
                    : length == 0
                        ? Current0()
                        : Container(
                            height: double.maxFinite,
                            width: double.infinity,
                            child: ListView.builder(
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot data =
                                      snapshot.data.documents[index];
                                  int currentLength = 0;
                                  int archivedLength = 0;

                                  for (int i = 0;
                                      i <= snapshot.data.documents.length;
                                      i++) {
                                    currentLength=currentLength+1;
                                   print(currentLength);


                                  }
                                  for (int i = 0;
                                      i <= snapshot.data.documents.length;
                                      i++) {
                                    archivedLength = data["archived"] == true
                                        ? archivedLength + 1
                                        : archivedLength;
                                    print("archived : $archivedLength");

                                  }

                                  return data['archived'] == true
                                      ? SizedBox(
                                          height: 0,
                                        )
                                      : ListTile(
                                          leading: Icon(
                                            Icons.list,
                                          ),
                                          title: Text(
                                            data['List_name'],
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          isThreeLine: true,
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                data['date'],
                                                style: TextStyle(fontSize: 16),
                                              )
                                            ],
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: IconButton(
                                                  icon: Icon(Icons.edit),
                                                  onPressed: () {
                                                    controller.text =
                                                        data["List_name"];
                                                    return showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            EditDialogBox(
                                                              controller1:
                                                                  controller,
                                                              id: data
                                                                  .documentID,
                                                            ));
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: IconButton(
                                                  icon: Icon(Icons.archive),
                                                  onPressed: () {
                                                    editProduct(data.documentID,
                                                        archived);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                }));
              })
        ]),
        Positioned(
          bottom: 9,
          right: 15,
          child: RaisedButton(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              return showDialog(
                  context: context, builder: (context) => NewListDialog());
            },
            color: Colors.yellow[600],
            child: Container(
              width: 115,
              height: 50,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    size: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "NEW LIST",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
