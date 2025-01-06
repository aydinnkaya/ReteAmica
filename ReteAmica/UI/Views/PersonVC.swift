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
    var viewModel = PersonDaoRepository()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        personTableView.delegate = self
        personTableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshPersonList), name: NSNotification.Name("PersonListUpdated"), object: nil)

        
        _ = viewModel.personList.subscribe(onNext: { list in
            self.personList = list
            DispatchQueue.main.async{
                self.personTableView.reloadData()
            }
            
        })
        
    }
    
    @objc func refreshPersonList() {
          viewModel.personLoading()
      }
      
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.personLoading()
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
        viewModel.personSearch(inputText: searchText)
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
                self.viewModel.personDelete(kisi_id: person.kisi_id!)
            }
            
            let alertActionC = UIAlertAction(title: "Cancel",style: .cancel )
            
            alert.addAction(alertActionC)
            alert.addAction(alertActionY)
            
            self.present(alert, animated: true)
            
        })
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

