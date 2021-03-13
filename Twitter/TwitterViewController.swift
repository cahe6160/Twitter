//
//  TwitterViewController.swift
//  Twitter
//
//  Created by Caroline Hernandez on 3/12/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TwitterViewController: UIViewController {

    @IBAction func cancel(_ sender: Any) {
        // dismiss screen
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            // could put alert that they need text
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
