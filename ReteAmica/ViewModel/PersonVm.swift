//
//  PersonVm.swift
//  ReteAmica
//
//  Created by AydınKaya on 2.01.2025.
//

import Foundation
import RxSwift

class PersonVm{
    
    var pRepo = PersonDaoRepository()
    var personList = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init() {
        veritabaniKopyala()
        self.personList = pRepo.personList
        personLoading()
    }
    
    func personDelete(kisi_id: Int){
        pRepo.personDelete(kisi_id: kisi_id)
    }
    
    func personSearch(inputText: String){
        pRepo.personSearch(inputText: inputText)
    }
    
    func personLoading(){
        pRepo.personLoading()
    }
    
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                
                print("SQL Copy Hatası: \(error.localizedDescription)")
            }
        }
    }
    
}
