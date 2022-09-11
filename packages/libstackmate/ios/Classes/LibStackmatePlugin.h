#import <Flutter/Flutter.h>

@interface LibStackmatePlugin : NSObject<FlutterPlugin>
@end


char *generate_master(
    const char *network, 
    const char *length, 
    const char *passphrase);

char *import_master(
    const char *network, 
    const char *mnemonic, 
    const char *passphrase);

char *derive_hardened(
    const char *master_xprv, 
    const char *purpose, 
    const char *account);

char *compile(
    const char *policy, 
    const char *script_type);

char *sync_balance(
    const char *deposit_desc, 
    const char *node_address);

char *sync_history(
    const char *deposit_desc, 
    const char *node_address);

char *get_address(
    const char *deposit_desc, 
    const char *node_address, 
    const char *index);

char *estimate_network_fee(
    const char *network, 
    const char *node_address, 
    const char *conf_target);

char *fee_absolute_to_rate(
    const char *fee_absolute, 
    const char *weight);

char *fee_rate_to_absolute(
    const char *fee_rate, 
    const char *weight);


char *build_tx(
    const char *deposit_desc,
    const char *node_address,
    const char *to_address,
    const char *amount,
    const char *fee_absolute);

char *sign_tx(
    const char *deposit_desc, 
    const char *node_address, 
    const char *unsigned_psbt);

char *broadcast_tx(
    const char *deposit_desc, 
    const char *node_address, 
    const char *signed_psbt);

char *get_height(
    const char *network, 
    const char *node_address);

char *get_weight(
    const char *deposit_desc, 
    const char *psbt);

char *days_to_blocks(const char *days);

char *cstring_free(const char *ptr);
