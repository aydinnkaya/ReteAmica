//
//  ViewController.swift
//  ReteAmica
//
//  Created by AydınKaya on 25.12.2024.
//

import UIKit

class PersonVC: UIViewController{
    
    @IBOutlet weak var personTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var personList = [Kisiler]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        personTableView.delegate = self
        personTableView.dataSource = self
        
        let p1 = Kisiler(kisi_id: 1, kisi_ad: "Aydin", kisi_tel: "5314681288")
        let p2 = Kisiler(kisi_id: 2, kisi_ad: "Kelebek", kisi_tel:"5314681288")
        let p3 = Kisiler(kisi_id: 3, kisi_ad: "Bebis", kisi_tel: "5314681288")
        let p4 = Kisiler(kisi_id: 4, kisi_ad: "Hatun", kisi_tel: "5314681288")
        
        personList += [p1,p2,p3,p4]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "personDetail" {
            if let person = sender as? Kisiler {
                let transtatitonVC = segue.destination as! DetailVC
                transtatitonVC.kisi = person
            }
        }
        
    }
    
}

extension PersonVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print("Person Search : \(searchText)")
        
    }
}



extension PersonVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let person = personList[indexPath.row]  // all list find
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell") as! PersonTableViewCell
        
        cell.labelName.text = person.kisi_ad
        cell.labelPhone.text = person.kisi_tel
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let person = personList[indexPath.row]
        performSegue(withIdentifier: "personDetail", sender: person)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: { contextualAction,view,bool in
            
            let person = self.personList[indexPath.row]
            
            
            let alert = UIAlertController(title: "Delete", message: "\(person.kisi_ad!) Deleted ?", preferredStyle: .alert)
            
            let alertActionY = UIAlertAction(title: "Yes",style: .destructive){action in
                
            }
            
            let alertActionC = UIAlertAction(title: "Cancel",style: .cancel )
            
            alert.addAction(alertActionC)
            alert.addAction(alertActionY)
            
            self.present(alert, animated: true)
            
        })
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

