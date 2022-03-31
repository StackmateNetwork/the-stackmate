// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:file_picker/file_picker.dart';
// import 'package:file_saver/file_saver.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:oktoast/oktoast.dart';
// import 'package:sats/cubit/logger.dart';
// import 'package:sats/model/address-book.dart';
// import 'package:sats/pkg/interface/clipboard.dart';
// import 'package:sats/pkg/interface/storage.dart';
// import 'package:sats/pkg/storage.dart';

// part 'address-book.freezed.dart';

// @freezed
// class AddressBookState with _$AddressBookState {
//   const factory AddressBookState({
//     @Default([]) List<AddressBookUser> users,
//     //
//     @Default(false) bool editUserDetails,
//     @Default(false) bool editKeyDetails,
//     //
//     @Default('') String editUserName,
//     @Default('') String errEditUserName,
//     //
//     @Default('') String editKeyName,
//     @Default('') String errKeyName,
//     //
//     @Default('') String editPublicKey,
//     @Default('') String errEditPublicKey,
//     //
//     //
//     @Default('') String editPath,
//     @Default('') String errEditPath,
//     //
//     //
//     @Default('') String editFingerPrint,
//     @Default('') String errFingerPrint,
//     //
//     //
//     @Default('') String editRescueDate,
//     @Default('') String errEditRescueDate,
//     //
//     //
//     AddressBookUser? selectedUser,
//     AddressBookKey? selectedKey,
//   }) = _AddressBookState;
//   const AddressBookState._();

//   bool canGoBack() => selectedUser == null && !editUserDetails;
// }

// class AddressBookCubit extends Cubit<AddressBookState> {
//   AddressBookCubit(
//     this._storage,
//     this._logger,
//     // this._vibrate,
//     this._clipBoard,
//   ) : super(const AddressBookState()) {
//     // deleteAll();
//     loadAddressUsers();
//   }

//   final IStorage _storage;
//   final Logger _logger;
//   // final IVibrate _vibrate;
//   final IClipBoard _clipBoard;

//   void loadAddressUsers() {
//     final users = _storage.getAll<AddressBookUser>(StoreKeys.AddressBookUser.name);
//     if (users.hasError) return;

//     emit(state.copyWith(users: users.result!));
//   }

//   void onBackPress() {
//     if (state.editKeyDetails)
//       cancelKeyEdit();
//     else if (state.selectedKey != null)
//       clearSelectedKey();
//     else if (state.editUserDetails)
//       cancelUserEdit();
//     else if (state.selectedUser != null) clearSelectedUser();
//   }

//   void userSelected(AddressBookUser user) {
//     emit(state.copyWith(selectedUser: user));
//   }

//   void clearSelectedUser() {
//     emit(state.copyWith(selectedUser: null));
//   }

//   void editUserSelected() {
//     if (state.selectedUser == null)
//       emit(state.copyWith(editUserDetails: true));
//     else
//       emit(
//         state.copyWith(
//           editUserDetails: true,
//           editUserName: state.selectedUser!.name,
//         ),
//       );
//   }

//   void cancelUserEdit() {
//     emit(
//       state.copyWith(
//         editUserDetails: false,
//         editUserName: '',
//         errEditUserName: '',
//       ),
//     );
//   }

//   void userNameChanged(String text) {
//     emit(
//       state.copyWith(
//         editUserName: text,
//         errEditUserName: '',
//       ),
//     );
//   }

//   void keySelected(AddressBookKey key) {
//     emit(state.copyWith(selectedKey: key));
//   }

//   void clearSelectedKey() {
//     emit(state.copyWith(selectedKey: null));
//   }

//   void editKeySelected() {
//     if (state.selectedKey == null)
//       emit(state.copyWith(editKeyDetails: true));
//     else
//       emit(
//         state.copyWith(
//           editKeyDetails: true,
//           editKeyName: state.selectedKey!.name,
//           editPublicKey: state.selectedKey!.publicKey,
//         ),
//       );
//   }

//   void cancelKeyEdit() {
//     emit(
//       state.copyWith(
//         editKeyDetails: false,
//         editKeyName: '',
//         editPublicKey: '',
//         errEditPublicKey: '',
//         errKeyName: '',
//       ),
//     );
//   }

//   void keyNameChanged(String text) {
//     emit(
//       state.copyWith(
//         editKeyName: text,
//         errKeyName: '',
//       ),
//     );
//   }

