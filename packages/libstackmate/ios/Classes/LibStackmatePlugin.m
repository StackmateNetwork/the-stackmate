#import "LibStackmatePlugin.h"
#if __has_include(<libstackmate/libstackmate-Swift.h>)
#import <libstackmate/libstackmate-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "libstackmate-Swift.h"
#endif

@implementation LibStackmatePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLibStackmatePlugin registerWithRegistrar:registrar];
}
@end
