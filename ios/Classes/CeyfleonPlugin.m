#import "CeyfleonPlugin.h"
#if __has_include(<ceyfleon/ceyfleon-Swift.h>)
#import <ceyfleon/ceyfleon-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ceyfleon-Swift.h"
#endif

@implementation CeyfleonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCeyfleonPlugin registerWithRegistrar:registrar];
}
@end
