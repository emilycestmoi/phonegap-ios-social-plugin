//
//  Social.h
//
//  Cameron Lerch
//  Sponsored by Brightflock: http://brightflock.com
//

#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVPluginResult.h>

@interface Social : CDVPlugin {
}

-(void)available:(CDVInvokedUrlCommand*)command;

- (void)share:(CDVInvokedUrlCommand*)command;

@end
