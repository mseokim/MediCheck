

import UIKit

class SecondCheckViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var array1 = ["오늘", "1일 ~ 1주일 전", "1주일 ~ 2주일 전", "2주일 ~ 한달 전", "한달 이상"]
    var array2 = ["1분 이내", "1분 ~ 30분", "30분 ~ ", "특정 상황", "불규칙적"]
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
        firstLabel.text = "03. 통증이 시작된 시점을\n선택해주세요."
        firstLabel.numberOfLines = 2
        firstLabel.font = UIFont(name: "NanumSquareEB", size: 25)
        firstLabel.textColor = UIColor.logoColor
        view.addSubview(firstLabel)
        
        let pickerViewFirst = UIPickerView(frame: CGRect(x: 0, y: view.frame.height * 0.2 - 25, width: view.frame.width, height: view.frame.height * 0.2))
        pickerViewFirst.dataSource = self
        pickerViewFirst.delegate = self
        
        view.addSubview(pickerViewFirst)
        
        let sndLabel = UILabel(frame: CGRect(x: 25, y: view.frame.height * 0.31 - 10, width: view.frame.width - 20, height: view.frame.height * 0.3))
        sndLabel.text = "04. 통증의 주기를\n선택해주세요."
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
        self.navigationController?.pushViewController(LastCheckViewController(), animated: true)
        var arr1 = pickerView_1.selectedRow(inComponent: 0)
        var arr2 = pickerView_2.selectedRow(inComponent: 0)
        
        whenQuestion = array1[arr1]
        whileQuestion = array2[arr2]
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

