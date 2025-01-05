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
    var personList = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    init() {
        self.personList = pRepo.personList
        personLoading()
    }
    
    func personDelete(kisi: KisilerModel){
        pRepo.personDelete(kisi: kisi)
    }
    
    func personSearch(inputText: String){
        pRepo.personSearch(inputText: inputText)
    }
    
    func personLoading(){
        pRepo.personLoading()
    }
    
    
   
    
}
