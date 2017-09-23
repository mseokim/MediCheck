//
//  MainViewController.swift
//  Medi Check
//
//  Created by 김민서 on 2017. 9. 23..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        view.backgroundColor = .white
        self.title = "Medicheck"
//        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "Cabin-Bold", size: 20)! ]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.logoColor]
        
        let logo = UIImageView(frame: CGRect(x: view.frame.width * 0.29, y: view.frame.height * 0.17, width: view.frame.width * 0.42, height: view.frame.width * 0.42))
        logo.image = #imageLiteral(resourceName: "pic_main_logo.png")
        view.addSubview(logo)
        
        let btnStart = UIButton(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.54, width: view.frame.width * 0.8, height: view.frame.height * 0.08))
        btnStart.setTitle("진단 시작", for: .normal)
        btnStart.setTitleColor(UIColor.white, for: .normal)
        btnStart.backgroundColor = UIColor.logoColor
        btnStart.layer.cornerRadius = btnStart.frame.height * 0.5
        btnStart.titleLabel?.font = UIFont(name: "NanumSquareB", size: btnStart.frame.height * 0.3)
        btnStart.addTarget(FirstCheckViewController(), action: #selector(moveToCheck), for: .touchUpInside)
        view.addSubview(btnStart)
        
        let btnByeong = UIButton(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.65, width: view.frame.width * 0.8, height: view.frame.height * 0.08))
        btnByeong.setTitle("유행병 증상", for: .normal)
        btnByeong.setTitleColor(UIColor.logoColor, for: .normal)
        btnByeong.backgroundColor = UIColor.white
        btnByeong.layer.cornerRadius = btnStart.frame.height * 0.5
        btnByeong.titleLabel?.font = UIFont(name: "NanumSquareB", size: btnStart.frame.height * 0.3)
        btnByeong.layer.borderColor = UIColor.logoColor.cgColor
        btnByeong.layer.borderWidth = 1
        btnByeong.addTarget(MersViewController(), action: #selector(moveToByeong), for: .touchUpInside)
        view.addSubview(btnByeong)
    }
    
    @objc func moveToCheck() {
        self.navigationController?.pushViewController(FirstCheckViewController(), animated: true)
    }
    
    @objc func moveToByeong() {
        self.navigationController?.pushViewController(MersViewController(), animated: true)
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
