
import 'package:flutter/material.dart';
import 'package:newpages/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newpages/model/api_response.dart';
import 'package:newpages/model/user.dart';
import 'package:newpages/user/user.dart';
import 'package:newpages/_menu.dart';


void main() {
  runApp(const MyLogin());
}

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}
 class MyApp extends StatefulWidget {
   const MyApp({super.key});
 
   @override
   State<MyApp> createState() => _MyAppState();
 }

class _MyAppState extends State<MyApp> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  bool loading = false;

  Future<void> loginUser() async {

    ApiResponse response = await login(txtEmail.text, txtPassword.text);

    if(response.error == null){
      _saveAndRedirectToHome(response.data as User);
    } else {

      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('${response.error}')
          )
      );
    }
  }

  Future<void> _saveAndRedirectToHome(User user) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', user.token ?? '');
    await prefs.setInt('userId', user.id ?? 0);

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => UserPage()), (route) => false);

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(90.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

            Image.asset('assets/BoUp.png',
            height: 150,

            ),
              TextFormField(
                controller: txtEmail,
                decoration:   InputDecoration(
                  label: Text('Email Address'),
                  hintText: "Type your Valid Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)
                  ),
                ),
                validator: (String? value) {
                  if(value == null || value.isEmpty){
                    return 'Please enter your password!';
                  }
                  return null;
                },
              ),
              const Divider(),
              TextFormField(
                controller: txtPassword,
                obscureText: true,
                decoration:  InputDecoration(
                  label: Text('Password'),
                  hintText: "Type your Password",
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)
                  ),
                ),
                validator: (String? value) {
                  if(value == null || value.isEmpty || value.length<6){
                    return 'Please enter your password!';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                   if(_formKey.currentState!.validate()){
                     setState(() {
                       loading = true;
                       loginUser();
                       Navigator.push(context,
                         MaterialPageRoute(builder: (context)=>mainmenu()),
                       );
                     });
                   }
                  },
                ),
              ),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const RegistrationScreen()
                        )
                    );
                  },
                  child: const Text('Register'))
            ],
          ),
        ),
      ),
    );
  }

}

class RegistrationScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const RegistrationScreen({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  Future<void> registerUser() async {

    ApiResponse response = await register(_nameController.text, _emailController.text, _passController.text);

    if(response.error == null){
      print(response.data);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${response.data}'))
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('${response.error}')
          )
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration:  const InputDecoration(labelText: 'Name'),

            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passController,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {

                _saveData();
                _showDialog();
                if(_formKey.currentState!.validate()){
                  setState(() {
                    registerUser();
                  });
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('username', _usernameController.text);
    prefs.setString('password', _passController.text);
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registration Info'),
          content: Text('Name: ${_nameController.text}\nEmail: ${_emailController.text} \nUsername: ${_usernameController.text}\nPassword: ${_passController.text} '),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                //if yes
                Navigator.of(context).pop();
                _showConfirmationDialog('Accept');
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                //if no
                Navigator.of(context).pop();
                _showConfirmationDialog('Disagree');
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialog(String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: Text('You chose: $result'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


}
