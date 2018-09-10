//
//  LeftMenuViewController.swift
//  sliderMenuTest
//
//  Created by Lai Evan on 6/25/18.
//  Copyright © 2018 Lai Evan. All rights reserved.
//

import UIKit

class LeftMenuCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    
}


protocol LeftMenuViewControllerDelegate {
    
    func leftMenuViewDidTapAtIndexPath(_ sender: LeftMenuViewController,indexPath:IndexPath)
    
}


class LeftMenuViewController: UIViewController {

    var delegate:LeftMenuViewControllerDelegate?

}

extension LeftMenuViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LeftMenuCell
        
        if indexPath.row == 0 {
            
            cell.name.text = "首頁"
            
        }
        else if indexPath.row == 1 {
            
            cell.name.text = "選單一"
            
        }
        else if indexPath.row == 2 {
            
            cell.name.text = "選單二"
            
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.delegate?.leftMenuViewDidTapAtIndexPath(self, indexPath: indexPath)
        
        
    }
    
    
    
}
