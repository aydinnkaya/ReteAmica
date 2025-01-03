//
//  PersonDaoRepository.swift
//  ReteAmica
//
//  Created by AydınKaya on 2.01.2025.
//

import Foundation
import RxSwift


class PersonDaoRepository {
    
    var db : FMDatabase? 
    
    
    init() {
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        
        db = FMDatabase(path: databaseURL.path)
    }
    
    var personList = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func personSave(kisi_ad:String, kisi_tel:String){
        print("Kisi ad: \(kisi_ad), Kisi tel: \(kisi_tel)")
    }
    
    
    func personUpdate(kisi_id: Int, kisi_ad:String, kisi_tel:String){
        print("Kisi id: \(kisi_id), Kisi ad: \(kisi_ad), Kisi tel: \(kisi_tel)")
    }
    
    func personDelete(kisi_id: Int){
        
    }
    
    func personSearch(inputText: String){
        print("")
    }
    
    func personLoading(){
        
        /*
         let initialList = [
         Kisiler(kisi_id: 1, kisi_ad: "Aydin", kisi_tel: "5314681288"),
         Kisiler(kisi_id: 2, kisi_ad: "Kelebek", kisi_tel: "5314681288"),
         Kisiler(kisi_id: 3, kisi_ad: "Bebis", kisi_tel: "5314681288"),
         Kisiler(kisi_id: 4, kisi_ad: "Hatun", kisi_tel: "5314681288")
         ]
         personList.onNext(initialList)
         
         */
        
        db?.open()
        
        var list = [Kisiler]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while rs.next() {
                let kisi = Kisiler(kisi_id: Int(rs.string(forColumn: "kisi_id"))!, kisi_ad: rs.string(forColumn: "kisi_ad"), kisi_tel: rs.string(forColumn: "kisi_tel"))
                
                list.append(kisi)
            }
            personList.onNext(list)
            
        }
        catch{
            print("SQL Hatası: \(error.localizedDescription)")
        }
        
        db?.close()
        
    }
    
}
