//
//  Social.m
//
//  Cameron Lerch
//  Sponsored by Brightflock: http://brightflock.com
//
// Enhanced by Victor Tsaran: http://www.victortsaran.net

#import <Social/SLComposeViewController.h>
#import <Social/SLServiceTypes.h>
#import "Social.h"

@interface Social ()

@end

@implementation Social

- (void)available:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    BOOL avail = false;
    
    if (NSClassFromString(@"UIActivityViewController")) {
        avail = true;
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:avail];
    [self writeJavascript:[pluginResult toSuccessCallbackString:[arguments objectAtIndex:0]]];
}

- (void)share:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    
    if (!NSClassFromString(@"UIActivityViewController")) {
        return;
    }
    
    NSString *text = [arguments objectAtIndex:1];
    
    NSString *imageName = [arguments objectAtIndex:2];
    UIImage *image = nil;
    
    if (imageName) {
        image = [UIImage imageNamed:imageName];
    }
    
    NSString *urlString = [arguments objectAtIndex:3];
    NSURL *url = nil;
    
    if (urlString) {
        url = [NSURL URLWithString:urlString];
    }
    
    NSArray *activityItems = [[NSArray alloc] initWithObjects:text, image, url, nil];
    
    UIActivity *activity = [[UIActivity alloc] init];
    
    NSArray *applicationActivities = [[NSArray alloc] initWithObjects:activity, nil];
    UIActivityViewController *activityVC =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                      applicationActivities:applicationActivities];
		activityVC.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeSaveToCameraRoll];

    [self.viewController presentViewController:activityVC animated:YES completion:nil];
}

- (void)shareA:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
		if (!NSClassFromString(@"SLComposeViewController")) {
				return;
		}

		NSString *serviceType = [arguments objectAtIndex:1];
		NSString *text = [arguments objectAtIndex:2];

		NSString *imageName = [arguments objectAtIndex:3];
		UIImage *image = nil;

		if (imageName) {
				image = [UIImage imageNamed:imageName];
		}

		NSString *urlString = [arguments objectAtIndex:4];
		NSURL *url = nil;

		if (urlString) {
				url = [NSURL URLWithString:urlString];
		}

		if ([serviceType isEqual: @"Twitter"])
				serviceType = SLServiceTypeTwitter;
else if ([serviceType isEqual: @"Facebook"])
		serviceType = SLServiceTypeFacebook;
else if ([serviceType isEqual: @"SinaWeibo"])
		serviceType = SLServiceTypeSinaWeibo;
		else
				return;

		if([SLComposeViewController isAvailableForServiceType:serviceType]) {
				SLComposeViewController*serviceViewController = [SLComposeViewController
																																			composeViewControllerForServiceType:serviceType];
				[serviceViewController setInitialText:text];
				[serviceViewController addImage:image];
				[serviceViewController addURL:url];
				[self.viewController presentViewController:serviceViewController animated:YES completion:nil];
		}
}

@end
