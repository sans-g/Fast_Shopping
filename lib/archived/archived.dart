import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practice_time/archived/deleteShoppingList.dart';
import 'package:practice_time/operations.dart';

class Archived extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    bool archived = true;

    return Scaffold(
        body: ListView(children: [
      StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("Shopping_lists").snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : Container(
                    height: double.maxFinite,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data =
                              snapshot.data.documents[index];
                          return data['archived'] == true
                              ? ListTile(
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.unarchive,
                                          ),
                                          onPressed: () {
                                            editProduct(
                                                data.documentID, archived);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          icon: Icon(Icons.delete_forever),
                                          onPressed: () {
                                           return showDialog(context: context,builder: (context)=>DeletingShoppingList(id: data['List_name'],doc: data,));
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  height: 0,
                                );
                        }));
          })
    ]));
  }
}
