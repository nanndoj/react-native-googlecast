#import <React/RCTBridgeModule.h>
#import <GoogleCast/GoogleCast.h>

@interface RNTGoogleCastSession : NSObject <RCTBridgeModule, GCKCastDeviceStatusListener, GCKSessionManagerListener, GCKRemoteMediaClientListener>

@end

