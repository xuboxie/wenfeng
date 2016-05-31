//
//  AppDelegate.swift
//  wenfeng
//
//  Created by BoxU on 16/5/15.
//  Copyright © 2016年 BoxU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMUserInfoDataSource  {

    

    var window: UIWindow?
    
    
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
//        code
        
        let userInfo = RCUserInfo()
        
        switch userId {
        case "xiaobo":
            userInfo.portraitUri = "http://img.25pp.com/uploadfile/youxi/images/2014/1202/20141202105822882.jpg"
        case "xiaobo2":
            userInfo.portraitUri = "http://img.25pp.com/uploadfile/youxi/images/2014/1202/20141202105822882.jpg"
        default:
            print("无此用户")
            
       
        }
        return completion(userInfo)
        
        
    }
    
    
    func connectServer(completion:() -> Void ) {
//        获取保存的Token
//     let  deviceTokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken")
//        初始化AppKey
        RCIM.sharedRCIM().initWithAppKey("25wehl3uwn5tw")
        
        
        
        
        
        
        //        用token测试连接
        RCIM.sharedRCIM().connectWithToken("Gf4obtxU3QGTLkj6DUWQALvtllc5X3RrZIKYKunqx9vqUNoFWz2kXQK0IksbuFfaZXKDM1q/NQnyHcUN8QunVQ==", success: { (_) -> Void in
            print("连接成功")
            
            let currentUserInfo = RCUserInfo(userId: "xiaobo", name: "小波", portrait: "http://img.25pp.com/uploadfile/youxi/images/2014/1202/20141202105822882.jpg")
            RCIMClient.sharedRCIMClient().currentUserInfo = currentUserInfo
            
            print("连接成功app1")
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion()
            })
  
            }, error: { (_) -> Void in
                print("连接失败")
            }) { () -> Void in
                print("Token不正确,或已经失效")
        }
        
        }


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        查询保存的token
//        let deviceTokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as? String
        
//        初始化appkey
   RCIM.sharedRCIM().initWithAppKey("25wehl3uwn5tw")
//      RCIM.sharedRCIM().initWithAppKey("25wehl3uwn5tw",  deviceToken: deviceTokenCache)
        
//        设置用户信息提供者为自己 AppDelegate
        RCIM.sharedRCIM().userInfoDataSource = self

        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

