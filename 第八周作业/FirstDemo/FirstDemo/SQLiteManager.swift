//
//  SQLiteManager.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/12/4.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit
import SwiftyJSON

class SQLiteManager: NSObject {

    /// 单例
    static let shareInstance: SQLiteManager = SQLiteManager()
    
    override init() {
        super.init()
        var path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
        
        
        
        openDB(name:path + "demo.sqlite")
        
       
    }
    
    func jsonData(){
        let path = Bundle.main.path(forResource: "fmdb", ofType: "json")
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let json = try! JSON(data: jsonData)
        
        if let venues =  json["response"]["venues"].arrayObject{
            for index in 0...venues.count - 1{
                let addDic = NSMutableDictionary.init()
                let dic = venues[index] as! NSDictionary
                let location = dic["location"] as! NSDictionary
                let price = dic["price"] as! NSDictionary
                
                addDic.setValue(dic["name"], forKey: "name")
                addDic.setValue(location["distance"], forKey: "distance")
                addDic.setValue(price["currency"], forKey: "price")
                addDic.setValue(price["tier"], forKey: "tier")
                self.insertDataToTable(tableName: "Tea", dicFields: addDic)
            }
        }
        
    }
    
    
    var db: FMDatabase?
    func openDB(name: String)
    {
        // 2.创建数据库对象
        db = FMDatabase(path: name)
        
        // 3.打开数据库
        // open()特点: 如果数据库文件不存在就创建一个新的, 如果存在就直接打开
        if !db!.open()
        {
            print("打开数据库失败")
            return
        }
        
        // 4.创建表
        if !createTable()
        {
            print("创建数据表失败")
            return
        }
        
        if !self.isHasTeaData(){
            self.jsonData()
        }
        
    }
    
    /**
     创建表
     */
    func createTable() ->Bool{
        // 1.编写SQL语句
        
        let sql = "CREATE TABLE IF NOT EXISTS Tea (id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,distance integer NOT NULL,price text NOT NULL,tier integer NOT NULL)"
        
        // 2.执行SQL语句
        // 注意: 在FMDB中, 除了查询以外的操作都称之为更新
        return db!.executeUpdate(sql, withArgumentsIn: [])
    }
    
     func queryTeaData(sql:String) -> NSMutableArray{
        //查询数据
        let rs = try! db!.executeQuery(sql, values:[]) as? FMResultSet
        let ary = NSMutableArray.init()
        //遍历结果集
        while(rs?.next())!{
            let dic = NSMutableDictionary.init()
            dic.setValue(rs?.string(forColumn: "name"), forKey: "name")
            dic.setValue(rs?.int(forColumn: "distance"), forKey: "distance")
            dic.setValue(rs?.string(forColumn: "price"), forKey: "price")
            dic.setValue(rs?.int(forColumn: "tier"), forKey: "tier")
            ary.add(dic)
        }
        
        return ary
    }
    
    func isHasTeaData() -> Bool{
        //查询数据
        let rs = try! db!.executeQuery("SELECT * FROM Tea", values:[]) as? FMResultSet
        var bool = false
        //遍历结果集
        while(rs?.next())!{
           bool = true
        }
        
        return bool
    }
    
    
    
    func insertDataToTable(tableName:String,dicFields:NSDictionary){
        if (db?.open())! {
            let arFieldsKeys:[String] = dicFields.allKeys as! [String]
            let arFieldsValues:[Any] = dicFields.allValues
            do{
                try db?.executeUpdate("INSERT INTO 'Tea' (tier,name,distance,price) VALUES(?,?,?,?)", withArgumentsIn: arFieldsValues)
            }catch{
                print(db?.lastErrorMessage() as Any)
            }
            
        }
    }
}



