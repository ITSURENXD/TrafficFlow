import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:trafficflowdev/models/user.dart'
    as model; //to not have a clash with the firebase_auth when using the keyword "User"

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDeatils() async {
    User currentUser = _auth.currentUser!; //firebase auth
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  // SignUpUser
  Future<String> SignUpUser({
    required String email,
    required String password,
    required String username,
  }) async {
    String res =
        "[ERR 001] SignUpUser Function in the resources/auth_method.dart returned errors: ";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        //check for NUll Conditions
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        // Adding user to the database
        // creating User Model
        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          followers: [],
          following: [],
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = "[Error 012] The email is invalid.";
      }
      if (err.code == 'weak-password') {
        res =
            "[ERROR 013] The password is should be at least 6 characters long.";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Loggin in user
  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "[ERROR 024] Unaccounted Error Occurred during Login";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "[WARN 021]Please Enter all the fields.";
      }
    } on FirebaseAuthException catch (err) {
      //Need to work on this due to not knowing error codes
      if (err.code == 'user-not-found') {
        res = "[ERR 025] User Could Not Be Found";
      }
      if (err.code == 'invalid-credential') {
        res = "[ERR 026] Wrong Password";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
