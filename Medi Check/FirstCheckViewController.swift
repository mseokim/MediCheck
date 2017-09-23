//
//  FirstCheckViewController.swift
//  Medi Check
//
//  Created by 김민서 on 2017. 9. 23..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit

var whereQuestion: String!
var howQuestion: String!
var whenQuestion: String!
var whileQuestion: String!

class FirstCheckViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var array1 = ["머리", "눈", "코", "입", "귀", "팔", "다리", "손", "발", "가슴", "허리", "배", "기타"]
    var array2 = ["통증", "간지러움", "두드러기", "타박상", "어지러움", "매스꺼움", "기타"]
    var placeAnswer_1 = 0
    var placeAnswer_2 = 0
    
    var pickerView_1: UIPickerView!
    var pickerView_2: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        self.title = "진단"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.logoColor]
        
        let firstLabel = UILabel(frame: CGRect(x: 25, y: view.frame.height * 0.01 - 10, width: view.frame.width - 20, height: view.frame.height * 0.3))
        firstLabel.text = "01. 어느 부위가 불편\n하신가요?"
        firstLabel.numberOfLines = 2
        firstLabel.font = UIFont(name: "NanumSquareEB", size: 25)
        firstLabel.textColor = UIColor.logoColor
        view.addSubview(firstLabel)
        
        let pickerViewFirst = UIPickerView(frame: CGRect(x: 0, y: view.frame.height * 0.2 - 25, width: view.frame.width, height: view.frame.height * 0.2))
        pickerViewFirst.dataSource = self
        pickerViewFirst.delegate = self
        
        view.addSubview(pickerViewFirst)
        
        let sndLabel = UILabel(frame: CGRect(x: 25, y: view.frame.height * 0.31 - 10, width: view.frame.width - 20, height: view.frame.height * 0.3))
        sndLabel.text = "02. 해당 부위가 어떻게\n불편하신가요?"
        sndLabel.numberOfLines = 2
        sndLabel.font = UIFont(name: "NanumSquareEB", size: 25)
        sndLabel.textColor = UIColor.logoColor
        view.addSubview(sndLabel)
        
        let pickerViewSecond = UIPickerView(frame: CGRect(x: 0, y: view.frame.height * 0.5 - 25, width: view.frame.width, height: view.frame.height * 0.2))
        pickerViewSecond.dataSource = self
        pickerViewSecond.delegate = self
        view.addSubview(pickerViewSecond)
        
        let nextButton = UIButton(frame: CGRect(x: 50, y: view.frame.height * 0.75, width: view.frame.width - 100, height: view.frame.height * 0.08))
        nextButton.setTitle("다음", for: .normal)
        nextButton.backgroundColor = UIColor.logoColor
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "NanumSquareB", size: nextButton.frame.height * 0.3)
        nextButton.layer.cornerRadius = nextButton.frame.height * 0.5
        nextButton.addTarget(self, action: #selector(moveToNext), for: .touchUpInside)
        view.addSubview(nextButton)
        
        pickerView_1 = pickerViewFirst
        pickerView_2 = pickerViewSecond
    }
    
    @objc func moveToNext() {
        self.navigationController?.pushViewController(SecondCheckViewController(), animated: true)
        var arr1 = pickerView_1.selectedRow(inComponent: 0)
        var arr2 = pickerView_2.selectedRow(inComponent: 0)
        
        whereQuestion = array1[arr1]
        howQuestion = array2[arr2]
    }
    
    
    
    @objc func popView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var countRows = array1[row]
        if pickerView == pickerView_2 {
            countRows = array2[row]
        }
        return countRows
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countRows = array1.count
        if pickerView == pickerView_2 {
            countRows = array2.count
        }
        return countRows
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerView_1 {
            placeAnswer_1 = row
        } else if pickerView == pickerView_2 {
            placeAnswer_2 = row
        }
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
