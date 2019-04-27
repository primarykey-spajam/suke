//
//  SecondViewController.swift
//  test
//
//  Created by 助永悠輝 on 2019/04/27.
//  Copyright © 2019 助永悠輝. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBAction func swipeHandler(_ sender: Any) {
        let nextView = storyboard!.instantiateViewController(withIdentifier: "Third")
        self.present(nextView, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
