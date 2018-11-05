//
//  PersonDetailVC.swift
//  PersonMgr
//
//  Created by killian galea on 24/10/2018.
//  Copyright © 2018 killiangalea. All rights reserved.
//

import UIKit

class PersonDetailVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate
{
    
    //Fields vars
    @IBOutlet weak var lastnameTF: UITextField!
    @IBOutlet weak var firstnameTF: UITextField!
    @IBOutlet weak var nationalityTF: UITextField!
    
    //Picker vars
    @IBOutlet weak var datePV: UIPickerView!
    var datePickerData: [Int] = [Int]()
    var genderPickerData: [String] = [String]()
    var pickerData: [[Any]] = [[Any]]()
    
    //Data vars
    var person: Person!
    var personIndex: Int!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Instanciation du PickerView
        self.datePV.delegate = self
        self.datePV.dataSource = self
        
        //Instanciation des TextFields
        self.lastnameTF.delegate = self
        self.firstnameTF.delegate = self
        self.nationalityTF.delegate = self
        
        // Instanciation des Datas
        for i in 1950...2018
        {
            datePickerData.append(i)
        }
        genderPickerData = ["Male", "Female"]
        pickerData = [datePickerData, genderPickerData]
        
        
        //Default value of pickerView
        if  (person != nil)
        {
            lastnameTF.text = person.lastName
            firstnameTF.text =  person.firstName
            nationalityTF.text = person.nationality
            
            let birthYear = datePickerData.index(of: person.birthYear)
            datePV.selectRow(birthYear!, inComponent: 0, animated: true)
            
            let gender = genderPickerData.index(of: person.gender)
            datePV.selectRow(gender!, inComponent: 1, animated: true)
        }
    }
    
    //Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData[component].count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return "\(pickerData[component][row])"
    }
    
    //TextFields
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    
    // MARK: - Navigation
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "doneSegue"
        {
            
            //Change Person
            if  (person != nil)
            {
                person.firstName = firstnameTF.text!
                person.lastName = lastnameTF.text!
                person.nationality  = nationalityTF.text!
                let birthYear = datePickerData[datePV.selectedRow(inComponent: 0)]
                person.birthYear = birthYear
                let gender = genderPickerData[datePV.selectedRow(inComponent: 1)]
                person.gender = gender
            }
            //Add Person
            else
            {
                if firstnameTF.text != "" && lastnameTF.text != ""
                {
                    person = Person.init(firstName: firstnameTF.text!, lastName: lastnameTF.text!)
                    person.nationality = nationalityTF.text!
                    let birthYear = datePickerData[datePV.selectedRow(inComponent: 0)]
                    person.birthYear = birthYear
                    let gender = genderPickerData[datePV.selectedRow(inComponent: 1)]
                    person.gender = gender
                }
            }
        }
    }
}
