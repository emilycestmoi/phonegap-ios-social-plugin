//
//  Social.m
//
//  Cameron Lerch
//  Sponsored by Brightflock: http://brightflock.com
//

#import "Social.h"

@interface Social ()

@end

@implementation Social

- (void)available:(CDVInvokedUrlCommand*)command {

    BOOL avail = false;

    NSArray *arguments = command.arguments;
    
    if (NSClassFromString(@"UIActivityViewController")) {
        avail = true;
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:avail];
    [self writeJavascript:[pluginResult toSuccessCallbackString:[arguments objectAtIndex:0]]];
}

- (void)share:(CDVInvokedUrlCommand*)command {
    
    if (!NSClassFromString(@"UIActivityViewController")) {
        return;
    }
    
    NSArray *arguments = command.arguments;
    
    NSString *text = [arguments objectAtIndex:0];
    
    NSString *imageName = [arguments objectAtIndex:1];
    UIImage *image = nil;
    
    if (imageName != (id)[NSNull null]) {
        image = [UIImage imageNamed:imageName];
    }


    NSString *urlString = [arguments objectAtIndex:2];
    NSURL *url = nil;

    if (urlString != (id)[NSNull null]) {
        url = [NSURL URLWithString:urlString];
    }
   
    NSArray *activityItems = [[NSArray alloc] initWithObjects:text, image, url, nil];
    
    UIActivity *activity = [[UIActivity alloc] init];
    
    NSArray *applicationActivities = [[NSArray alloc] initWithObjects:activity, nil];
    UIActivityViewController *activityVC =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                      applicationActivities:applicationActivities];
    
    [self.viewController presentViewController:activityVC animated:YES completion:nil];
}

@end
