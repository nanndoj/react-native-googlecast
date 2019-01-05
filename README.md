
# react-native-googlecast

## Getting started

`$ npm install react-native-googlecast --save`

### Mostly automatic installation

`$ react-native link react-native-googlecast`

### Manual installation


#### iOS

1.Make sure you follow the steps required to [Setup Google Cast SDK for IOS](https://developers.google.com/cast/docs/ios_sender/)
2. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
3. Go to `node_modules` ➜ `react-native-googlecast` and add `RNGooglecast.xcodeproj`
4. In XCode, in the project navigator, select your project. Add `libRNGooglecast.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
5. Ensure that the **Access WiFi Information** switch in the **Capabilities** section of the target is set to "On".
![Image of Yaktocat](https://developers.google.com/cast/images/xcode_wifi_capability.png)
6. Run your project (`Cmd+R`)<

#### Android

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

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNGooglecast.sln` in `node_modules/react-native-googlecast/windows/RNGooglecast.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Googlecast.RNGooglecast;` to the usings at the top of the file
  - Add `new RNGooglecastPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNGooglecast from 'react-native-googlecast';

// TODO: What to do with the module?
RNGooglecast;
```
  