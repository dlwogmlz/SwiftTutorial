//
//  RootViewController.swift
//  Swift_Tutorial
//
//  Created by JAEHEE LEE on 2022/05/15.
//

import UIKit

class RootViewController:UIViewController {
    
    // Label생성
    // MARK: Properties
    lazy var helloWorldLabel:UILabel = {
       let label = UILabel()
        label.text = "Hello World!"
        return label // return label로 helloworldLabel과 label은 같은게 된다.
    }()
    
    //Button생성
    lazy var helloWorldButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Hello World", for: UIControl.State.normal)
        return button
    }()
    
    lazy var helloWorldView:UIView = {
       let view = UIView()
        //view.backgroundColor = .tertiarySystemGroupedBackground
        view.layer.borderWidth = 3
        //view.layer.borderColor = CGColor.init(red: 10, green: 10, blue: 10, alpha: 1)
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        view.layer.cornerRadius = 20
        return view
    }()
    
    //
    lazy var helloWorldTextField:UITextField = {
       let tf = UITextField()
        return tf
    }()
    
    // MARK: Life Cycle functions
    
    override func viewDidLoad() {
        // view가 실행 될때 믿에 함수가 실행된다.
        super.viewDidLoad()
        // xcode 콘솔화면에 띄우기
        //print("viewDidLoad")
        configureViewComponent()
        self.hideKeyboardWhenTappedAround()
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        //버튼을 눌렀을때도 키보드가 사라지게 할수 있다.
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
    }
    
    // 키보드를 사라지게 하는 함수!!
//    @objc func dismissKeyboard(){
//        //키보드가 사라지게 하기위한 코드
//        view.endEditing(true)
//    }
    
    
    
    // 생김새 뷰를 담당하는 함수 따로정리
    // MARK: Configures
    func configureViewComponent() {
        // self는 생략가능하고, RootViewController = UIViewController(화면View)를 의미
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(helloWorldLabel)
        helloWorldLabel.translatesAutoresizingMaskIntoConstraints = false
        //helloworldLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        //helloworldLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        // 센터 X,Y축과 View의 X,Y의 축을 동일시 하게 설정
        helloWorldLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        helloWorldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(helloWorldButton)
        helloWorldButton.translatesAutoresizingMaskIntoConstraints = false
        helloWorldButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        helloWorldButton.topAnchor.constraint(equalTo: helloWorldLabel.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(helloWorldView)
        helloWorldView.translatesAutoresizingMaskIntoConstraints = false
        helloWorldView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        helloWorldView.topAnchor.constraint(equalTo: helloWorldButton.bottomAnchor, constant: 10).isActive = true
        helloWorldView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        helloWorldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(helloWorldTextField)
        helloWorldTextField.translatesAutoresizingMaskIntoConstraints = false
        helloWorldTextField.topAnchor.constraint(equalTo: helloWorldView.topAnchor).isActive = true
        helloWorldTextField.bottomAnchor.constraint(equalTo: helloWorldView.bottomAnchor).isActive = true
        helloWorldTextField.leftAnchor.constraint(equalTo: helloWorldView.leftAnchor, constant: 4).isActive = true
        //right와 bottom의 제약조건을 줄때는 항상 -몇으로 설정한다.
        helloWorldTextField.rightAnchor.constraint(equalTo: helloWorldView.rightAnchor, constant: -4).isActive = true
    }
}
