//
//  ViewController.swift
//  GroupedTableViewApp
//
//  Created by Vincent Cubit on 9/28/21.
//


import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var petTable: UITableView!
    
    
    let petArray = [["Mammal", "cat", "dog", "hamster", "gerbil", "rabbit"], ["Bird", "parakeet", "parrot", "canary", "finch"], ["Fish", "tropical fish", "goldfish", "sea horses"], ["Reptile", "turtle", "snake", "lizard"]]
    let cellID = "CellID"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.petTable.delegate = self
        self.petTable.dataSource = self
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.petArray.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.petArray[section][0]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.petArray[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = self.petArray[indexPath.section][indexPath.row]
        
        
        return cell!
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let selectedItem = self.petArray[indexPath.section][indexPath.row]
        
        let display = UIAlertController(title: "Hey there!", message: "You selected \(selectedItem)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        display.addAction(okAction)
        
        present(display, animated: true, completion: nil)
        
        
    }


}

