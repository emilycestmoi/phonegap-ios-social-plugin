//
//  Social.h
//
//  Cameron Lerch
//  Sponsored by Brightflock: http://brightflock.com
//
// Enhanced by Victor Tsaran: http://www.victortsaran.net

#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVPluginResult.h>

@interface Social : CDVPlugin {
}

- (void)available:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

- (void)share:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

- (void)shareA:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end
