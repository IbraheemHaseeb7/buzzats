import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {


  static final supabase = Supabase.instance.client;
    
    
    
    static signUp(String password,String email) async{
      try {
        await supabase.auth.signUp(
          password: password, 
          email: email,
          );
      } on AuthException catch (e) {
        print(e);
      }
    }

    static login(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      print(e);
    }
  }

 static signOut() async {
    try {
      await supabase.auth.signOut();
      print('User signed out successfully');
    } on AuthException catch (e) {
      print(e);
    }
  }

  static User? getCurrentUser() {
    return supabase.auth.currentUser;
  }
}



