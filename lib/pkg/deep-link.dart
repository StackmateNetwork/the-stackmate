// // ignore_for_file: import_of_legacy_library_into_null_safe
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:sats/zold/cubit/email-login.dart';

// abstract class IDeepLink {
//   void handleDeepLink(EmailCubit authBloc); //Function(String) linkReceived);
// }

// class DeepLink implements IDeepLink {
//   @override
//   void handleDeepLink(EmailCubit authBloc) async {
//     //Function(String) linkReceived) async {

//     final data = await FirebaseDynamicLinks.instance.getInitialLink();
//     if (data != null) _linkReceived(data, authBloc);

//     FirebaseDynamicLinks.instance.onLink(
//       onSuccess: (PendingDynamicLinkData? dynamicLink) async {
//         if (dynamicLink != null) _linkReceived(dynamicLink, authBloc);
//       },
//       onError: (OnLinkErrorException e) async {
//         print('onLinkError');
//         print(e.message);
//       },
//     );
//   }

//   _linkReceived(
//     PendingDynamicLinkData data,
//     EmailCubit authBloc,
//   ) {
//     //if (data == null) return;

//     final Uri deepLink = data.link;
//     if (deepLink != '') {
//       final link = deepLink.toString();

//       authBloc.deepLinkRecieved(link);
//       //linkReceived(link);
//     }
//   }
// }

// class DummyDeepLink implements IDeepLink {
//   @override
//   void handleDeepLink(EmailCubit authBloc) {}
//   //@override
//   //void handleDeepLink(Function(String) linkReceived) {}
// }
