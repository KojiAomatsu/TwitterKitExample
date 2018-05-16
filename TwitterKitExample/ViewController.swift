//
//  ViewController.swift
//  TwitterKitExample
//
//  Created by 青松洸司 on 2018/05/15.
//  Copyright © 2018年 青松洸司. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {

    @IBOutlet weak var secondButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(String(describing: session?.userName))");
            } else {
                print("error: \(String(describing: error?.localizedDescription))");
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)

        secondButton.addTarget(self, action: #selector(self.onClick(_:)), for: .touchUpInside)

    }

    @objc func onClick(_ sender: AnyObject) {
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                print(session?.userID ?? "userID")
                print(session?.userName ?? "userName")
                print(session?.authToken ?? "authToken")
                print(session?.authTokenSecret ?? "authTokenSecret")
                print("signed in as \(String(describing: session?.userName))");
            } else {
                print("error: \(String(describing: error?.localizedDescription))");
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

