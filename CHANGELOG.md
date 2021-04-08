iOS Changelog
=============

Migration Guides: Documentation/Migration

Version 9.4.0 - September 4, 2018
=================================
Minor release thats adds support for tag group audiences, miss behaviors and resizable HTML messages in
In-App Automation. HTML in-app messages are now displayed as dialogs by default, with an option
to display fullscreen on smaller devices. This release also fixes a bug that could result in crashes 
when serializing JSON payloads for certain audience conditions. Apps using In-App Automation are
encouraged to upgrade.

Changes
-------
- Added support for tag group audience conditions for in-app messages.
- Fixed a bug that could prevent modal in-app messages from being displayed as fullscreen.
- Fixed a JSON serialization bug which could cause crashes for certain audience conditions.

Version 9.3.3 - July 26, 2018
============================
Patch release to fix an issue with legacy in-app message attribution. Apps
using legacy in-app messages are encouraged to upgrade.

Version 9.3.2 - July 20, 2018
=============================
Patch release to fix a problem with `uairship:` schema links in our native bridge. Any applications using links in the Message Center, Landing Pages or any other uses of our native bridge are encouraged to upgrade.

Changes
-------
- Fix native bridge `uairship:` schema links.

Version 9.3.1 - July 12, 2018
=============================
Patch release to fix a problem with in-app automation limits. Any applications using in-app automation or action automation are encouraged to upgrade.

Changes
-------
- Changed UAAutomationEngine to compare unsigned integers instead of the pointers to the NSNumbers that contain them.
- Addressed causes of intermittent unit test failures in UAAutomation tests.

Version 9.3.0 - June 27, 2018
=============================

Minor release that adds support for:

- detection of quiet notifications vs. opted-out users,
- disabling 3D-touch in a message center message,
- rejecting whitelisted URLs before they are fetched.

This release also fixes an issue with incremental builds. 

Apps interested in the new features or experiencing the incremental build issue are encouraged to upgrade.