//   void pathChanged(String text) {
//     emit(
//       state.copyWith(
//         editPath: text,
//         errEditPath: '',
//       ),
//     );
//   }

//   void fingerprintChanged(String text) {
//     emit(
//       state.copyWith(
//         editFingerPrint: text,
//         errFingerPrint: '',
//       ),
//     );
//   }

//   void rescueDateChanged(String text) {
//     emit(
//       state.copyWith(
//         editRescueDate: text,
//         errEditRescueDate: '',
//       ),
//     );
//   }

//   void publicKeyChanged(String text) {
//     emit(
//       state.copyWith(
//         editPublicKey: text,
//         errEditPublicKey: '',
//       ),
//     );
//   }

//   void pasteKey() async {
//     final text = await _clipBoard.pasteFromClipBoard();
//     emit(
//       state.copyWith(
//         editPublicKey: text,
//         errEditPublicKey: '',
//       ),
//     );
//   }

//   void pasteFingerprint() async {
//     final text = await _clipBoard.pasteFromClipBoard();
//     emit(
//       state.copyWith(
//         editFingerPrint: text,
//         errFingerPrint: '',
//       ),
//     );
//   }

//   void pastePath() async {
//     final text = await _clipBoard.pasteFromClipBoard();
//     emit(
//       state.copyWith(
//         editPath: text,
//         errEditPath: '',
//       ),
//     );
//   }

//   void pasteRescueDate() async {
//     final text = await _clipBoard.pasteFromClipBoard();
//     emit(
//       state.copyWith(
//         editRescueDate: text,
//         errEditRescueDate: '',
//       ),
//     );
//   }

//   void copyKey(String text) async {
//     await _clipBoard.copyToClipBoard(text);
//   }

//   void saveUserClicked() async {
//     try {
//       if (state.selectedUser != null) {
//         final newUser = AddressBookUser(
//           name: state.editUserName,
//           keys: state.selectedUser!.keys,
//           id: state.selectedUser!.id,
//         );

//         // final idx = state.users.indexOf(state.selectedUser!);

//         // _storage.deleteItem<AddressBookUser>(
//         //   StoreKeys.AddressBookUser.name,
//         //   state.selectedUser,
//         // );
//         // final id = await _storage.saveItem<AddressBookUser>(
//         //   StoreKeys.AddressBookUser.name,
//         //   newUser,
//         // );
//         // newUser = newUser.copyWith(id: id);
//         await _storage.saveItemAt<AddressBookUser>(
//           StoreKeys.AddressBookUser.name,
//           state.selectedUser!.id!,
//           newUser,
//         );

//         emit(state.copyWith(selectedUser: newUser));
//       } else {
//         var newUser = AddressBookUser(
//           name: state.editUserName,
//         );
//         final id = await _storage.saveItem<AddressBookUser>(
//           StoreKeys.AddressBookUser.name,
//           newUser,
//         );

//         newUser = newUser.copyWith(id: id);

//         await _storage.saveItemAt<AddressBookUser>(
//           StoreKeys.AddressBookUser.name,
//           id,
//           newUser,
//         );

//         emit(state.copyWith(selectedUser: newUser));
//       }

//       loadAddressUsers();
//       cancelUserEdit();
//     } catch (e, s) {
//       _logger.logException(e, 'AddressBookCubit.saveUserClicked', s);
//       emit(state.copyWith(errEditUserName: e.toString()));
//     }
//   }

//   void deleteUserClicked() {
//     try {
//       // final idx = state.users.indexOf(state.selectedUser!);
//       _storage.deleteItemAt<AddressBookUser>(
//         StoreKeys.AddressBookUser.name,
//         state.selectedUser!.id!,
//       );

//       loadAddressUsers();
//       cancelUserEdit();
//       clearSelectedUser();
//     } catch (e, s) {
//       _logger.logException(e, 'AddressBookCubit.deleteUserClicked', s);
//       emit(state.copyWith());
//     }
//   }

//   void saveKeyClicked() {
//     try {
//       final newKey = AddressBookKey(
//         name: state.editKeyName,
//         publicKey: state.editPublicKey,
//         path: state.editPath,
//         fingerprint: state.editFingerPrint,
//         rescueDate: state.editRescueDate == '' ? null : state.editRescueDate,
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//       );
//       if (state.selectedUser!.keys != null) {
//         final keys = state.selectedUser!.keys!.toList();
//         keys.add(newKey);
//         keys.remove(state.selectedKey);

