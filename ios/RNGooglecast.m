#import "RNGooglecast.h"
#import "RNTMiniMediaControlsViewController.h"
#import <React/RCTConvert.h>

@implementation RNGooglecast

// Export a module named RNGooglecast
RCT_EXPORT_MODULE()

// Run all the code from this module in the main thread
- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(init: (NSDictionary *)config) {
    
    NSString *appId = [RCTConvert NSString:config[@"appId"]];
    BOOL enableLog = [RCTConvert BOOL:config[@"enableLog"]];
    BOOL useDefaultExpandedMediaControls = [RCTConvert BOOL:config[@"useDefaultExpandedMediaControls"]];
    
    GCKDiscoveryCriteria *criteria = [[GCKDiscoveryCriteria alloc] initWithApplicationID:appId];
    
    GCKCastOptions *options = [[GCKCastOptions alloc] initWithDiscoveryCriteria:criteria];
    [GCKCastContext setSharedInstanceWithOptions:options];
    [GCKCastContext sharedInstance].useDefaultExpandedMediaControls = useDefaultExpandedMediaControls;
    
    if(enableLog) {
        GCKLoggerLevel loggerLevel = [RCTConvert NSInteger:config[@"loggerLevel"]];
        // Enable logger.
        [GCKLogger sharedInstance].delegate = self;
        GCKLoggerFilter *filter = [[GCKLoggerFilter alloc] init];
        [filter setMinimumLevel:loggerLevel];
        [GCKLogger sharedInstance].filter = filter;
    }
}


RCT_EXPORT_METHOD(clearCastInstructionsShownFlag) {
    [[GCKCastContext sharedInstance] clearCastInstructionsShownFlag];
}


RCT_EXPORT_METHOD(presentDefaultExpandedMediaControls) {
    [[GCKCastContext sharedInstance] presentDefaultExpandedMediaControls];
}


#pragma mark - GCKLoggerDelegate

- (void)logMessage:(NSString *)message
           atLevel:(GCKLoggerLevel)level
      fromFunction:(NSString *)function
          location:(NSString *)location {
        NSLog(@"%@ - %@, %@", function, message, location);
}

@end
  