Changes
-------
- Separates notification options from notification settings. Options now represent what is requested and settings represent what was granted.
  - Note: In UAPush.m, a new  [`authorizedNotificationSettings`](https://docs.urbanairship.com/reference/libraries/ios/latest/Classes/UAPush.html#/c:objc(cs)UAPush(py)authorizedNotificationSettings) property has been added. It will always return the current authorized settings, even if push notifications are disabled through [`userPushNotificationsEnabled`](https://docs.urbanairship.com/reference/libraries/ios/latest/Classes/UAPush.html#/c:objc(cs)UAPush(py)userPushNotificationsEnabled). 
- Adds mechanism to allow apps to disable message center link previews and callouts.
- Adds mechanism to allow apps to reject whitelisted URLs before they are fetched.
- Changes header generation script to use Apple's recommended temp directory. This solves a problem certain developers were having with incremental builds.
- Migrates keychain security attribute to only allow access after first device unlock.

Version 9.2.1 - June 13, 2018
============================

Patch release to fix a bug with channel registration. Applications concerned with unnecessary channel registrations
are encouraged to upgrade.

Changes
-------
- Fixed a bug which was causing an unnecessary registration on every app foreground and background.
- Locale and Timezone info is now sent up with the channel registration even if analytics are disabled.

Version 9.2.0 - May 31, 2018
============================

Minor release that exposes new methods in In-App Automation and Message Center.

Changes
-------
- Added method to override Message Center loading indicator.
- Added method to allow for extending of In-App Automation messages.
- Added method to allow for pausing In-App Automation.

Version 9.1.0 - May 3, 2018
===========================

Minor release that updates the in-app message designs.

Changes
-------
- Updated in-app message designs.
- Added support to display an in-app modal message as fullscreen on smaller screen devices.
- Added support to adjust current in-app message designs through a plist.
- Added a new UALegacyInAppMessageBuilderExtender protocol to make customizing the
  legacy in-app message easier.
- Updated for Xcode 9.3.

Version 9.0.5 - April 2, 2018
=================================
Patch release to fix bugs in landing page presentation and content resizing on rotation. Applications using landing pages are encouraged to upgrade.

Bug fixes
---------
- Removed zoom from webpage after rotation to allow its web content to properly resize.
- Fixed top view selection when displaying landing page views.
- Fixed landing page constraints to accommodate safe area.
- Updated project structure to hide private interfaces.


Version 9.0.4 - March 19, 2018
=================================
Patch release to relax URL whitelisting to include custom schemes, fix a delegate call that was happening off the main queue, and fix UI issues in the message center and in in-app message banners. Applications needing any of these changes are encouraged to upgrade.

Bug fixes
---------
- Relaxed URL whitelisting to include custom schemes.
- Fixed issue in the message center list view that prevented icons from properly loading.
- Fixed spacing issue in in-app banner view layout.
- Fixed a bug that resulted in UAInboxDelegate being called off the main queue.

Version 9.0.3 - February 27, 2018
=================================
Patch release to fix several UI issues, reduce the amount of code executed when Analytics are disabled, and make UAActionScheduleInfo constructor public. Applications needing any of these changes are encouraged to upgrade.

Bug fixes
---------
- Made close button more accessible in overlay pages on iPhone X.
- Fixed potential issues with full-screen in-app message display in particular configurations and image sizes.

Version 9.0.2 - February 12, 2018
=================================

Patch release to fix a crash with the deep link and landing page actions. Applications running 9.0.0 and 9.0.1 should update to this release.

Bug fixes
---------
- Fix crash in the deep link and landing page action.
- Added overlay behind the in-app message dialog.
- Added missing checks for identifier lengths for both in-app messages and message buttons.

Version 9.0.1 - February 5, 2018
================================

Patch release to fix a CocoaPods iOS 9 deployment issue with the AirshipAppExtensions
and fixes a Main Thread Checker warning when adding analytic events from a background
thread.

Bug fixes
---------
- Fix CocoaPods iOS 9 deployment issue with the AirshipAppExtensions.
- Fix background thread warning when adding an event on a background thread.

Version 9.0.0 - February 2, 2018
================================

Major release required for new in-app messaging capabilities.

Changes
-------
- In-app messaging v2. The new in-app messaging module includes several different view types
that are fully configurable, including modal, banner, and fullscreen. An in-app message is able to
be triggered using the same rules as the Action automation module.
- Automation schedule priority: Used to determine the execution order of schedules if multiple
schedules are triggered by the same event.
- Support for editing automation schedules.
- New active session automation trigger. The trigger will increment its count if it has been scheduled
during an active session instead of waiting for the next foreground.
- New app version automation trigger. The trigger will increment its count if the app has been updated to
a specified version.
- Extended whitelist URL checking for URL loading instead of just JS bridge injection. By default these
checks are disabled, but you can enable them with the AirshipConfigOptions field enableUrlWhitelisting.
- A rate app action to prompt the user to rate the application.
- Updated localizations.
- Removed deprecated code. Please see [Migration Guide](Documentation/Migration/Migration%20Guide.md#urban-airship-library-8x-to-90).


Version 8.6.3 - November 20, 2017
==================================
Patch release to address "UI API called on a background thread" warnings. Applications should update to this release if they are seeing these warnings.

Bug fixes
---------
- Fix UI API access on background thread in Message Center.

Version 8.6.2 - October 30, 2017
==================================
Patch release to correctly parse "mailto:" URLs in message center messages and enable optional localization of Message Center's "Done" and "Edit" buttons. Applications should update to this release if they require this behavior.

Bug fixes
---------
- Correctly parse "mailto:" URLs in message center messages.

Version 8.6.1 - October 23, 2017
==================================
Patch release that fixes a registration delegate issue that prevents the authorized types from
being updated on foreground. Applications should update to this release if they require this behavior.

Bug fixes
---------
- Update authorized notification types on foreground.

Version 8.6.0 - September 13, 2017
==================================
Official release for iOS 11 & Xcode 9. Applications should update to this release if they want to support iOS 11 or build under Xcode 9. Applications using SDK 8.5.3 with Carthage should update to this release.

Bug fixes
---------
- Force execution of some UI code on the main queue.
- When executing a Display Inbox action, if the message ID is the empty string, just show the inbox.
- Turn off code coverage to work-around [this Carthage issue](https://github.com/Carthage/Carthage/issues/2056).

Features
--------
- Add support iOS 11 Hidden Notification Content to UANotificationCategory.

Version 8.5.3 - August 22, 2017
===============================
Patch release that fixes missing symbol issues for the static library and removes
the use of `dispatch_sync` when calling UIKit from a background thread. Applications
that use the static library or have had concerns about the use of `dispatch_sync`
should update.

Bug fixes
---------
- Fixed missing symbols for StoreKit and WebKit when using the static library.

Behavior Changes
----------------
- Removed use of `dispatch_sync` within the push module.

Version 8.5.2 - August 9, 2017
==============================
Patch release that fixes issues with message center, applications that use
protected data and background services, and issues with deep link and tag
actions running when a push is received in the foreground. Applications that
use any of those features should update to this release.

Bug fixes
---------
- Fixed Core Data crash when the application uses protected data and wakes up in the
  background before the device is unlocked.
- Fixed deep link and tag actions running when a push is received in the foreground due
  to the predicate not being applied (Regression from 8.4.0).
- Fixed message center not deep linking into the message view from a push notification.
- Fixed message center edit mode not exiting after performing an action.
- Fixed keys for rate app action's optional title and body arguments.

Version 8.5.1 - July 27, 2017
=============================

Patch release that fixes app submission problems when using Carthage or manual installation
methods. CocoaPods users are unaffected by this issue.

Bug fixes
---------
- Fixed submission problems due to the AirshipResources.bundle containing an executable.
- Fixed minor Xcode 9 beta warnings in the samples and the new rate app action.

Version 8.5.0 - July 26, 2017
============================

Feature release relevant for users that require the UARateAppAction or meet the following conditions:
- Implement the UAInAppMessageControllerDelegate and provide their own custom in-app message views.
- Use custom message center styling in a split view.

Bug Fixes
---------
- Fixed header generation for the static library.
- Fixed background permissions check when enabling channel capture.
- Fixed default in-app message animation for custom in-app messages.
- Fixed message center styling issue that prevented specified style
from being properly applied in a split view.

Features
--------
- Added UARateAppAction that can prompt a user with a rating dialog or link directly
to the App Store rating page.

Version 8.4.3 - July 21, 2017
=============================

Bug Fixes
---------
- Fixed marking message centers messages as read.
- Fixed inbox coredata warning.
- Fixed calling UI calls on background threads (Xcode 9 warnings).

Version 8.4.2 - July 18, 2017
=============================

Bug Fixes
---------
- Fixed deadlock with UAChannelRegistrar.
- Fixed channel capture being enabled when it has never explicitly been enabled.
- Fixed setting conversion send ID on non-alerting push notifications.
- Fixed potential crash in UAEventManager.
- Fixed potential crash in UAPush when sending an NSNotification when channel is created.
- Added better error handling in UAInboxDBManager.


Version 8.4.1 - July 11, 2017
============================

Bug Fixes
---------
- When a nil file path is passed to `UADefaultMessageCenterStyle styleWithContentsOfFile:`, return the default style without attempting to find and parse the style file.
- Fix blurry message center unread indicator on retina devices.
- Fix iOS warning by delaying the setting of preferredDisplayMode on message center's split view until after the split view has view controllers added to it.
- Stop updating the message center refresh control UI from a background thread.

Version 8.4.0 - July 3, 2017
============================

Bug Fixes
---------
- Fixed "invalid prototype declaration" warnings.
- Fixed calling UIKit on background threads.
- Fixed deprecation warnings when targeting iOS 10+.

Features
--------
- Added support for tvOS.
- Added loading indicator to Message Center message view controllers.
- Added new UAInboxDelegate protocol method `showMessageForID:` that will be called
  immediately after a notification is tapped that is associated with a Message Center message.
- Added support to update authorized notification options during a background app refresh.
- Added support to style the select all, delete, and mark read buttons in the message center.

Deprecations
------------
- Alias is now deprecated. It will be removed in SDK 10.0.0.
- UAInboxDelegate's `showInboxMessage:`, replaced with `showMessageForID:`.
- UADefaultMessageCenter's `displayMessage:` and `displayMessage:animated:`,
  replaced with `displayMessageForID:` and `displayMessageForID:animated:` methods.
- UADefaultMessageCenterListViewController's `displayMessage:` and `displayMessage:onError:`,
  replaced with `displayMessageForID:` and `displayMessageForID:onError:`.
- UAInAppMessage's unused property `notificationActionContext`.


Version 8.3.3 - May 22, 2017
============================

Bug Fixes
---------
- UARegistrationDelegate's notificationRegistrationFinishedWithOptions:categories:
  is now called with the user opted in options instead of the requested types. Fixed
  this method being called before the user has a chance to accept permissions on iOS 8 & 9.
- Fixed UARegistrationDelegate's notificationAuthorizedOptionsDidChange: being
  initially called with the wrong value and not being called when types go from undetermined
  to none.

Behavior Changes
----------------
- Authorized notification option will be checked when the application wakes up in
  the background.

Version 8.3.2 - May 15, 2017
===========================

Bug Fixes
---------
- Added files missing from static library libUAirship.a
- Fix compiler warnings

Version 8.3.1 - May 9, 2017
===========================

Bug Fixes
---------
- Fixed bug with decoding action values from the Urban Airship JS bridge.

Version 8.3.0 - May 2, 2017
===========================

New Features
------------
- Added support for WKWebView. Enable in AirshipConfig.plist using useWKWebView
  flag. Disabled by default.
- Deprecated support for UIWebView.
- Added support for delayed automation action schedules. The execution of an
  automated schedule can now be delayed by up to 30 seconds or made contingent
  on some condition.
- Added EnableFeatureAction that can enable background location, location, or user
  notifications.
- Added an automation trigger for app init events.
- Added new UARegistrationDelegate methods apnsRegistrationSucceededWithDeviceToken:
  and apnsRegistrationFailedWithError:.

Bug Fixes
---------
- Fixed compatibility issue with Firebase.
- Fixed duplicate analytic uploads on iOS 8.

Other
-----
- iOS migration guides moved to this repository.

Version 8.2.2 - April 4, 2017
==============================

Bug Fixes
----------
- Correctly handle local project paths that contain spaces.

Version 8.2.1 - March 30, 2017
==============================

Bug Fixes
----------
- Added missing file references to static library.
- Added extra validation to message list response body.

Version 8.2.0 - February 16, 2017
=================================

New Features
------------
- Added UATextInputNotificationAction to support text input notification actions.
- Added accessor to get the app key in the Javascript native bridge.
- Message center will automatically refresh the message listing in the background
  when receiving a content-available push.

Bug Fixes
---------
- Fixed in-app messaging not being cleared from a notification action button.
- Fixed in-app messaging not being cleared at all if displayASAP is enabled.
- Fixed inbox database file name to be stored under the app key.
- Fixed schedule action not being able to parse variations of an ISO 8601 timestamp.
- Improved Message Center cell text animations when entering "Edit" mode.

Behavior Changes
----------------
- Channel Capture tool is now disabled by default if the app is able
  to receive background push. A new action has been added to enable the
  tool for a limited duration.

Version 8.1.6 - January 26, 2017
================================
- Fixed an analytics bug for cold start direct opens.

Version 8.1.5 - January 25, 2017
================================
- Fixed a message selection bug in edit mode for the Message Center.

Version 8.1.4 - December 8, 2016
================================
- Fixed the SDK pod failing to install on some machines.
- Fixed memory leaks with the default message center.
- Removed `.js` extension on the UANativeBridge resource.
- Removed `AirshipKit.h` from `AirshipLib.h` header file.
- Added missing Content-Encoding header when gzipping analytics requests.

Version 8.1.3 - November 30, 2016
=================================
- Fixed isSilentPush check.
- Ensure device token registration starts.

Version 8.1.2 - November 22, 2016
=================================
- Fixed a potential crash due to UAAsyncOperation not being thread safe.

Version 8.1.1 - November 18, 2016
=================================
- Added conversion methods for UNNotificationAction and UIUserNotificationAction in the public header for UANotificationAction.
- Fixed set tag group operation issues.

Version 8.1.0 - November 17, 2016
=================================
- Added support for resizable landing pages.
- Added support for being able to perform `set` operation on tag groups.
- Added support for tag groups in the add and remove tag actions.
- Added two new push registration delegate methods `notificationRegistrationFinishedWithOptions:categories`
  and `notificationAuthorizedOptionsDidChange:` to be notified when notification registration changes occur.
- Added UAFetchDeviceInfoAction to get an updated snapshot of the devices information from the JS bridge.
- Changed default predicate on the UAAddCustomEventAction to accept more situations.
- Changed RetailEventTemplate to only set `ltv` on purchase events.
- Replaced usage of NSURLConnection with NSURLSession.
- Fixed iOS 8-9 compatibility with UANotificationActions by providing a UA version of UNNotificationActionOptions
  and UNNotificationCategoryOptions.

Packaging Changes
-----------------
 - AirshipKit is now distributed with full source code.
 - Pod specs have been moved into main repo.
 - Updated docs build to use Jazzy instead of Appledocs to provide swift and obj-c docs.

Version 8.0.5 - February 2, 2017
================================
- Backported fixes from newer SDK versions:
   - Fixed an analytics bug for cold start direct opens from 8.1.6.
   - Message Center display fix from 8.1.5.
   - Message Center memory leak from 8.1.4.

Version 8.0.4 - November 8, 2016
================================
- Added better file type detection for extensionless media attachment URLs.
- Fixed crash on iOS 10.0 beta users.

Version 8.0.3 - October 24, 2016
================================
- Fixed crash in UAAnalyticsDBManager's dealloc method.

Version 8.0.2 - October 4, 2016
===============================
- Fixed a regression affecting direct opens.

Version 8.0.1 - September 16, 2016
==================================
- Fixed bug that caused duplicate handling of content-available pushes.

Version 8.0.0 - September 7, 2016
=================================
- iOS 10 compatible release.
- Dropped support for iOS 6 and iOS 7.
- Removed deprecated APIs from 7.x.
- Added support for media attachments. Requires applications to provide a notification extension that
  extends the class `UAMediaAttachmentExtension` that is provided in the AirshipAppExtensions.framework.
- UAPushNotificationDelegate has been rewritten to be more aligned with iOS 10.
- Manual application integration methods have been moved to UAAppIntegration.
- Added foreground presentation flag (UAActionMetadataForegroundPresentationKey) to action arguments
  when running actions in situation UASituationForegroundPush
- Added support for foreground presentation options. Default options can be set on UAPush, or
  per notification with presentationOptionsForNotification: method on the UAPushNotificationDelegate.
- Fixed analytics upload issue.

Version 7.3.2 - December 8, 2016
================================
- Fixed memory leaks with the default message center.

Version 7.3.1 - November 28, 2016
=================================
- Fix analytics events failing to upload.

Version 7.3.0 - August 31, 2016
===============================
Warning: This version has an issue with analytics not uploading and should be avoided.

- Added a new simplified location module.
- Added Custom Event templates.
- Added action automation to schedule actions to run when predefined conditions are met.
- Added action situation `UASituationAutomation` for actions that are triggered from automation.
- Added action "schedule_actions" to support scheduling actions from the Actions framework.
- Added action "cancel_scheduled_actions" to support canceling scheduled actions in the Actions framework.

Version 7.2.2 - Aug 1, 2016
===========================
- The Named User is now accessible from UAirship.
- Added the Named User ID and Channel ID to the JavaScript bridge.
- The NSNotification UAChannelCreatedEvent is posted when the channel is created.

Version 7.2.1 - July 27, 2016
=============================
- Fixed bug that caused channel creation to potentially be disabled on first run.

Version 7.2.0 - June 1, 2016
============================
- Removed reference to the Passkit framework. This is to work around the App Store
  incorrectly showing an app `Supports Wallet` when it does not contain wallet
  capabilities (Radar #24942020).
- Replaced the wallet action with the open external URL action.
- App version segmentation now uses the short version string instead of the build number.
- Added optional navigation bar opacity to Message Center styling.

Version 7.1.2 - May 11, 2016
============================
- Fixed tint color bug affecting some Message Center toolbar items.
- Added cell tint and unread indicator color to Message Center styling.

Version 7.1.1 - May 9, 2016
===========================
- Fixed a message deletion bug in the Message Center for Sample and Swift Sample.

Version 7.1.0 - Apr 21, 2016
============================
- Added Message Center unread indicator styling.
- Added Message Center styling from a plist.
- Added Message Center filtering.
- Added Associated identifiers support and limited ad tracking.
- Added new notification action categories.
- Increased custom event property limit to 100.
- Broadened localization support.

Version 7.0.4 - Apr 6, 2016
===========================
- Preserve transparency for scaled Message Center icons.

Version 7.0.3 - March 30, 2016
==============================
- Added more specific UAConfig validation logging.
- Improved custom Event logging.
- Added PushHandler class and Message Center badging to Samples.
- Improved support for when AirshipResources.bundle is unavailable.

Version 7.0.2 - February 12, 2016
=================================
- Fixed submission problems due to the AirshipResources.bundle containing the CFBundleExecutable key.
- Fixed unnecessary AirshipKit recompilations for build directories with spaces.

Version 7.0.1 - February 5, 2016
================================
- Fixed Urban Airship JavaScript bridge when using the default Message Center.
- Added tint color to the Swift Sample's Message Center.

Version 7.0.0 - January 28, 2016
================================
- Includes support for default Message Center. The Message Center can be themed to match the application
  or it can be overridden with a custom Message Center implementation.
- Landing pages will no longer show error pages, instead they will retry indefinitely every 20 seconds
  until either the page loads successfully or the user exits the page.
- Packaged SDK resources in Airship resources bundle.
- Removed out dated Sample UI classes.
- New unified sample that replaces the previous inbox and push sample. The sample is available in
  both Swift and Objective-C.
- detectProvisioningMode now defaults to YES if neither detectProvisioningMode and
  inProduction are explicitly set.
- Fixed detectProvisioningMode incorrectly detecting the app running on a simulator.

6.4.0 - October 29, 2015
========================
- Added a flag to disable sending the device token with channel registration.
- Added support for screen tracking.
- Updated sample UI to search for bundle resources by class.

6.3.0 - October 1, 2015
=======================
- Added support for custom defined properties in custom events.
- Added support for setting associated device identifiers for analytics.
- Added install attribution event to track install attributions.
- In-app messaging now has a display ASAP mode, which will display incoming
  messages as soon as possible when they arrive in the foreground.
- Fixed displaying in-app messages and landing pages in split view multitasking.

6.2.2 - September 17, 2015
==========================
- Disabled modules in the static library to resolve Xcode 7 module cache warnings.
  Note: While this change should be backwards compatible with most existing apps, Swift apps
  built against the static library will need to explicitly link against CoreTelephony.framework
  when building with Xcode 6.4.

6.2.1 - September 14, 2015
==========================
- Added a separate build compiled with Xcode 7 for bitcode support.
- Updated UAirship, UAPush, UAInbox, and UAUser nullability attribute to be null_unspecified instead of nullable.
- Fixed rotation in push sample.

6.2.0 - August 21, 2015
=======================
- Added nullability attributes.
- Added lightweight generics support.
- Added basic support for text input behaviors in interactive notifications.
- Minimum Xcode version is now 6.4.

6.1.4 - August 3, 2015
======================
- Fixed race condition that prevented the SDK from associating a channel with the user in some firstrun scenarios.

6.1.3 - July 28, 2015
=====================
- Location service now sets allowsBackgroundLocationUpdates on iOS 9 devices if background location is enabled in
  the application's capabilities.
- Added a UA-UI-Bridging.h header for Swift applications.
- Samples are now compatible with AirshipKit.
- Fixed crash in the Inbox sample caused by displaying the message list when it is already visible.

6.1.2 - July 10, 2015
=====================
- Fixed possible NSInvalidArgumentException on app foreground due to data decoding error.

6.1.1 - July 6, 2015
====================
- Improved tag group error logging.
- Fixed nullability warnings.

6.1.0 - June 22, 2015
=====================
- Support for channel and named user tag groups.
- Added new action "open_mc_overlay_action" that displays an inbox messages in a landing page.
- Updated "open_mc_action" action to fall back to displaying an inbox messages in a landing page if
  the inbox delegate is not assigned.
- Notification opens that are associated with an inbox message will now automatically trigger the
  "open_mc_action" action if neither the "open_mc_overlay_action" or "open_mc_action" is present.
- Added pasteboard action that allows copying text to the pasteboard.
- Added channel capture test tool to retrieve the Urban Airship Channel ID from a device for testing
  and diagnostics in end user devices.
- Added new action "wallet_action" that allows downloads and displays a Passbook pass.
- Fixed coredata concurrency violations.
- Fixed automatic app delegate setup for swift applications.
- Fixed invalid architectures issue when building applications with AirshipKit.

6.0.2 - April 28, 2015
======================
- Prefixed all constants in public headers with 'UA'.
- Fixed race condition preventing the display of in-app messages on some devices.
- Fixed missing InboxMessage metadata when running an action from a WebView with an associated message.
- Fixed Urban Airship JavaScript bridge when running actions that returns a result with unescaped JSON values.

6.0.1 - April 9, 2015
=====================
- Fixed issue where displaying an in-app message in certain
  circumstances could cause an autolayout crash.

6.0.0 - March 31, 2015
======================
- Support for in-app messaging.
- Support for associating and disassociating a channel to a named user.
- Added new region events for proximity triggers.
- Added a flag to enable/disable analytics at runtime. Useful for providing a privacy opt-out switch.
- Disabling 'userPushNotificationsEnabled' in UAPush is now prevented by the flag 'requireSettingsAppToDisableUserNotifications' in
  iOS8. It is strongly recommended to link the Settings app instead of providing an in-app toggle to turn on and off push. This is
  to work around ongoing bugs in iOS8 (Radar #17878212).
- Modernized public BOOL properties to include the prefix "is" on the getter.
- Reduced the number of internal singletons. UAPush, UAInbox, UAUser, UAActionRegistry shared methods have been deprecated
  and are now accessible from class methods on UAirship.
- Removed action name from action method signatures. The action name is now available with the action arguments metadata.
- UAPushNotificationHandler is no longer automatically set as the push handler if the class was present.
- Fixed Urban Airship JavaScript bridge when the associated InboxMessage contains invalid characters in its title.
- Fixed Inbox not repopulating its messages when an upgrade causes the inbox's internal cache to be dropped.

5.1.1 - December 11, 2014
=========================
- Add workaound for possible CoreTelephony crash.
- Fix compiler warnings in UAInboxMessageListController.

5.1.0 - December 2, 2014
========================
- Added whitelisting to Urban Airship JavaScript interface injection.
- Added UAWebViewDelegate to simplify Urban Airship JavaScript interface injection into custom webview implementations.
  - Prevents the Urban Airship JavaScript interface from being injected multiple times into a page with frames.
- Fixed crash when using the Share Action on iPad devices.

5.0.3 - October 8, 2014
=======================
 - Fixed missing headers in AirshipKit.
 - Fixed custom events attribution from a message center page if the page was
   displayed using the UALandingPageOverlayController.

5.0.2 - September 25, 2014
==========================
 - Fixed issue where inbox messages were coming back after being deleted.

5.0.1 - September 23, 2014
==========================
 - Verify channel location exists during channel creation.
 - Fixed "No Messages" not being displayed for Inbox.
 - Updated build scripts to handle paths with spaces.

5.0.0 - September 17, 2014
==========================

New Features
------------
- Full support for iOS 8, including compatibility with Swift applications.
- Includes an Embedded.framework for use in applications with a minimum SDK version of 8.0.
- Includes support for interactive notifications and the new iOS 8 notification registration model.
  - Includes more than 25 built-in interactive notification sets, including button resources
    for 9 languages.
  - Additional/replacement localization strings may be added to built-in actions.
- Includes a new action for social sharing that can be called from pushes or web views.
- Includes support for defining custom events in our reporting system.
- Background push can now be used without an opt-in prompt (request remote-notification
  background type in your Info.plist).
- The inbox now stores local state for read/delete. The UI no longer needs to block while
  updates are made.
- Inbox core data operations are now performed on a background queue.

Major API Changes
-----------------
- User notifications (badge, alert, sound) now default to OFF. This change is designed to
  make it easier to prompt for permission in the right spot. If you were relying on the
  old default (push enabled at start), you will need to update your registration logic.
- Supports iOS 6+. (Support for iOS 5 has been removed).
- UA location now handles iOS8-style authorization. Once location reporting is started and
  an authorization prompt is presented, changes to the authorization level are not possible
  without updating the app in the App Store. By default, "always" authorization will be requested.
  To request "when in use" set the property 'requestAlwaysAuthorization' to NO on UALocationService.
- Replaced existing tag modifiers on UAPush with more concisely named methods: addTag, addTags,
  removeTag, and removeTags.
- FOR DETAILED INFO: http://docs.urbanairship.com/topic_guides/ios_migration.html

Sample UI Changes
-----------------
- Removed UAInboxUI and UAPushUI protocols. Sample code now displays views directly.
- Refactored the localization in both sample projects.
- Moved sample resources to a new common folder (including those used in the interactive
  notifications).
- Sample projects now include targets that use the embedded framework (static library
  still used in the original targets).

General Modernization
---------------------
- Modernized init and factory methods. All now return `instancetype` rather than `id` or
  concrete classes.
- NS_ENUM and NS_OPTIONS are now used throughout.
- Removed previously deprecated methods and classes.
- Removed use of methods deprecated in iOS 6 (now that iOS 5 support has been dropped).

Documentation Updates
---------------------
- The SDK distribution now includes the API reference documentation in the `reference-docs` folder.
- The generated (header) documentation (in reference-docs) now has complete coverage of our public interface,
  including enums and block types.

4.0.4 - September 10, 2014
==========================
 - Fixed iOS 8 push prompt on first-run and immediate opt-out.
 - Fixed quiet time setting not persisting between application restarts.
 - Added work around for iOS 8 registration bug where disabling push registering prevents registering for notification types
   without a device restart. Instead of registering for 0 notification types, the device will just be marked as opted-out. This only
   affects newer iOS 8 devices. For more information, see the documentation for allowUnregisteringUserNotificationTypes on UAPush.
 - UA location is now compatible with iOS 8 authorization modes. If building against Xcode 6, make sure to add the new authorization
   keys (NSLocationAlwaysUsageDescription and NSLocationWhenInUseUsageDescription) to the application's info.plist. You must also manually
   request the correct authorization before starting location on Urban Airship by calling either requestWhenInUseAuthorization or requestAlwaysAuthorization on CLLocationManager.

4.0.3 - August 28, 2014
=======================
 - Fix undefined symbols build issue when building against the iOS 5 version of the static library.

4.0.2 - August 18, 2014
=======================
This update is only required if building against the iOS 8 SDK.

- Add basic support for new iOS 8 notification registration.

4.0.1 - July 25, 2014
=====================
- Tag utility now uses OS preferred language.
- Renamed methods to prevent false positives when apps are scanned by Apple for use of undocumented APIs.
- Aliases and tags are now trimmed to prevent device registration errors.
- Added custom inbox UIs are now checked that they conform to the UAInboxUI protocol.
- UAInboxMessage no longer extends NSManagedObject to protect against possible inbox message crashes.
- Prefixed internal category extension names with 'UA' to prevent name conflicts with other libraries.
- Fixed possible crash with background tasks.


4.0.0 - March 25, 2014
======================
- Added Urban Airship Actions framework - a generic framework that provides a convenient way to
  automatically perform tasks by name in response to push notifications, Rich App Page interactions and JavaScript.
- Introduced a new device identifier, the Channel ID, which will replace the device token as the push address in Urban
  Airship API calls.
- Use background tasks for all registration and analytics traffic.
- Refactored Urban Airship JavaScript interface injection and webview url interception into UAWebViewTools and UIWebView+UAAdditions.
- Deprecated Urban Airship scheme "ua" in favor of the new scheme "uairship".
- Added JavaScript interface methods - getMessageSentDateMS, getMessageSentDate, getMessageTitle, getMessageId, getUserId and getDeviceModel
  to match the Android Urban Airship JavaScript interface.

3.1.1 (Internal Release) - November 21, 2013
============================================
- Added logging channel id
- Added 3.0.2 changes:
  - Moved headers to project level.
  - Fixed possible crash on iOS5 when opening rich push messages with embedded images.
  - Fixed duplicate notification handling on background push applications.
  - Fixed possible crash with auto app integration when sending performSelector methods to the app delegate.

3.0.4 - March 4, 2014
=====================
- Allow registrations in the background.
- Fix an issue with inbox count.

3.0.3 - February 18, 2014
=========================
- Fix detectProvisioningMode behavior when inProduction is not set.

3.0.2 - November 21, 2013
=========================
- Moved headers to project level.
- Fixed possible crash on iOS5 when opening rich push messages with embedded images.
- Fixed duplicate notification handling on background push applications.
- Fixed possible crash with auto app integration when sending performSelector methods to the app delegate.

3.1.0 (Internal Release) - November 14, 2013
============================================
- Added ability to address opted out devices through channels.

3.0.1 - October 9, 2013
=======================
- Added Inbox message caching through UAURLProtocol.
- Added deleting expired Inbox messages even when the device is offline.
- Added deviceToken validation checks when being set in UAPush.
- Fixed bug where server side deleted Inbox messages were not being deleted on the client.
- Fixed several 64 bit warnings.

3.0.0 - September 18, 2013
==========================
- Removed iOS 4 support. This library version supports iOS 5, 6 and 7.
- Converted to ARC (Automatic Reference Counting).
- Removed SBJSON and replaced with NSJSONSerialization.
- Removed FMDB and replaced with CoreData.
- Removed UAInboxCache.
- Use Urban Airship API V3 'Accepts' Header.
- Send Push Address in request header for location events.
- Added logging for iOS registration.
- Deprecated UAObservable and all related protocols/methods.
- UAPush has a registrationDelegate and the "delegate" property has been deprecated and renamed pushNotificationDelegate.
- UAInboxMessageList/UAInboxMessage exposes new block and delegate-based APIs.

2.1.0 - September 18, 2013
==========================
- Added background push notification support.
- Added 64bit compatibility when building from source (Shipped binaries only contain 32bit support).
- Improved the automatic integration feature by allowing app delegates to inherit from additional classes and protocols.
- Fixed inbox message webview layout for iOS7 in sample UI.
- Fixed a possible crash in UAObservable.

2.0.4 - September 5, 2013
=========================
- Fixed a bug that could cause failing Inbox API requests to retry indefinitely.
- Fixed Inbox database schema error resulting in the Inbox message list to be unavailable when the device is offline.

2.0.3 - August 23, 2013
=======================
- Fixed an analytics bug where opening an application for the first time from a push notification would not count it
as a direct open.

2.0.2 - August 15, 2013
=======================
- Added the entire raw message object to UAInboxMessage to be able to retrieve data that is missing from the model.

2.0.1 - August 7, 2013
======================
- Fixed a bug in UAHTTPConnectionOperation causing intermittent crashes
  during push registration.

2.0.0 - July 23, 2013
=====================
- Replaced the NSDictionary passed to takeOff with a UAConfig model object. More configuration
  options are available and can be set directly on the object (or through the AirshipConfig.plist).
- New AirshipConfig.plist format. The new key names match the property names on UAConfig, though the old
  keys are still valid.
- Added an auto-integration feature. By default, it is no longer necessary to add remote notification
  callbacks to your app delegate or explicitly register for push. This can be configured with a UAConfig option.
- The UA app key can now be automatically toggled between development and production based on the status
  of an app as indicated in the embedded .mobileprovision file.
- Push conversion events are now automatically collected - no integration required.
- Simplified the UAPushNotificationDelegate and UAInboxNotificationDelegate so that they provide callbacks
  when the app is launched from a notification and when one is received while the app is already in the foreground
  The Inbox delegate protocol also provides methods for receiving callbacks when a new or launch message is available
  for viewing.
- Renamed the UAInboxUIProtocol methods for clarity.
- Removed fragile Inbox header badge in sample UI, and replaced with Mail.app style (%d) unread count.
- Rich Push Inbox cache is now optional.
- Removed In-App Purchase and Subscriptions.
- Replaced ASIHTTPRequest with a wrapper around NSURLRequest/Connection.
- Added KIF (functional) tests to PushSample (available in our GitHub repo).
- Reports data now includes the Olson/IANA timezone and Locale. This will enable future reports and push
  segmentation features.
- Updated much of the code with more modern Obj-C features.
- Improved header documentation (which feeds http://docs.urbanairship.com/ios-lib/).
- Removed deprecated methods from UAPush.
- Direct access to the device token registration API can now be done directly with UADeviceAPIClient.
- UAUser now uses the same tags and aliases as the device token.
- The Urban Airship API and UI now provides a mechanismm for addressing a rich push user by the
  device token, rather than the User ID.
- User ID is now displayed in the PushSample application.
- Updated localization bundle strings.
- Removed outdated library macros.
- Added built-in variables for JavaScript embedded in rich push messages: UAirship.messageSentDate,
  UAirship.messageSentDateMS, and UAirship.messageTitle.

1.4.0 - Feb 7, 2013
===================
- Removed all IAP/Subscriptions code from libUAirship-version.a. Applications using subscriptions
  or in-app purchase must use libUAirshipFull-version.a. libUAirshipPush is no longer distributed
  as libUAirship is taking its place.
- Updated projects for Xcode 4.6 compatibility.
- Added AppleHostedStoreFrontSample - a modified version of our StoreFront sample that uses
  Apple's StoreKit download feature.
- Removed original files for external dependencies
- Updated the README with more documentation and a section on contributing code.
- Added more explanatory comments to the sample app delegates.
- The library no longer displays UIAlertViews with error messages - look for errors in the console log.
- Added hooks for internal CI systems.

1.3.7 Nov 28, 2012
==================
- fixed crash in UAAnalyticsDBManager that occured when adding events
in a background task

1.3.6 Nov 28, 2012
==================
- fixed crash on [UAirship land] associated with releasing key/value observers
  in the wrong order
- updated logging, added UALogLevel enum to set logging preferences in UAGlobal
- changed device token handling in UAUser to fix issue with device tokens not
  being updated properly
- updated splash screens and GUI to support iPhone 5
- started caching UA-ID to speed up analytics

1.3.5 Nov 14, 2012
==================
- fixed crash because of weak reference in UAPush to NSUserDefaults
- fixed issue in UAPush when unregistering with a nil device token
- added ability to set a default value for push in NSUserDefaults, previously
  defaulted to yes
- updated PushSample app to demonstrate new push functionality
- updated README with new documentation

1.3.4 Oct 23, 2012
==================
- fixed issue when displaying cached Rich Push messages with UTF8
- fixed edge case where a location event could be discarded while waiting
  for user to allow location based services
- fixed analyzer issues in UAInboxURLCache, UAInboxOverlayController
- library now disables analytics if no server is specified
- moved deviceTokenHasChanged observation to UAUser
- added queuing for analytics read/write access

1.3.3 Sep 17, 2012
==================
- Updated projects for iOS 6 and Xcode 4.5
- Added exception when [UAirship takeOff:<options>] is called
  on a thread other than the main thread
- Fixed registration error that occurred when a device unregistered,
  then re registered
- Added delegate callback for the significant change location service

1.3.2 Aug 15, 2012
==================
- Updated sample projects and UI to reflect new registration workflow
- Quiet time fixes in sample app
- Fixed alias migration bug
- Setting the pusheEnabled property registers and unregisters device tokens
- Deprecated unRegisterDeviceToken
- Fixed unit tests

1.3.1 Aug 7, 2012
=================
- Fixed issue with unregistration that prevented
  subsequent registration

1.3.0 - Aug 7, 2012
===================
- Deprecated registration related methods in UAirship and moved them to UAPush
- Changed behavior for alias,tags, and quiet time, property setters no longer
  automatically trigger a registration API call, refer to UAPush.h for details
- Device metadata (tags,alias,quiet time) is now persisted before a successful
  registration update
- Added auto retry for certain server responses in UAPush during registration

1.2.2 - June 18, 2012
=====================
- Fixed problem reporting hard push conversions in some situations
- Updated UALocationService to shut down single location tasks in a timely
  manner when unrecoverable CLLocationManager errors occurred
- Modified UALocationService single location settings to prevent high accuracy
  location calls from constantly timing out in poor GPS conditions
- Changed UALocationService delegate callbacks when the location service cannot
  retrieve a location that meets accuracy requirements

1.2.1 - April 26, 2012
======================
- Dropped support for iOS versions prior to 4.0
- Location service improvements
- Fixed crash when reporting location to UALocationService from background thread
- Modified UALocationServiceNSDefaultsKey values to contain the "UALocationService" prefix
- CoreTelephony is now required

1.2.0 - April 3, 2012
=====================
- Added location support
- IAP and Subscription content URL cache fixes

1.1.5 - March 28, 2012
======================
- Removed all UDID usage
- Added UA-specific device ID
- Added the ability for devs to access the UAUser ID through a Settings.bundle for support purposes

1.1.4 - January 26, 2012
==========================
- Added nil product check to pending download and decompression logic
- Cleared sessions have an empty string session_id value after app backgrounding

1.1.3 - December 30, 2011
==========================
- Fixed incompatibility between ASIHTTPRequest and UA_ASIHTTPRequest introduced in recent update
- Fixed Subscriptions decompression path bug that resulted in content unzipping into a
  content key subdirectory

1.1.2 - December 20, 2011
==========================
- Updated HTTP client libraries
- IAP and Subscription content URLs are cached for 24 hours after purchase
- Improvements to resuming incomplete installs for IAP and Subscription content
- Subscriptions UI now supports free subscriptions
- Subscriptions checks if products are available before submitting receipts
- FIX: takeOff no longer crashes if the build field in Xcode is not set
- FIX: Downloaded content is stored in Caches on iOS 5.0 and marked with the "do not back up"
  attribute on iOS 5.0.1
- FIX: Tag API is working properly
- FIX: Inbox "Mark as Read" button is unavailable once a message is marked as read

1.1.1 - October 23, 2011
==========================
- Registrations will no longer be performed when the app is running in the background
- FIX: Background download tasks will only be created when there are pending downloads.
- FIX: Properly release UIAlertView displayed in the Inbox UI when messages arrive while the app
  is running.

1.1.0 - October 10, 2011
==========================
General
-------
- Code-level docs are available at http://urbanairship.com/docs/ios-lib/ (a work in progress)
- Silenced analytics/reports-related logging by default.
- Added new iOS5-related analytics events
- Trim whitespace from AirshipConfig.plist keys and secrets
- Removed the need for extra linker flags (all_load and the weak ref to libSystem.B)

IAP
---
- Fixed decompression failure error message text in In-App Purchase

Push
----
- Fix URL-encoding issue in UAPush single-tag methods
- UAPushNotificationDelegate's methods are now optional
- Fixed a UAPushNotificationDelegate selector with an empty parameter name

Subscriptions
-------------
- Fixed a bug in the autorenewable product renewal flow. Renewals are now handled properly.
- Fixed a bug in the SKTransaction handling when both SubscriptionLib and StoreFrontLib were used.
- Fixed a bug in subscription receipt validation. Transactions are now kept open until a receipt
  is validated.

InboxLib
--------
- Major updates to InboxLib and the Rich Push Inbox sample
- Methods and properties related to setting the "active" inbox have been eliminated or renamed
- UAInboxAlertProtocol has been removed
- The inbox database has been renamed from "Airmail.db" to "UAInbox.db"
- Inbox messages can carry an explicit content type other than text/html
- UAInboxMessageList supports concurrent batch updates
- Message extras are now retrieved and cached locally
- Improvements to message and asset cache for performance
- Improvements to Obj-C <-> JavaScript bridge
- Added message id and user id values to the message detail's JS environment
- See http://support.urbanairship.com/customer/portal/articles/200710-upgrading-to-rich-push-in-1-1-
  for information on specific items added, removed or modified

Inbox Protocols
---------------
- UAInboxMessageListObserver breaks out batch update events in explicit success/failure methods
- Cleaner separation from UAUser observer patterns
- New UAInboxPushHandlerDelegate protocol allows for a user-specified delegate to respond to
  incoming in-app messages

Inbox UI Classes
----------------
- iPad specific classes and xib files have been removed
- iPhone interfaces have been generalized to be adaptable to the iPad UI idiom
- New UAInboxOverlayController allows for displaying incoming Rich Push messages
  in an overlay window superimposed over your content
- UAInboxMessageListController and UAInboxMessageViewController have been redesigned to be
  embeddable in non-modal contexts, like navigation controller stacks and tab bar controllers
- New UAInboxNavUI embeds the inbox in a navigation controller or popover controller
- The InboxSample project allows you to select between multiple UI classes on the fly
  as a quick overview of the different inbox interface styles

1.0.7 - August 29, 2011
=========================
- Rebuilt 1.0.6 in Xcode 4.1 to address an armv7 issue in the Xcode 4.2 generated static library

1.0.6 - August 26, 2011
=======================
Autorenewable Subscriptions
---------------------------
- Added Autorenewable subscription support. Purchasing is identical to the non-autorenewable process.
- Added a restore process that will work on multiple devices without email entry. To trigger
  a restore, call UASubscriptionManager's restoreAutorenewables method. The subscription list will
  be automatically reloaded when the restore is complete.
- Added new events in UASubscriptionManagerObserver (see UASubscriptionManager.h for
  details on their use).
- Added UASubscriptionAlertType value that indicates restore failure: UASubscriptionAlertFailedRestore

Newsstand and Other Subscription Updates
----------------------------------------
- The inventory now has an availableProducts property that contains items that are available for sale.
- Added contentForKey: convenience getter to UASubscriptionInventory
- Added publish date for subscription content
- Added option to set custom download directory for subscription content
- Subscription content is now placed in a subdirectory named with the content key OR the specified
  product ID if it is available

Subscription Sample UI
----------------------
- The "Settings" button has been replaced with a "Restore" button.
- The email entry interstitial UIAlertView has been removed.
- Modified sample app to use the product ID string rather than the subscription product object

iOS5-Specific Updates
---------------------
- Fixed modal view issues in each sample UI
- Fixed a crash caused by the unread count graphic in the Inbox UI
- Updated purchase calls so they no longer use iOS5-deprecated purchase methods

Misc updates
------------
- UAUser may now be instantiated before takeOff so that you can add observers for the creation process.
- Added UAUserStateCreating value to the UAUserState enum
- Fixed crash in IAP library caused when a product was purchased multiple times in a single app session.
- Added flexibility to UAHTTPConnection. Supports multiple methods, auth.
- Disabled reports uploads when app is not active
- The library header imports have been cleaned up to prevent conflicts. You
  may need to add some additional imports to any custom UI classes (e.g., UASubscriptionProduct.h)
- Instance variables are now private
- Better documentation. New AR functionality is documented in headers.
- Updates for Xcode 4.1 and 4.2 beta

1.0.5 - April 26, 2011
======================
- Fixed bug where the StoreFront sample UI would not return control to the original window.
- Fixed bug where product_id was missing from subscription objects.
- Fixed enum collisions with external libraries.
- Fixed multiple exec_bad_access crashes in StoreFront UI.
- Fixed bug that would append product_id to download custom download directories.
- Fixed bug that would append trailing slashes to tags.
- Fixed bad property assignment in UAInboxUI.
- Fixed early SKTransaction finish calls that could cause a crash.
- Fixed bug that could cause downloads to fail on retry and appear stuck.
- Fixed bug where StoreFrontDetails viewcontroller could be pushed twice and crash.
- Fixed arm6 LLVM bug that would cause crashing on older devices when launching UAirship.
- Moved UAInboxMessageListCell to shared.
- Removed extra logging, and changed logs to be triggered by a takeOff options flag LOGGING_ENABLED
- Removed all non-essential code files from Airship/External directory.
- Library is now a single arm6/arm7/i386 universal release file.
- Xcode4 support for all projects.

1.0.4 - February 23, 2011
=========================
- Added Analytics to all products and samples. Gathering basic device data and tracking app state
to determine push conversion related data. Can be enabled/disabled via takeOffOptions, on by default.
- Added a completely re-worked PushLib with an all new sample project and UI. Includes a number
of handlers for making push, alias, tags, and auto-badge much simpler to use.
- Add ability to send key/secret and other settings via takeOffOptions.
- Added cleaner exits and error handling for missing UI classes.
- Renamed log macros to have a UA_ prefix.
- Fixed enum linker collisions on Reachability and asihttp.
- Fixed IAP iPad UI crash in landscape mode.

1.0.3 - January 31, 2011
========================
- Updated copyrights
- Fixed storeFrontWillHide delegate call. Removed storeFrontDidHide.
- Updated all projects to use Clang/LLVM 1.6 as default (fully compatible now)
- Fixed numerous LLVM/Analyzer warnings

1.0.2 - January 27, 2011
========================
- Fixed bug causing downloads to still go to NSDocuments instead of NSLibrary
- Removed category on UIDevice, eliminating -all_load flag requirement, and moved the functionality to UAUtils
- Fixed dateFormatter to require GMT and en_us_posix locale
- Fixed bug where download directory intermediate dirs were not initialized

1.0.1 - January 20, 2011
========================
- Fixed bug that would erroneously cause subscription transactions to finish early with rare network issues.
- Moved keys to AirshipConfig.plist
- Added missing -all_load linker flags
- Added UATagUtils helper class for setting typical device tags
- Removed unused class UAInboxDelegate
- Updated README

1.0.0 - December 27, 2010
=========================
- First Static Library Release
