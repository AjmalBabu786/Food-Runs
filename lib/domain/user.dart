import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModal {
  final String username;
  final String email;
  UserModal({
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': username,
      'email': email,
    };
  }

  static UserModal fromJson(Map<String, dynamic> json) {
    return UserModal(
      username: json['userName'],
      email: json['email'],
    );
  }

  static Future<void> createUser({
    required String username,
    required String email,
  }) async {
    final userDoc = FirebaseFirestore.instance
        .collection('FoodRuns')
        .doc('user')
        .collection('profile')
        .doc(email);

    final user = UserModal(
      username: username,
      email: email,
    );

    final json = user.toJson();
    await userDoc.set(json);
  }

  static Future<UserModal> showUserData(String email) async {
    final data = await FirebaseFirestore.instance
        .collection('FoodRuns')
        .doc("user")
        .collection("profile")
        .doc(email)
        .get();

    final user = UserModal.fromJson(data.data()!);
    return user;
  }

  // static Stream<List<UserModal>> getUsers() {
  //   final CollectionReference usersCollection =
  //       FirebaseFirestore.instance.collection('FoodRuns');
  //   final data = usersCollection.snapshots().map((snapshot) => snapshot.docs
  //       .map((doc) => UserModal.fromJson(doc.data()))
  //       .toList());
  //   log(data.toString());
  //   return data;
  // }

  // static Stream<List<UserModal>> showUserData() {
  //   final data = FirebaseFirestore.instance
  //       .collection('FoodRuns')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       return UserModal.fromJson(doc.data());
  //     }).toList();

  //   });

  //   log(data.toString());
  //   return data;
  // }
}





// class NewUserModal {
//  final String name;
// final  String email;

//   NewUserModal( { required this.name, required this.email});

//      NewUserModal fromJson(Map<String, dynamic> json) {
//     return NewUserModal(


//        name: json['userName'],
//        email: json['email'],
//     );
//   }


//     // NewUserModal.fromSnapshot(DocumentSnapshot snapshot)
//     //   : name = snapshot.data()["name"],
//     //     email = snapshot.data()["email"];
// }


// class UserService {
//   final CollectionReference _usersCollection =
//       FirebaseFirestore.instance.collection('FoodRuns');

//   Stream<List<NewUserModal>> getUsers() {
//     return _usersCollection.snapshots().map((snapshot) => snapshot.docs.map((doc) => NewUserModal.fromJson(doc.data()))).toList();
//   }

    
// }
