#import <React/RCTViewManager.h>
#import <GoogleCast/GoogleCast.h>

@interface RNTCastButtonManager : RCTViewManager<GCKSessionManagerListener, GCKRequestDelegate>
    @property double playPosition;
    @property BOOL autoPlay;
    @property GCKMediaInformation *mediaInformation;
@end
