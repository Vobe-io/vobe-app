import 'package:Vobe/VobeStatelessWidget.dart';
import 'package:Vobe/bin/VobeSession.dart';
import 'package:Vobe/widgets/VobeTextField.dart';
import 'package:Vobe/widgets/VobeButton.dart';
import 'package:Vobe/bin/VobeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoginWidget extends VobeStatelessWidget {
  Widget buttonContent;

  var controller = {
    'username': TextEditingController(),
    'password': TextEditingController()
  };

  LoginWidget(VobeData data) : super(data);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 100,
              left: 30,
              right: 30,
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Log in',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF26283B),
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Avenir',
                      fontFamilyFallback: <String>[
                        'Helvetica',
                        'Arial',
                        'sans-serif'
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                VobeTextField(
                  controller: controller['username'],
                  icon: Icon(Icons.person),
                  hintText: 'username',
                ),
                SizedBox(height: 25),
                VobeTextField(
                  controller: controller['password'],
                  icon: Icon(Icons.lock),
                  hintText: '••••••',
                  obscure: true,
                ),
                SizedBox(height: 25),
                VobeButton(
                  text: "Log in",
                  onClick: () async {
                    final username = controller['username'];
                    final password = controller['password'];

                    var result = await this.vobeData.gqlClient.query(
                          QueryOptions(
                            documentNode: gql(
                                'query signin(\$usr: String!, \$pwd: String!){ signin(identity: \$usr, password: \$pwd) { token } }'),
                            variables: {
                              'usr': username.text.trim(),
                              'pwd': password.text.trim()
                            },
                          ),
                        );

                    if (result.hasException)
                      print(result.exception.graphqlErrors
                          .map((e) => e.message)
                          .join('\n'));

                    final vs = VobeSession(
                      sessionToken: result.data['signin']['token'].toString(),
                    );

                    if (vs != null) vobeData.useSession(vs);

                    print(vobeData.sessions[vobeData.activeSession].sessionToken);
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: 225,
                decoration: BoxDecoration(
                  color: Color(0xFF26283B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Align(
                      heightFactor: 4,
                      alignment: Alignment.center,
                      child: Text(
                        'Last Users'.toUpperCase(),
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text('...'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
