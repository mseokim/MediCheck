//
//  MersViewController.swift
//  Medi Check
//
//  Created by 김민서 on 2017. 9. 23..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit

class MersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        let name = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.15, width: view.frame.width, height: view.frame.height * 0.1))
        name.text = "중동호흡기증후군"
        name.font = UIFont(name: "NanumSquareEB", size: 30)
        name.textColor = UIColor.logoColor
        name.textAlignment = .center
        view.addSubview(name)
        
        let enName = UILabel(frame: CGRect(x: 0, y: view.frame.height * 0.24, width: view.frame.width, height: view.frame.height * 0.04))
        enName.textAlignment = .center
        enName.text = "Middle East Respiratory Syndrome, MERS"
        enName.textColor = UIColor.logoColor
        enName.font = UIFont(name: "NanumSquareR", size: 15)
        view.addSubview(enName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
