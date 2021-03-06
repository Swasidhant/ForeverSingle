//
//  AdvantagesViewController.swift
//  ForeverSingle
//
//  Created Swasidhant Chowdhury on 09/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class AdvantagesViewController: UIViewController {
    
    @IBOutlet weak var tblAdvantages: UITableView!
    var arrAdvantages: [Advantages] = []

	override func viewDidLoad() {
        super.viewDidLoad()
        self.assignToCoreData()
    }

    func assignToCoreData () {
        let coreDataManager = CoreDataManager()
        if coreDataManager.fetchAll().count > 0 {
            
        } else {
            DBAdditonHelper.parseAndAddToCoreData()
        }
        self.arrAdvantages = coreDataManager.fetchAll()
        self.tblAdvantages.reloadData()
    }
}

extension AdvantagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrAdvantages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvantageCell") as! AdvantageTableViewCell
        cell.assignAdvantage(adv: self.arrAdvantages[indexPath.row].desc!)
        return cell
    }
}

