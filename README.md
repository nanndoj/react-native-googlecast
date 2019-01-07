
# react-native-googlecast

IOS only for awhile

## Getting started

`$ npm install react-native-googlecast --save`

### Mostly automatic installation

`$ react-native link react-native-googlecast`


#### Configure the Cast SDK - iOS

*Using cocoapods* - Add the following line to your podfile

`pod 'google-cast-sdk', '4.3.0'`

or make sure you follow the steps to [manual setup Google Cast SDK for IOS](https://developers.google.com/cast/docs/ios_sender/#manual_setup)

### Manual installation

#### iOS

2. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
3. Go to `node_modules` ➜ `react-native-googlecast` and add `RNGooglecast.xcodeproj`
4. In XCode, in the project navigator, select your project. Add `libRNGooglecast.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
5. Ensure that the **Access WiFi Information** switch in the **Capabilities** section of the target is set to "On".
![Image of Yaktocat](https://developers.google.com/cast/images/xcode_wifi_capability.png)
6. Run your project (`Cmd+R`)<

#### Android

**ANDROID VERSION STILL IN DEVELOPMENT. WILL BE PUBLISHED SOON**

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNGooglecastPackage;` to the imports at the top of the file
  - Add `new RNGooglecastPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-googlecast'
  	project(':react-native-googlecast').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-googlecast/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-googlecast')
  	```

## Usage

### Initialize the Cast Context

The GoogleCast object is a singleton object  which coordinates all of the library's activities. This object must be initialized early in the application's lifecycle, so that automatic session resumption on sender app restart can trigger properly.

The `init` function expects a receiver `appId` previously registered on [Google Cast SDK Developer Console](https://cast.google.com/publish/)

```javascript
import GoogleCast, { LoggerLevel } from 'react-native-googlecast';

// Initialize the cast sender application
// It will automatically handle the device discovery
GoogleCast.init({
    appId: '', // The receiver app id
    enableLogging: true, // Enable logging
    loggerLevel: LoggerLevel.INFO // Define the logger level
});
```
  
### Cast Button

The `CastButton` component manages almost everything you need in order to connect your app to a device and start casting. 
 
It becomes visible when a receiver is discovered that supports your app. 

When the user first clicks on the cast button, a cast dialog is displayed which lists the discovered devices. When the user clicks on the cast button while the device is connected, it allows the user to disconnect from the cast device.

```javascript
import { CastButton } from 'react-native-googlecast';

export const MyReactComponent = () => {
    return (
        <CastButton
           tintColor="#FFF"
           presentCastInstructionsOnce={true}
           media={{
             url: 'http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8',
             contentType: 'application/x-mpegURL', // video/mp4 for MP4 Video
             title: 'My Cast Video',
             subtitle: 'Description of the video',
             imageUrl: 'https://sample-videos.com/img/Sample-jpg-image-500kb.jpg'
           }}
         />
    )
};
```

### Clear instructions shown flags

Clears the persistent flag that tracks whether the Cast instructions modal has been shown.

```javascript
GoogleCast.clearCastInstructionsShownFlag();
```

## IMPORTANT
Only videos with **CORS headers** can be casted. It is a requirement for adaptive content on Chromecast. If you want to check if the video that you want to play include those headers, you can run the following command

````
curl -v [video url]
````

and check if the header `Access-Control-Allow-Origin` is present