import 'package:graphql/client.dart';

import 'VobeSession.dart';

class VobeData {
  List<VobeSession> sessions = [];
  int activeSession;

  HttpLink httpLink;
  GraphQLClient gqlClient;

  VobeSession getSession() => sessions.length > 0
      ? sessions[activeSession]
      : throw Exception("No users are logged in");

  void useSession(VobeSession session) {
    assert(session != null);
    this.sessions.add(session);
    this.activeSession = sessions.length - 1;
  }
}
