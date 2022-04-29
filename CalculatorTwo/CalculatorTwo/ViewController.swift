//
//  ViewController.swift
//  CalculatorTwo
//
//  Created by Consultant on 4/27/22.
//

import UIKit

class ViewController: UIViewController{
    let screenSize1: CGFloat = UIScreen.main.bounds.width
    let screenSize: CGRect = UIScreen.main.bounds
    var buttons: [UIButton] = []
    var operators = [Character]()
    var numbers = [Double]()
    var answer : Double = 0
    
    lazy var mainLabel: UILabel = {
        let mainLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenSize1, height: 40))
        mainLabel.translatesAutoresizingMaskIntoConstraints = true
        mainLabel.textAlignment = .center
        mainLabel.center.y = self.view.center.x
        mainLabel.text = "0"
        mainLabel.font = UIFont(name: "Chalkduster", size: 60)
        mainLabel.widthAnchor.constraint(equalToConstant: screenSize1).isActive = true
        mainLabel.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        return mainLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        let width = screenSize.width
        let height = screenSize.width
        
        //populate buttons
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "AC"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "+ -"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x:0, y: 0, width: width, height: height), title: "%"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "/"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "7"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "8"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x:0, y: 0, width: width, height: height), title: "9"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "x"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "4"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "5"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x:0, y: 0, width: width, height: height), title: "6"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "-"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "1"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "2"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x:0, y: 0, width: width, height: height), title: "3"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "+"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "0"))
        buttons.append(UIButton.attributedButton(frame: CGRect(x: 0, y: 0, width: width, height: height), title: "."))
        buttons.append(UIButton.attributedButton(frame: CGRect(x:0, y: 0, width: width, height: height), title: "="))
        
        //add all buttons as sub view
        for index in buttons {
            print (index)
            self.view.addSubview(index)
        }
        
        //add all button listeners
        buttons[0].addTarget(self, action: #selector(self.ACAction(_:)), for: .touchUpInside)
        buttons[1].addTarget(self, action: #selector(self.plusminusAction(_:)), for: .touchUpInside)
        buttons[2].addTarget(self, action: #selector(self.percentAction(_:)), for: .touchUpInside)
        buttons[3].addTarget(self, action: #selector(self.signAction(_:)), for: .touchUpInside)
        buttons[4].addTarget(self, action: #selector(self.numberAction(_:)), for: .touchUpInside)
        buttons[5].addTarget(self, action: #selector(self.numberAction(_:)), for: .touchUpInside)
        buttons[6].addTarget(self, action: #selector(self.numberAction(_:)), for: .touchUpInside)
        buttons[7].addTarget(self, action: #selector(self.signAction(_:)), for: .touchUpInside)
        buttons[8].addTarget(self, action: #selector(self.numberAction(_:)), for: .touchUpInside)
        buttons[9].addTarget(self, action: #selector(self.numberAction(_:)), for: .touchUpInside)
        buttons[10].addTarget(self, action: #selector(self.numberAction(_:)), for: .touchUpInside)
        buttons[11].addTarget(self, action: #selector(self.signAction(_:)), for: .touchUpInside)
        buttons[12].addTarget(self, action: #selector(self.numberAction(_:)), for: .touchUpInside)
        buttons[13].addTarget(self, action: #selector(self.numberAction(_:)), for: .touchUpInside)
        buttons[14].addTarget(self, action: #selector(self.numberAction(_:)), for: .touchUpInside)
        buttons[15].addTarget(self, action: #selector(self.signAction(_:)), for: .touchUpInside)
        buttons[16].addTarget(self, action: #selector(self.numberAction(_:)), for: .touchUpInside)
        buttons[17].addTarget(self, action: #selector(self.deciAction(_:)), for: .touchUpInside)
        buttons[18].addTarget(self, action: #selector(self.equalAction(_:)), for: .touchUpInside)
        
        //create stack views
        let stackView = UIStackView.attributedStack(width: width, height: height)
        let stackView1 = UIStackView.attributedStack(width: width, height: height)
        let stackView2 = UIStackView.attributedStack(width: width, height: height)
        let stackView3 = UIStackView.attributedStack(width: width, height: height)
        let stackView4 = UIStackView.attributedStack(width: width, height: height)
        
        //add stackview subviews and mainLabel
        self.view.addSubview(mainLabel)
        self.view.addSubview(stackView)
        self.view.addSubview(stackView1)
        self.view.addSubview(stackView2)
        self.view.addSubview(stackView3)
        self.view.addSubview(stackView4)
    
        //populate stackViews with buttons
        populateStackview(stack: stackView, buttons: buttons, add4ButtonsFrom: 0)
        populateStackview(stack: stackView1, buttons: buttons, add4ButtonsFrom: 4)
        populateStackview(stack: stackView2, buttons: buttons, add4ButtonsFrom: 8)
        populateStackview(stack: stackView3, buttons: buttons, add4ButtonsFrom: 12)
        populateStackview(stack: stackView4, buttons: buttons, add4ButtonsFrom: 16)
        
        //set stackView constraints
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: width).isActive = true
        stackView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20.0).isActive = true
        stackView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView1.widthAnchor.constraint(equalToConstant: width).isActive = true
        stackView1.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20.0).isActive = true
        stackView2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView2.widthAnchor.constraint(equalToConstant: width).isActive = true
        stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 20.0).isActive = true
        stackView3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView3.widthAnchor.constraint(equalToConstant: width).isActive = true
        stackView3.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 20.0).isActive = true
        stackView4.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView4.widthAnchor.constraint(equalToConstant: width).isActive = true
        stackView4.topAnchor.constraint(equalTo: stackView3.bottomAnchor, constant: 20.0).isActive = true
        
    }
    
    func populateStackview (stack: UIStackView, buttons: [UIButton], add4ButtonsFrom: Int ){
        
        if (add4ButtonsFrom  != 16){
            for count in 0...3 {
                stack.addArrangedSubview(buttons[add4ButtonsFrom + count])
            }
        } else  {
            for count in 0...2 {
                if count == 0{
                    stack.distribution = .fill
                    buttons[16].widthAnchor.constraint(equalToConstant: stack.frame.width/2).isActive = true
                    buttons[17].widthAnchor.constraint(equalToConstant: stack.frame.width/4).isActive = true
                    buttons[18].widthAnchor.constraint(equalToConstant: stack.frame.width/4).isActive = true
                }
                stack.addArrangedSubview(buttons[add4ButtonsFrom + count])
            }
        }
    }
        
    @objc func ACAction(_ sender:UIButton!) {
        mainLabel.text = "0"
    }
    
    @objc func numberAction(_ sender:UIButton!) {
        if (mainLabel.text != "0"){
            mainLabel.text? += sender.currentTitle ?? "error"
        }
        
        if (mainLabel.text == "0" || answer != 0){
            mainLabel.text = sender.currentTitle
            answer = 0
        }
    }
    
    @objc func signAction(_ sender:UIButton!){
        numbers.append(Double(mainLabel.text ?? "0") ?? 0)
        operators.append(Character(sender.currentTitle ?? "error"))
        mainLabel.text = "0"
    }
    
    @objc func plusminusAction(_ sender:UIButton!){
            var isReversed = 0
            
            if (mainLabel.text == "0"){
                mainLabel.text = "0"
            }
            
            if (mainLabel.text?.first == "-" && isReversed == 0){
                mainLabel.text?.removeFirst()
                isReversed = 1
            }
            
            if (mainLabel.text != "0" && isReversed == 0){
                mainLabel.text = "-" + (mainLabel.text ?? "error")
                isReversed = 1
            }
    }
    
    @objc func percentAction(_ sender:UIButton!) {
            var percentage : Double? = Double(mainLabel.text!)
            percentage = (percentage ?? 0) / 100
            
            //if is a double, return a double, else return an int
            if (floor(percentage ?? 0) == percentage){
                mainLabel.text = String(Int(percentage ?? 0))
            }
            
            if (floor(percentage ?? 0) != percentage){
                mainLabel.text = String(Double(percentage ?? 0))
            }
    }
    
    @objc func deciAction(_ sender:UIButton!) {
            if (mainLabel.text == "0" || answer != 0){
            mainLabel.text = "0."
            answer = 0
            }
            
            if ((mainLabel.text?.contains("."))) != true{
            mainLabel.text = mainLabel.text! + "."
            }
    }
    
    @objc func equalAction(_ sender:UIButton!) {
            var index = 0
            
            numbers.append(Double(mainLabel.text ?? "0") ?? 0)
            
            for _ in numbers{
                var x : Double = 0
                var y : Double = 0
                
                x = numbers[index]
                
                if (index > 0){
                    x = answer
                }
                
                if (index < numbers.count - 1){
                y = numbers[index+1]
                    
                    if operators[index] == "+"{
                        answer = x + y
                    }
                    
                    if operators[index] == "-"{
                        answer = x - y
                    }
                    
                    if operators[index] == "x"{
                        answer = x * y
                    }
                    
                    if operators[index] == "/"{
                        answer = x / y
                    }
                }
                
                index += 1
            }
            
            //if is a double, return a double, else return an int
            if (floor(answer) == answer){
                mainLabel.text = String(Int(answer))
            }
            
            if (floor(answer) != answer){
                mainLabel.text = String(Double(answer))
            }
        
            //reset arrays
            numbers.removeAll()
            operators.removeAll()
    }
    
}

extension UIButton {
    class func attributedButton(frame: CGRect, title: String) -> UIButton {
        let button = UIButton(frame: frame)
        button.clipsToBounds = true
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2.0
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor.black
        button.titleLabel?.font =  UIFont(name: "Chalkduster", size: 26)
        return button
    }
}

extension UIStackView {
    class func attributedStack(width: CGFloat, height: CGFloat) -> UIStackView {
        let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        stackView.axis = .horizontal
        stackView.alignment = UIStackView.Alignment.center
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        return stackView
    }
 }
