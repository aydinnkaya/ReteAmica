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
    
}
