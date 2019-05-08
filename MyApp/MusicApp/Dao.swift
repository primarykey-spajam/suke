//
//  Dao.swift
//  MusicApp
//
//  Created by 助永悠輝 on 2019/05/09.
//  Copyright © 2019 助永悠輝. All rights reserved.
//

import RealmSwift
import Foundation

class HistoryModel: Object {
    @objc dynamic var word = ""
    @objc dynamic var contents = ""
}

/// 全Daoのベース
class Dao {
    /// Realmのインスタンスを取得
    let realm: Realm
    
    // シングルトン化
    static var dao = {
        return Dao()
    }()
    private init() {
        /// Realmのインスタンス
        realm = try! Realm()
    }
    
    /// 全件取得
    ///
    /// - Returns: 検索結果
    func findAll() -> Results<HistoryModel> {
        return realm.objects(HistoryModel.self)
    }
    
    
    /// 1件目のみ取得
    ///
    /// - Returns: 最初の1件取得
    func findFirst() -> HistoryModel? {
        return findAll().first
    }
    
    /// 指定キーのレコードを取得
    ///
    /// - Parameter key: プライマリキーの値
    /// - Returns: 検索結果
    func findFirst(key: AnyObject) -> HistoryModel? {
        return realm.object(ofType: HistoryModel.self, forPrimaryKey: key)
    }
    
    /// 最後のレコードを取得
    ///
    /// - Returns: 最後の1件を取得
    func findLast() -> HistoryModel? {
        return findAll().last
    }
    

    
    /// レコード削除
    ///
    /// - Parameter d: 削除レコード
    func delete(d: HistoryModel) {
        do {
            try realm.write {
                realm.delete(d)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    /// レコード全削除
    func deleteAll() {
        let objs = realm.objects(HistoryModel.self)
        do {
            try realm.write {
                realm.delete(objs)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func create(d: HistoryModel) -> Void{
        do {
            try realm.write {
                realm.add(d);
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    /**こっから下は使うべき時が来たら使う
     /// レコードを追加、または更新する。
     ///
     /// - Parameters:
     ///   - d: 更新レコード
     ///   - block: ブロック処理
     /// - Returns: 成功, 失敗 => true, false
     func createOrUpdate(d: T, updateFunc:(_ d: T) -> (T)) -> Bool {
     do {
     try realm.write {
     var updatingD = updateFunc(d)
     updatingD = setDefaultColumnValue(d: updatingD)
     realm.add(updatingD, update: true)
     }
     return true
     } catch let error as NSError {
     print(error.description)
     }
     return false
     }
    /// 新規主キー発行
    ///
    /// - Returns: 新id (primaryKey無いときはnil)
    private func newId() -> Int? {
        guard let key = T.primaryKey() else {
            //primaryKey未設定
            return nil
        }
        
        if let last = realm.objects(T.self).last,
            let lastId = last[key] as? Int {
            return lastId + 1
        } else {
            return 1
        }
    }
    
    
    /// デフォルトカラムの値を設定
    ///
    /// - Parameter d: 追加するレコード
    private func setDefaultColumnValue(d: T) -> (T) {
        if realm.isInWriteTransaction {
            if d.id <= 0 {
                d.id = self.newId()!
            }
            d.updated_at = Date()
        } else {
            try! realm.write {
                if d.id <= 0 {
                    d.id = self.newId()!
                }
                d.updated_at = Date()
            }
        }
        return d
    }
 **/
}


