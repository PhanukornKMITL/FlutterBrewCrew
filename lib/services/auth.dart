import 'package:brew_crew/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

    final FirebaseAuth _auth = FirebaseAuth.instance;

    //create user obj based on FirebaseUser
    MyUser _userFromFirebaseUser(User user){
      return user != null ? MyUser(uid: user.uid) : null ;

    }

  //auth change user stream
  Stream<MyUser> get user{
    return _auth.authStateChanges()
    //.map((User user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);

  }
  
  // sign in anon
  Future signInAnon() async{

    try{
     UserCredential result =  await _auth.signInAnonymously();
     User user = result.user;
     return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  


  // sign in with emial & password
  

  // register in with emial & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
        UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        User user = result.user;
        return _userFromFirebaseUser(user);
    } catch (e){
        print(e.toString());
        return null;
    }
  }

  

  // sign out
  Future signOut() async{
    try{
        return await _auth.signOut();
    } catch (e){
      print(e.toString());
      return null;
    }
  }

}