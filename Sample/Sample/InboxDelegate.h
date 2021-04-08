/* Copyright 2018 Urban Airship and Contributors */

@import Foundation;
@import AirshipKit;

@interface InboxDelegate : NSObject <UAInboxDelegate>

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController;

@end
