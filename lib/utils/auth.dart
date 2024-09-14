import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Método para realizar el registro de un usuario a la aplicación

  Future createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user);
      return {userCredential.user?.uid};
    } on FirebaseAuthException catch (e) {
      //Controlar los posibles errores que puedan ocurrir cuando
      //Se realize la inserción en Firebase
      if (e.code == "weak-password") {
        print("The password is too weak");
        return 1;
      }
      if (e.code == "email-already-in-use") {
        print("The email is already use");
        return 2;
      }
    } catch (e) {
      print(e);
    }
  }

  Future singInEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final dataUser = userCredential.user;

      if (dataUser?.uid != null) {
        return dataUser?.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return 1;
      }
      if (e.code == "wrong-password") {
        return 2;
      }
    }
  }
}
