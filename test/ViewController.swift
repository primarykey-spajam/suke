//
//  ViewController.swift
//  test
//
//  Created by 助永悠輝 on 2019/04/24.
//  Copyright © 2019 助永悠輝. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func hoge(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "StoryBoard2", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "StoryBoard2")
        self.present(nextView, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

