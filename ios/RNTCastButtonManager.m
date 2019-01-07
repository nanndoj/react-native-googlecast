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
    
    if(!showMessage) return;
    
    //view GCKUICastButton view
    [[GCKCastContext sharedInstance] presentCastInstructionsViewControllerOnceWithCastButton:view];

}

// Custom properties
RCT_CUSTOM_VIEW_PROPERTY(media, NSDictionary, GCKUICastButton) {
    // json = propertyValue
    NSDictionary *media = json ? [RCTConvert NSDictionary:json] : nil;
    
    if(!media) return;
    
    NSString *title = [RCTConvert NSString:media[@"title"]];
    NSString *subtitle = [RCTConvert NSString:media[@"subtitle"]];
    NSString *imageUrl = [RCTConvert NSString:media[@"imageUrl"]];
    NSString *mediaUrl = [RCTConvert NSString:media[@"url"]];
    NSString *contentType = [RCTConvert NSString:media[@"contentType"]];
    double streamDuration = [RCTConvert double:media[@"streamDuration"]];
    double playPosition = [RCTConvert double:media[@"playPosition"]];
    
    GCKMediaMetadata *metadata = [[GCKMediaMetadata alloc] initWithMetadataType:GCKMediaMetadataTypeMovie];
    
    if(title) {
        [metadata setString:title forKey:kGCKMetadataKeyTitle];
    }
    
    if(subtitle) {
        [metadata setString:subtitle forKey:kGCKMetadataKeySubtitle];
    }

    if(imageUrl) {
        [metadata addImage:[[GCKImage alloc]
                        initWithURL:[[NSURL alloc] initWithString:imageUrl]
                        width:480
                        height:360]];
    }
    
    streamDuration = !streamDuration ? INFINITY : streamDuration;
    
    self.autoPlay = [RCTConvert BOOL:media[@"autoPlay"]];
    self.playPosition = !playPosition ? 0 : playPosition;
    self.mediaInformation = [[GCKMediaInformation alloc] initWithContentID:mediaUrl
                                        streamType:GCKMediaStreamTypeBuffered
                                        contentType:contentType
                                        metadata:metadata
                                        streamDuration:streamDuration
                                        mediaTracks:nil
                                        textTrackStyle:nil
                                        customData:nil];
    
}

#pragma mark - GCKSessionManagerListener events
-(void)sessionManager:(GCKSessionManager *)sessionManager didStartCastSession:(GCKCastSession *)session {
    [session.remoteMediaClient loadMedia:self.mediaInformation
                                autoplay:self.autoPlay
                                playPosition:self.playPosition];
}

- (UIView *)view {
    [GCKCastContext.sharedInstance.sessionManager addListener:self];
    return [[GCKUICastButton alloc] init];
}

@end
