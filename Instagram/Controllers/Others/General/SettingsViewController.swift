//
//  SettingsViewController.swift
//  Instagram
//
//  Created by Sivaranjani Venkatesh on 11/5/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // setup tableview for settings
    private let tableview:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
        view.backgroundColor = .black
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
        
        tableview.frame = view.bounds
        
    }

}

extension SettingsViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell?.textLabel?.text =
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Handle cell selection
        
    }
    
}
