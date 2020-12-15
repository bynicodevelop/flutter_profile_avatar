#import "FlutterProfileAvatarPlugin.h"
#if __has_include(<flutter_profile_avatar/flutter_profile_avatar-Swift.h>)
#import <flutter_profile_avatar/flutter_profile_avatar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_profile_avatar-Swift.h"
#endif

@implementation FlutterProfileAvatarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterProfileAvatarPlugin registerWithRegistrar:registrar];
}
@end
