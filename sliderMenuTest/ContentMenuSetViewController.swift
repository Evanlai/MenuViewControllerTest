//
//  ContentMenuSetViewController.swift
//  sliderMenuTest
//
//  Created by Lai Evan on 6/21/18.
//  Copyright © 2018 Lai Evan. All rights reserved.
//

import UIKit


protocol ContentMenuSetViewControllerDelegate {
    
    func contentViewDidTapMenu(_ sender: ContentMenuSetViewController)

}

class ContentMenuSetViewController: UIViewController {
    
    var contentMenuSetViewDelegate: ContentMenuSetViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapMenu(_ sender: Any) {
        
        self.contentMenuSetViewDelegate?.contentViewDidTapMenu(self)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
