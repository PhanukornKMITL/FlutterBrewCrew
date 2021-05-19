import 'package:brew_crew/model/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {

    return await brewCollection.doc(uid).set({
      'sugar': sugars, 'name': name, 'strength':strength,
    });
  }
  
  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.get('name')?? '',
        strength: doc.get('strength') ?? 0,
        sugar: doc.get('sugar')?? '0',

      );
    }).toList(); //?? คือถ้าไม่มีจะ returbn 
  }

  //get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
  }

}