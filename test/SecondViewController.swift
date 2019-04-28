//
//  ViewController.swift
//  test
//
//  Created by 助永悠輝 on 2019/04/24.
//  Copyright © 2019 助永悠輝. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let fruits = ["リンゴ", "みかん", "ぶどう"]
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count;
    }
    
    /// セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = fruits[indexPath.row]
        return cell
    }
    
    /// セルが選択された時に呼ばれるデリゲートメソッド
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("セル番号：(indexPath.row) セルの内容：(fruits[indexPath.row])")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

