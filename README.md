#Pegasi Ads iOS-SDK



Pegasi Ads SDK(iOS Version) is a mobile advertising SDK that serves monitization for publishers. 


**Currently supported ad formats**：

- Native Ads (Native news feed/mini-Native news feed/Native triple image ads/Native small image ads

- Interstitial Ads (Supported by  elements of native ads )

- Banner Ads （ad size: 320*50&300*250, supported by elements of native ads）

- Splash Screen Ads (ad size ratio: 1.4:1）



## How To Get Started

- [Download Pegasi-Ads-iOS-SDK](https://github.com/CMAdSDK/pegasi-ios-sdk)  on Github 
- Read the ["Guide for Cheetah Mobile Pegasi-Ads-iOS-SDK" ](https://github.com/CMAdSDK/pegasi-ios-sdk/blob/master/Documents/IntergrationGuideForSDK.pdf)


## Communication

- If you **need help**, use [ Issue](https://github.com/CMAdSDK/pegasi-ios-sdk/issues). (Tag 'Pegasi-SDK')
- If you'd like to **ask a general question**, e-mail [cmcm.ads@gmail.com](mailto:cmcm.ads@gmail.com).
- If you **found a bug**, _and can provide steps to reliably reproduce it_, open an [Issue](https://github.com/CMAdSDK/pegasi-ios-sdk/issues).



## Installation
Pegasi-Ads-iOS-SDK supports multiple methods for installing the library in a project.

##*Manual Installation*

**Adding the SDK to your Xcode project（manually）**

If you do not have CheetahMobileAds downloaded already, grab it from  Github（https://github.com/CMAdSDK/pegasi-ios-sdk）and unzip it. 

**Step 1. Add the SDK to your Xcode project**

Right-click on the CheetahMobileAdsDemo project, and choose“Add Files To CheetahMobileAdsDemo” ,to add files to CheetahMobileAdsDemo.
<p align="center" >
  <img src="http://www.cmcm.com/images/front/cms-title.png" alt="Pegasi" title="Pegasi">
</p>
Add the SDK under the CheetahMobileAds file:
<p align="center" >
  <img src="http://www.cmcm.com/images/front/cms-title.png" alt="Pegasi" title="Pegasi">
</p>

**Step 2. Add other frames that the SDK required**

The SDK depends on the following iOS development frameworks which may not already be part of your project:
- AdSupport
- CoreTelephony
- StoreKit
- 	CoreLocation
- Security
- SystemConfiguration

Navigate to Project Settings > Build Phases

Select "Link Binary with Libraries" Option

Click "+" to add other frameworks required

**Step 3. Change settings of static library**

Navigate to Target>Build Settings>Linking
Select“Other Linker Flags”option and add-ObjC（as shown below）	
<p align="center" >
  <img src="http://www.cmcm.com/images/front/cms-title.png" alt="Pegasi" title="Pegasi">
</p>

**Step 4. Modify AppTransportSecurity settings of info.plist（for iOS 9）**

Now that iOS 9 has introduced AppTransportSecurity(ATS) characteristic, Developers are expected to add NSAppTransportSecurity settings in their projects, in order to support http requesting. The detailed settings are as follows:
<p align="center" >
  <img src="http://www.cmcm.com/images/front/cms-title.png" alt="Pegasi" title="Pegasi">
</p>







## Requirements

| Pegasi Version | Minimum iOS Target | Notes  | 
|:--------------------:|:---------------------------:|:----------------------------:|:----------------------------:|:----------------------------:|:-------------------------------------------------------------------------:|
| 1.5.0 | iOS 7  |  Native ads,   Interstitial ads,  Splash screen ads, Banner ads[320*50]&[300*250] are supported in V 1.5.0 | 

(OS X projects must support [64-bit with modern Cocoa runtime](https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtVersionsPlatforms.html)).


