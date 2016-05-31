//
//  ConversationListViewController.swift
//  wenfeng
//
//  Created by BoxU on 16/5/16.
//  Copyright © 2016年 BoxU. All rights reserved.
//

import UIKit


class ConversationListViewController: RCConversationListViewController{

    @IBAction func ShowMenu(sender: UIBarButtonItem) {
     
//      var frame = sender.valueForKey("view")?.frame
//      frame?.origin.y = (frame?.origin.y)! + 30
//      KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems: [
//      KxMenuItem("客服", image:UIImage(named: "serve"), target:self, action: "ClickMenu1"),
//      KxMenuItem("好友", image:UIImage(named: "contact"), target:self, action: "ClickMenu2")!
//        ])
        
        let items = [
        MenuItem(title: "客服", iconName: "serve", glowColor: UIColor.redColor(), index: 0),
        MenuItem(title: "与小波聊天", iconName: "contact", glowColor: UIColor.blueColor(), index: 1),
        MenuItem(title: "通讯录", iconName: "coversation", glowColor: UIColor.greenColor(), index: 2),
        MenuItem(title: "关于", iconName: "about", glowColor: UIColor.yellowColor(), index: 3)
        ]
        let menu = PopMenu(frame: self.view.bounds, items: items)
        menu.menuAnimationType = PopMenuAnimationType.NetEase
        if menu.isShowed {
            return
        }
        
        menu.didSelectedItemCompletion = { (selectedItem:MenuItem!) -> Void in
            
            switch selectedItem.index{
        case 1:
            //      代码跳转到会话界面
            let conVC = RCConversationViewController()
            conVC.targetId = "好友小波"
            //                conVC. = model
            conVC.conversationType = RCConversationType.ConversationType_PRIVATE
            
            conVC.title = "好友小波"
                   self.navigationController?.pushViewController(conVC, animated: true)
            
            self.tabBarController?.tabBar.hidden = true
            
        default :
             print (selectedItem.title)
            
            }
           
            
        }
        
        menu.showMenuAtView(self.view)
        
        
    }
    
    func ClickMenu1() {
    print("与客服聊天")
        //      代码跳转到会话界面
        let conVC = RCConversationViewController()
        
        conVC.targetId = "客服"
        //                conVC. = model
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        
        conVC.title = "客服"
        
        
        
        
        self.navigationController?.pushViewController(conVC, animated: true)
        
        self.tabBarController?.tabBar.hidden = true

    }
    
    func ClickMenu2() {
//      代码跳转到会话界面
        let conVC = RCConversationViewController()
        
        conVC.targetId = "好友小波"
        //                conVC. = model
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        
        conVC.title = "好友小波"
        
        
        
        
        self.navigationController?.pushViewController(conVC, animated: true)
        
        self.tabBarController?.tabBar.hidden = true
       

        print("与好友聊天")
    }

    
    
   let conVC = RCConversationViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        
        let appDelegate = UIApplication.sharedApplication().delegate as?
         AppDelegate
        appDelegate?.connectServer({ ( ) -> Void in
                        print("连接成功app")
            
       self.setDisplayConversationTypes([
        RCConversationType.ConversationType_APPSERVICE.rawValue,
        RCConversationType.ConversationType_CHATROOM.rawValue,
        RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
        RCConversationType.ConversationType_DISCUSSION.rawValue,
        RCConversationType.ConversationType_GROUP.rawValue,
        RCConversationType.ConversationType_PRIVATE.rawValue,
        RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
        RCConversationType.ConversationType_SYSTEM.rawValue
        
        ])
//            刷新显示最近会话列表
         self.refreshConversationTableViewIfNeeded()
            
  

      func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel: RCConversationModel!, atIndexPath: NSIndexPath!)
      
      {
//
        
            
            }
            //        )
//        appDelegate.connectServer({ () -> Void in
//            print("连接成功app")
        })
        
         // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
        
    }
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destVC = segue.destinationViewController as? RCConversationViewController
        
        destVC?.targetId = self.conVC.targetId
        destVC?.conversationType = self.conVC.conversationType
        destVC?.title = conVC.title
        
        
        self.tabBarController?.tabBar.hidden = true
        
    }
    
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {

/*      代码跳转到会话界面
        let conVC = RCConversationViewController()
        
          conVC.targetId = model.targetId
//                conVC. = model
          conVC.conversationType = RCConversationType.ConversationType_PRIVATE
          conVC.title = model.conversationTitle
        
        self.navigationController?.pushViewController(conVC, animated: true)
   
        self.tabBarController?.tabBar.hidden = true
*/
      
        conVC.targetId = model.targetId
        //                conVC. = model
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = model.conversationTitle

        self.performSegueWithIdentifier("tapOnCell", sender: self)
    }
    

}
