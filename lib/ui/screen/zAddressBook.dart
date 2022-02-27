import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/address-book.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/Common/BackButton.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = context.select(
      (AddressBookCubit abc) => abc.state.users,
    );

    return FadeIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          Text(
            ' Your Network',
            style: context.fonts.headline4!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  context.read<AddressBookCubit>().importAddressBook();
                },
                child: Text('Restore'.toUpperCase()),
              ),
              TextButton(
                onPressed: () {
                  context.read<AddressBookCubit>().exportAddressBook();
                },
                child: Text('Backup'.toUpperCase()),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  context.read<AddressBookCubit>().editUserSelected();
                },
                child: Text('Add User'.toUpperCase()),
              ),
            ],
          ),
          const SizedBox(height: 40),
          if (users.isEmpty) ...[
            Text(
              ' No Contacts',
              style: context.fonts.headline6!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
          ] else
            for (final user in users) ...[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.colours.surface),
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {
                  context.read<AddressBookCubit>().userSelected(user);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                  child: Text(
                    user.name,
                    textAlign: TextAlign.left,
                    style: context.fonts.button!.copyWith(
                      color: context.colours.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ]
        ],
      ),
    );
  }
}

class KeyList extends StatelessWidget {
  const KeyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select(
      (AddressBookCubit abc) => abc.state.selectedUser,
    );

    if (user == null) return Container();

    return FadeIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          Text(
            '  USER',
            style: context.fonts.overline!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          Text(
            '  ' + user.name,
            style: context.fonts.headline6!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  context.read<AddressBookCubit>().editUserSelected();
                },
                child: const Text('EDIT'),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () {
                  context.read<AddressBookCubit>().deleteUserClicked();
                },
                child: Text(
                  'DELETE',
                  style: context.fonts.button!.copyWith(
                    color: context.colours.error.withOpacity(0.5),
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  context.read<AddressBookCubit>().editKeySelected();
                },
                child: const Text('NEW ACCOUNT'),
              ),
            ],
          ),
          const SizedBox(height: 40),
          if (user.keys == null || user.keys!.isEmpty) ...[
            Text(
              '   No Accounts for ${user.name} added',
              style: context.fonts.caption!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
          ] else
            for (final key in user.keys!) ...[
              ElevatedButton(
                onPressed: () {
                  context.read<AddressBookCubit>().keySelected(key);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.colours.surface),
                  alignment: Alignment.centerLeft,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                  child: Text(
                    key.name,
                    style: context.fonts.button!.copyWith(
                      color: context.colours.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class KeyProfile extends StatelessWidget {
  const KeyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = context.select(
      (AddressBookCubit abc) => abc.state.selectedKey,
    );

    if (key == null) return Container();

    return FadeIn(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text(
            'ACCOUNT',
            style: context.fonts.overline!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          Text(
            '' + key.name,
            style: context.fonts.headline6!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  context.read<AddressBookCubit>().editKeySelected();
                },
                child: const Text('EDIT'),
              ),
              const SizedBox(width: 24),
              TextButton(
                onPressed: () {
                  context.read<AddressBookCubit>().deleteKeyClicked();
                },
                child: Text(
                  'DELETE',
                  style: context.fonts.button!.copyWith(
                    color: context.colours.error.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Text(
            'PUBLIC KEY',
            style: context.fonts.overline!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            key.publicKey,
            style: context.fonts.bodyText1!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              context.read<AddressBookCubit>().copyKey(key.publicKey);
            },
            child: const Text('COPY'),
          ),
          const SizedBox(height: 80),
          Text(
            'FINGERPRINT',
            style: context.fonts.overline!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            key.fingerprint,
            style: context.fonts.bodyText1!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              context.read<AddressBookCubit>().copyKey(key.fingerprint);
            },
            child: const Text('COPY'),
          ),
          const SizedBox(height: 80),
          Text(
            'PATH',
            style: context.fonts.overline!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            key.path,
            style: context.fonts.bodyText1!.copyWith(
              color: context.colours.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              context.read<AddressBookCubit>().copyKey(key.path);
            },
            child: const Text('COPY'),
          ),
          if (key.rescueDate != null) ...[
            const SizedBox(height: 80),
            Text(
              'RESCUE DATE - (BLOCKHEIGHT)',
              style: context.fonts.overline!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              key.rescueDate!,
              style: context.fonts.bodyText1!.copyWith(
                color: context.colours.onBackground,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                context.read<AddressBookCubit>().copyKey(key.rescueDate!);
              },
              child: const Text('COPY'),
            ),
            const SizedBox(height: 80),
          ],
        ],
      ),
    );
  }
}

class EditUser extends StatelessWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 80),
          const UserNameField(),
          const SizedBox(height: 40),
          TextButton(
            onPressed: () {
              context.read<AddressBookCubit>().saveUserClicked();
            },
            child: const Text('SAVE'),
          ),
          const SizedBox(height: 40),
          TextButton(
            onPressed: () {
              context.read<AddressBookCubit>().cancelUserEdit();
            },
            child: const Text('CANCEL'),
          ),
        ],
      ),
    );
  }
}

