//
//  LastCheckViewController.swift
//  Medi Check
//
//  Created by 김민서 on 2017. 9. 23..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit
import Alamofire

    var resultArr: String!

class LastCheckViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
        var array2 = ["예, 같은 병원에 같은 증상 방문", "예, 다른 병원에 같은 증상 방문", "아니오, 같은 병원에 다른 증상 방문", "아니오, 방문한 적이 없습니다"]
        var result = ["같은 병원, 같은 증상", "다른 병원, 같은 증상", "같은 병원, 다른 증상", "다른 병원, 다른 증상"]
        var placeAnswer_2 = 0
        var pickerView_2: UIPickerView!
    
    var final: String!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setUI()
        }
        
        func setUI() {
            self.title = "진단"
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.logoColor]
            
            let firstLabel = UILabel(frame: CGRect(x: 25, y: view.frame.height * 0.05, width: view.frame.width - 20, height: view.frame.height * 0.05))
            firstLabel.text = "증상"
            firstLabel.font = UIFont(name: "NanumSquareEB", size: 25)
            firstLabel.textColor = UIColor.logoColor
            view.addSubview(firstLabel)
            
            let sickBody = UILabel(frame: CGRect(x: 40, y: view.frame.height * 0.12, width: view.frame.width, height: view.frame.height * 0.03))
            sickBody.text = "- 아픈 부위 : " + whereQuestion + ", " + howQuestion
            sickBody.font = UIFont(name: "NanumSquareL", size: 20)
            view.addSubview(sickBody)
            
            let startSickTime = UILabel(frame: CGRect(x: 40, y: view.frame.height * 0.18, width: view.frame.width, height: view.frame.height * 0.03))
            startSickTime.text = "- 통증 시작 시기 : " + whenQuestion
            startSickTime.font = UIFont(name: "NanumSquareL", size: 20)
            view.addSubview(startSickTime)
            
            let sickTime = UILabel(frame: CGRect(x: 40, y: view.frame.height * 0.24, width: view.frame.width, height: view.frame.height * 0.03))
            sickTime.text = "- 통증 주기 : " + whileQuestion
            sickTime.font = UIFont(name: "NanumSquareL", size: 20)
            view.addSubview(sickTime)
            
            let whereHospital = UILabel(frame: CGRect(x: 40, y: view.frame.height * 0.3, width: view.frame.width, height: view.frame.height * 0.03))
//            whereHospital.text = "- " + resultArr
            whereHospital.font = UIFont(name: "NanumSquareL", size: 20)
            view.addSubview(whereHospital)
            
            let sndLabel = UILabel(frame: CGRect(x: 25, y: view.frame.height * 0.31 - 10, width: view.frame.width - 20, height: view.frame.height * 0.3))
            sndLabel.text = "이와 같은 증상으로\n병원을 찾은 적이 있나요?"
            sndLabel.numberOfLines = 2
            sndLabel.font = UIFont(name: "NanumSquareEB", size: 25)
            sndLabel.textColor = UIColor.logoColor
            view.addSubview(sndLabel)
            
            let pickerViewSecond = UIPickerView(frame: CGRect(x: 0, y: view.frame.height * 0.5 - 10, width: view.frame.width, height: view.frame.height * 0.2))
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
            
            pickerView_2 = pickerViewSecond
            
            final = sickBody.text! + "\n" + startSickTime.text! + "\n" + sickTime.text!
        }
        
        @objc func moveToNext() {
            var arr2 = pickerView_2.selectedRow(inComponent: 0)
            
            resultArr = result[arr2]
            
            let alert = UIAlertController(title: "예약 하시겠습니까?", message: final, preferredStyle: UIAlertControllerStyle.alert)
            
            let offAction = UIAlertAction(title: "예약하기", style: UIAlertActionStyle.default, handler: {
                ACTION in
                self.navigationController?.popToRootViewController(animated: true)
            })
            let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.default, handler: nil)
            
            alert.addAction(offAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
        }
        
        
        
        @objc func popView() {
            
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            var countRows = "0"
            if pickerView == pickerView_2 {
                countRows = array2[row]
            }
            return countRows
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            var countRows: Int!
            if pickerView == pickerView_2 {
                countRows = array2.count
            }
            return countRows
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if pickerView == pickerView_2 {
                placeAnswer_2 = row
            }
        }
    }
