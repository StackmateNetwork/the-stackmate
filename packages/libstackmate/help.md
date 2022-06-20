# Libstackmate FFI Format

The files under lib follow the simple format of functions

```
input -> functions -> output
```

C-FFI functions at their core, deal with a purely string interface.

This means that all inputs are strings and the resulting outputs are also strings; specifically C Strings (Pointer<Utf8> in dart).

The lib does the job of creating a purely native dart compatible wrapper around a C-FFI which does the job of

- converting all dart native input types to C strings (inputs.dart)

- defining the ffi (libstackmate.dart)

- convert all outputs we get back from the ffi into to native dart types (outputs.dart)

NOTE ON NAMING CONVENTIONS: for function and variable names `rust uses snake_case` while `dart uses camelCase`.

Both use PascalCase for type definitions.

So,

MAKE SURE ALL CORE FFI NAMES ARE IN SNAKE CASE.

eg.

```
Function Name (in libstackmate.dart)
  estimate_network_fee

Function Inputs (in inputs.dart)
  (
    Pointer<Utf8> network,
    Pointer<Utf8> node_address,
    Pointer<Utf8> socks5,
    Pointer<Utf8> conf_target,
  )

Function Outputs (in outouts.dart)
  return UTXO(
    json['txid'] as String,
    json['vout'] as int,
    json['value'] as int,
    json['script_pubkey'] as String,
    json['keychain_kind'] as String,
  );

```

Also make sure to follow the api.md specification file from the latest stackmate release.

This will give you exactly the name of the inputs and function name to use
AND
give you the structure of the output string which can be serialized into JSON/Dart native structure.

We define each function exposed by the C library API with the following command: (in libstackmate.dart)

`binary.lookupFunction<EstimateFeeT, EstimateFeeT>('estimate_network_fee')`

Where EstimateFeeT is the input type defined in `inputs.dart`
And `estimate_network_fee` is the name of the C lib function.

libstackmate.dart outputs Strings which the dart application must explicitly convert into more structured types.

These structured output types are defined in outputs.dart.

libstackmate returns a stringified JSON of either a result or a strucutured error.
