#import "RNTCastButtonManager.h"

@implementation RNTCastButtonManager

// Export a module named RNGooglecast
RCT_EXPORT_MODULE()

// Default properties
RCT_EXPORT_VIEW_PROPERTY(tintColor, UIColor);

// Custom properties
RCT_CUSTOM_VIEW_PROPERTY(presentCastInstructionsOnce, BOOL, GCKUICastButton) {
    // json = propertyValue
    BOOL showMessage = json ? [RCTConvert BOOL:json] : NO;
    
    if(showMessage) {
        //view GCKUICastButton view
        [[GCKCastContext sharedInstance] presentCastInstructionsViewControllerOnceWithCastButton:view];
    }
}

- (UIView *)view {
    return [[GCKUICastButton alloc] init];
}

@end
