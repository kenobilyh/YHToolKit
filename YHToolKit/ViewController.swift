//
//  ViewController.swift
//  YHToolKit
//
//  Created by Jeff Lin on 5/28/16.
//  Copyright © 2016 JeffLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CellIdentifier")
        tableView?.delegate = self
        tableView?.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK : UITableViewDataSource
extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier")
        cell?.textLabel?.text = "Focus animation"
        
        return cell!
    }
}

// MARK : UITableViewDelegate
extension UIViewController {
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transitionPage = TransitionViewController.init()
        self.navigationController?.pushViewController(transitionPage, animated: true)
    }
}
