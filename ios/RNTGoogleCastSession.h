//
//  RNGoogleCastSession.h
//  RNGooglecast
//
//  Created by Fernando Santos on 2019-01-06.
//  Copyright © 2019 Facebook. All rights reserved.
//

#ifndef RNGoogleCastSession_h
#define RNGoogleCastSession_h


#endif /* RNGoogleCastSession_h */

#pragma mark - GCKSessionManagerListener events

-(void)sessionManager:(GCKSessionManager *)sessionManager willStartCastSession:(GCKCastSession *)session {
    [self sendEventWithName:SESSION_STARTING body:@{}];
}

-(void)sessionManager:(GCKSessionManager *)sessionManager didStartCastSession:(GCKCastSession *)session {
    castSession = session;
    [session.remoteMediaClient addListener:self];
    [self sendEventWithName:SESSION_STARTED body:@{}];
}

-(void)sessionManager:(GCKSessionManager *)sessionManager didFailToStartCastSession:(GCKCastSession *)session withError:(NSError *)error {
    [self sendEventWithName:SESSION_START_FAILED
                       body:@{@"error":[error localizedDescription]}];
}

-(void)sessionManager:(GCKSessionManager *)sessionManager didSuspendCastSession:(GCKCastSession *)session withReason:(GCKConnectionSuspendReason)reason {
    castSession = nil;
    [session.remoteMediaClient removeListener:self];
    [self sendEventWithName:SESSION_SUSPENDED body:@{}];
}

-(void)sessionManager:(GCKSessionManager *)sessionManager willResumeCastSession:(GCKCastSession *)session {
    [self sendEventWithName:SESSION_RESUMING body:@{}];
}

-(void)sessionManager:(GCKSessionManager *)sessionManager didResumeCastSession:(GCKCastSession *)session {
    castSession = session;
    [session.remoteMediaClient addListener:self];
    [self sendEventWithName:SESSION_RESUMED body:@{}];
}

-(void)sessionManager:(GCKSessionManager *)sessionManager willEndCastSession:(GCKCastSession *)session {
    castSession = nil;
    [session.remoteMediaClient removeListener:self];
    [self sendEventWithName:SESSION_ENDING body:@{}];
}

-(void)sessionManager:(GCKSessionManager *)sessionManager didEndCastSession:(GCKCastSession *)session withError:(NSError *)error {
    NSMutableDictionary *body = [[NSMutableDictionary alloc] init];
    if (error) {
        body[@"error"] = [error localizedDescription];
    }
    [self sendEventWithName:SESSION_ENDED body:body];
}