//         final idx = state.selectedUser!.id!;

//         final newUser = AddressBookUser(
//           name: state.selectedUser!.name,
//           keys: keys,
//           id: idx,
//         );

//         _storage.saveItemAt<AddressBookUser>(
//           StoreKeys.AddressBookUser.name,
//           idx,
//           newUser,
//         );

//         emit(
//           state.copyWith(
//             selectedUser: newUser,
//             selectedKey: newKey,
//           ),
//         );
//       } else {
//         final idx = state.selectedUser!.id!;

//         final newUser = AddressBookUser(
//           name: state.selectedUser!.name,
//           keys: [newKey],
//           id: idx,
//         );

//         _storage.saveItemAt<AddressBookUser>(
//           StoreKeys.AddressBookUser.name,
//           idx,
//           newUser,
//         );
//         emit(
//           state.copyWith(
//             selectedUser: newUser,
//             selectedKey: newKey,
//           ),
//         );
//       }

//       loadAddressUsers();
//       cancelKeyEdit();
//     } catch (e, s) {
//       _logger.logException(e, 'AddressBookCubit.saveKeyClicked', s);
//       emit(state.copyWith());
//     }
//   }

//   void deleteKeyClicked() {
//     try {
//       final keys = state.selectedUser!.keys!.toList();
//       keys.remove(state.selectedKey);

//       final idx = state.selectedUser!.id!;

//       final newUser = AddressBookUser(
//         name: state.selectedUser!.name,
//         keys: keys,
//         id: idx,
//       );

//       _storage.saveItemAt<AddressBookUser>(
//         StoreKeys.AddressBookUser.name,
//         idx,
//         newUser,
//       );

//       emit(state.copyWith(selectedUser: newUser));

//       loadAddressUsers();
//       clearSelectedKey();
//     } catch (e, s) {
//       _logger.logException(e, 'AddressBookCubit.deleteKeyClicked', s);
//       emit(state.copyWith());
//     }
//   }

//   void deleteAll() async {
//     await _storage.clearAll<AddressBookUser>(
//       StoreKeys.AddressBookUser.name,
//     );
//   }

//   void exportAddressBook() async {
//     final addressBook = _storage.getAll<AddressBookUser>(StoreKeys.AddressBookUser.name);
//     if (addressBook.isEmpty) {
//       showToast('Address Book is empty.');
//       return;
//     }
//     String jsonStr = '{"address_book":[';
//     for (final user in addressBook) jsonStr += jsonEncode(user.toJson()) + ',';
//     jsonStr = jsonStr.substring(0, jsonStr.length - 1);
//     jsonStr += ']}';
//     final bin = Uint8List.fromList(jsonStr.codeUnits);
//     final date = DateTime.now().millisecondsSinceEpoch.toString();
//     await FileSaver.instance.saveAs('backup-$date.sm9', bin, '', MimeType.OTHER);
//     showToast('Backup Saved.');
//   }

//   void importAddressBook() async {
//     final result = await FilePicker.platform.pickFiles();
//     if (result == null || !result.files.first.extension!.contains('sm9')) {
//       showToast('Invalid Backup File.');
//       return;
//     }
//     final file = File(result.files.first.path!);
//     final bin = await file.readAsBytes();
//     // if (bin == null) return;
//     final jsonBin = List<int>.from(bin);
//     String jsonStr = '';
//     for (final binary in jsonBin) jsonStr += String.fromCharCode(binary);
//     final json = jsonDecode(jsonStr);
//     final List<AddressBookUser> users = [];
//     for (final user in json['address_book'])
//       users.add(AddressBookUser.fromJson(user as Map<String, dynamic>));
//     final newUsers = [...state.users.toList()];
//     for (final user in users) {
//       var newUser = user.copyWith(id: null);
//       final id = await _storage.saveItem<AddressBookUser>(
//         StoreKeys.AddressBookUser.name,
//         newUser,
//       );
//       newUser = newUser.copyWith(id: id);
//       await _storage.saveItemAt<AddressBookUser>(
//         StoreKeys.AddressBookUser.name,
//         id,
//         newUser,
//       );
//       newUsers.add(newUser);
//     }
//     emit(state.copyWith(users: newUsers));
//   }
// }
