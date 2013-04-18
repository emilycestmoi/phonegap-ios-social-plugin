# Cordova iOS Social Plugin #
by [Cameron Lerch](http://brightflock.com)

---
### [This plugin is hosted by the author](https://github.com/bfcam/phonegap-ios-social-plugin)
---

## DESCRIPTION ##

* This plugin integrates with the iOS6+ social framework to provide social sharing. Features are only available on devices with
  iOS6+--if this is not acceptable look at sharekit.

* Very lightweight as it relies on iOS's social framework. The plugin can be seen as a lightweight alternative to the very heavy sharekit.

* Requires the social framework to be added as "Optional" to your xcode project.

* Use window.plugins.social.available to check whether social framework is available. Check this before calling any other functions to
  ensure you are running on iOS6+

## INSTALLATION ##

* In Xcode, drag the *.m and *.h files into your project under the Cordova "Plugins" directory. Ensure that Xcode is set to copy the files.

* Open the "Resources/Cordova.plist" file and under "Plugins" add a key with the plugin name "Social" and a string value of "Social".

* Add Social.framework to your Xcode project as "Optional". To do this (Tested in Xcode 4.6), click on your project in the project navigator
  then select you app build target in the main window. Select the "Build Phases" tab. Expand "Link Binary With Libraries". Click the "+" and
  add "Social.framework" (under the iOS 6.x+ section). Mark the framework as being "Optional" (It will default to "Required"). Drag the
  "Social.framework" resource to sit under "Frameworks" in your project navigator.

* Copy social.js to your www directory and include it in your index.html.

## AVAILABILITY ##

Within your Cordova app check to see if Social can even be used--it required iOS6+. Do this:

```
window.plugins.social.available(function(avail) {
  if (avail) {
    // Show social widgets
  } else {
    // Social not supported
  }
});
```

## SHARING ##

Once you have checked that Social is available you can allow for sharing. To do this setup a button within your Cordova app that when triggered does something like this:

```
window.plugins.social.share('This is the message you want to share', 'http://someurl.com', 'www/image/local_image.jpg');
```

The message and url are trivial. The image is a file on the device itself. I actually haven't tested passing an image url to see if the social framework
will deal with it or not, but I suspect it may.

The share services that are available are dictated by what has been setup in the iOS device settings by the user. Here is what the share
screen looks like:

![ScreenShot](https://raw.github.com/bfcam/phonegap-ios-social-plugin/master/screenshot.png)

## CREDITS ##

Contributors :

* [Cameron Lerch](http://brightflock.com), author. Sponsored by Brightflock.
