//
//  SlideMenuViewController.swift
//  sliderMenuTest
//
//  Created by Lai Evan on 6/21/18.
//  Copyright © 2018 Lai Evan. All rights reserved.
//

import UIKit

class SlideMenuViewController: UIViewController,ContentMenuSetViewControllerDelegate,LeftMenuViewControllerDelegate {
    
    fileprivate var left: UINavigationController!;
    
    fileprivate var right: UINavigationController!;
    
    @IBOutlet var LeftMenuConstraint: NSLayoutConstraint!
   
    @IBOutlet var ContentViewConstraint: NSLayoutConstraint!
   
    fileprivate var isClosed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "LeftMenu" {
            
            let navigation = segue.destination as! UINavigationController
            
            let leftMenu = navigation.viewControllers[0] as! LeftMenuViewController
            
            leftMenu.delegate = self
            
            self.left = navigation
            
            
        }
        else if segue.identifier == "ContentView" {
            
            let navigation = segue.destination as! UINavigationController
            
            let contentView = navigation.viewControllers[0] as! ContentMenuSetViewController
            
            contentView.contentMenuSetViewDelegate = self
            
            self.right = navigation
            
        }
        
    }
    
    
    func contentViewDidTapMenu(_ sender: ContentMenuSetViewController) {
        
        self.isClosed = !self.isClosed
        
        UIView.animate(withDuration: 0.5, animations: {
            
            if self.isClosed == true {
                
                self.LeftMenuConstraint.priority = UILayoutPriority(rawValue: 800)
                
                self.ContentViewConstraint.priority = UILayoutPriority(rawValue: 850)
                
            }
            else {
                
                self.LeftMenuConstraint.priority = UILayoutPriority(rawValue: 850)
                
                self.ContentViewConstraint.priority = UILayoutPriority(rawValue: 800)
                
            }
            
            self.view.layoutIfNeeded()
            
        }) { (finished) in
            
        }
    }
    
    
    func leftMenuViewDidTapAtIndexPath(_ sender: LeftMenuViewController, indexPath: IndexPath) {
    
        if indexPath.row == 0 {
            
            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "A") as! ContentMenuSetViewController
            
            controller.contentMenuSetViewDelegate = self
            
            self.right.setViewControllers([controller], animated: true)
            
        }
        else if indexPath.row == 1 {
            
            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "B")  as! ContentMenuSetViewController
            
            controller.contentMenuSetViewDelegate  = self
            
            self.right.setViewControllers([controller], animated: true)
            
        }
        else if indexPath.row == 2 {
            
            let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "C") as! ContentMenuSetViewController
            
            controller.contentMenuSetViewDelegate = self
            
            self.right.setViewControllers([controller], animated: true)
            
        }
        
    }
}