class EditKey extends StatelessWidget {
  const EditKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 80),
          const KeyNameField(),
          const SizedBox(height: 40),
          const KeyValueField(),
          const SizedBox(height: 100),
          TextButton(
            onPressed: () {
              context.read<AddressBookCubit>().saveKeyClicked();
            },
            child: const Text('SAVE'),
          ),
          const SizedBox(height: 40),
          TextButton(
            onPressed: () {
              context.read<AddressBookCubit>().cancelKeyEdit();
            },
            child: const Text('CANCEL'),
          ),
        ],
      ),
    );
  }
}

class UserNameField extends StatefulWidget {
  const UserNameField({Key? key}) : super(key: key);

  @override
  _UserNameFieldState createState() => _UserNameFieldState();
}

class _UserNameFieldState extends State<UserNameField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username =
        context.select((AddressBookCubit abc) => abc.state.editUserName);
    final errUsername =
        context.select((AddressBookCubit sc) => sc.state.errEditUserName);

    if (username != _controller.text) _controller.text = username;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _controller,
          style: TextStyle(color: context.colours.onBackground),
          decoration: InputDecoration(
            hintText: 'Enter Name'.toUpperCase(),
            errorText: errUsername.nullIfEmpty(),
          ),
          onChanged: (t) {
            context.read<AddressBookCubit>().userNameChanged(t);
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class KeyNameField extends StatefulWidget {
  const KeyNameField({Key? key}) : super(key: key);

  @override
  State<KeyNameField> createState() => _KeyNameFieldState();
}

class _KeyNameFieldState extends State<KeyNameField> {
  late TextEditingController _namecontroller;

  @override
  void initState() {
    _namecontroller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final keyname =
        context.select((AddressBookCubit abc) => abc.state.editKeyName);
    final errKeyName =
        context.select((AddressBookCubit sc) => sc.state.errKeyName);

    if (keyname != _namecontroller.text) _namecontroller.text = keyname;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _namecontroller,
          style: TextStyle(color: context.colours.onBackground),
          decoration: InputDecoration(
            hintText: 'Enter Account Name'.toUpperCase(),
            errorText: errKeyName.nullIfEmpty(),
          ),
          onChanged: (t) {
            context.read<AddressBookCubit>().keyNameChanged(t);
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class KeyValueField extends StatefulWidget {
  const KeyValueField({Key? key}) : super(key: key);

  @override
  State<KeyValueField> createState() => _KeyValueFieldState();
}

class _KeyValueFieldState extends State<KeyValueField> {
  late TextEditingController _pubkeycontroller;
  late TextEditingController _fingerprintcontroller;
  late TextEditingController _pathcontroller;
  late TextEditingController _rescueDatecontroller;

  @override
  void initState() {
    _pubkeycontroller = TextEditingController();
    _fingerprintcontroller = TextEditingController();
    _pathcontroller = TextEditingController();
    _rescueDatecontroller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((AddressBookCubit abc) => abc.state);

    if (state.editPublicKey != _pubkeycontroller.text)
      _pubkeycontroller.text = state.editPublicKey;
    if (state.editPath != _pathcontroller.text)
      _pathcontroller.text = state.editPath;
    if (state.editFingerPrint != _fingerprintcontroller.text)
      _fingerprintcontroller.text = state.editFingerPrint;
    if (state.editRescueDate != _rescueDatecontroller.text)
      _rescueDatecontroller.text = state.editRescueDate;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _pubkeycontroller,
          style: TextStyle(color: context.colours.onBackground),
          decoration: InputDecoration(
            hintText: 'Enter Public Key'.toUpperCase(),
            errorText: state.errEditPublicKey.nullIfEmpty(),
          ),
          onChanged: (t) {
            context.read<AddressBookCubit>().publicKeyChanged(t);
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            TextButton(
              onPressed: () {
                context.read<AddressBookCubit>().pasteKey();
              },
              child: const Text('PASTE'),
            ),
          ],
        ),
        const SizedBox(height: 32),
        //
        //
        TextField(
          controller: _fingerprintcontroller,
          style: TextStyle(color: context.colours.onBackground),
          decoration: InputDecoration(
            hintText: 'Enter Fingerprint'.toUpperCase(),
            errorText: state.errFingerPrint.nullIfEmpty(),
          ),
          onChanged: (t) {
            context.read<AddressBookCubit>().fingerprintChanged(t);
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            TextButton(
              onPressed: () {
                context.read<AddressBookCubit>().pasteFingerprint();
              },
              child: const Text('PASTE'),
            ),
          ],
        ),
        const SizedBox(height: 32),
        //
        //
        TextField(
          controller: _pathcontroller,
          style: TextStyle(color: context.colours.onBackground),
          decoration: InputDecoration(
            hintText: 'Enter Path'.toUpperCase(),
            errorText: state.errEditPublicKey.nullIfEmpty(),
          ),
          onChanged: (t) {
            context.read<AddressBookCubit>().pathChanged(t);
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            TextButton(
              onPressed: () {
                context.read<AddressBookCubit>().pastePath();
              },
              child: const Text('PASTE'),
            ),
          ],
        ),
        const SizedBox(height: 32),
        //
        //
        TextField(
          controller: _rescueDatecontroller,
          style: TextStyle(color: context.colours.onBackground),
          decoration: InputDecoration(
            hintText: 'Enter Rescue Date - (Height)'.toUpperCase(),
            errorText: state.errEditRescueDate.nullIfEmpty(),
          ),
          onChanged: (t) {
            context.read<AddressBookCubit>().rescueDateChanged(t);
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            TextButton(
              onPressed: () {
                context.read<AddressBookCubit>().pasteRescueDate();
              },
              child: const Text('PASTE'),
            ),
          ],
        ),
        const SizedBox(height: 32),
        //
        //
      ],
    );
  }
}

class AddressBookScreen extends StatelessWidget {
  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final canGoBack = context.select(
      (AddressBookCubit abc) => abc.state.canGoBack(),
    );

    return WillPopScope(
      onWillPop: () async {
        if (!canGoBack) {
          context.read<AddressBookCubit>().onBackPress();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<AddressBookCubit, AddressBookState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Back(
                        onPressed: () {
                          if (!canGoBack) {
                            context.read<AddressBookCubit>().onBackPress();
                          } else
                            Navigator.pop(context);
                        },
                      ),
                      if (state.editKeyDetails) ...[
                        const EditKey(),
                      ] else if (state.selectedKey != null) ...[
                        const KeyProfile(),
                      ] else if (state.editUserDetails) ...[
                        const EditUser(),
                      ] else if (state.selectedUser != null) ...[
                        const KeyList(),
                      ] else if (state.selectedUser == null) ...[
                        const UserList()
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
