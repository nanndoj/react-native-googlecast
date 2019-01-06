#import "RNTCastButtonManager.h"

@implementation RNTCastButtonManager

// Export a module named RNGooglecast
RCT_EXPORT_MODULE()
RCT_EXPORT_VIEW_PROPERTY(tintColor, UIColor);

- (UIView *)view
{
    return [[GCKUICastButton alloc] init];
}

@end
