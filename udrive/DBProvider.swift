//
//  DBProvider.swift
//  udrive
//
//  Created by 王資猛 on 2018/1/20.
//  Copyright © 2018年 王資猛. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DBProvider {
    private static let _instance = DBProvider()
    
    static var Instance: DBProvider{
        return _instance
    }
    
    var dbRef: DatabaseReference {
        return Database.database().reference();
    }
    
    var driversRef: DatabaseReference {
        return dbRef.child(Constants.DRIVERS)
    }
    
    //request ref
    
    //requestAccepted
    
    func saveUser(withID: String, email: String, password: String){
        let data: Dictionary<String, Any> = [Constants.EMAIL: email, Constants.PASSWORD: password, Constants.isRider: false];
        
        driversRef.child(withID).child(Constants.DATA).setValue(data)
        
    }
    
    
}// class

