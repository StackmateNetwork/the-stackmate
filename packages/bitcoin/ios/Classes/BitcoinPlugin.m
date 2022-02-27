#import "BitcoinPlugin.h"
#if __has_include(<bitcoin/bitcoin-Swift.h>)
#import <bitcoin/bitcoin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bitcoin-Swift.h"
#endif

@implementation BitcoinPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBitcoinPlugin registerWithRegistrar:registrar];
}
@end
