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
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "JaeHee's"
        label.font = UIFont.italicSystemFont(ofSize: 38)
        return label
    }()
    
    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.text = "ようこそ！！"
        return label
    }()
    
    lazy var loginTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "ID"
        return tf
    }()
    
    lazy var loginTextFieldView:UIView = {
       let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        view.layer.borderWidth = 2
        view.addSubview(loginTextField)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loginTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        loginTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        return view
    }()
    
    lazy var passwordTextFieldView:UIView = {
       let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        view.layer.borderWidth = 2
        view.addSubview(self.passwordTextField)
        self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        self.passwordTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        self.passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        self.passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        return view
    }()
    
    lazy var passwordTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "PW"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var loginButton:UIButton = {
        
    //let button = UIButton()
        //버튼 눌리게 만들기
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("LOGIN", for: UIControl.State.normal)
        button.layer.cornerRadius = 10
        
        //Login버튼을 눌렀을때 ScrollViewController로 이동하는 기능 만들기
        button.addTarget(self, action: #selector(loginButtonTapped), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    // MARK: Life Cycle functions
    
    override func viewDidLoad() {
        // view가 실행 될때 믿에 함수가 실행된다.
        super.viewDidLoad()
        // xcode 콘솔화면에 띄우기
        //print("viewDidLoad")
        configureViewComponent()
        self.hideKeyboardWhenTappedAround()
        self.moveViewWithKeyboard()
    }
    
    // 다크테마를 취소하면 Login view가 변하지 않을때
    // MARK: Override
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        // 디바이스의 테마가 변경될때마다 발동되어진다.
        configureColors()
    }
    
    
    // MARK: Selector
    @objc func loginButtonTapped() {
        //print("Login button tapped")
        //pushViewController - 클릭시 화면전환방식, (ScrollViewController(), animated: true) - ScrollViewController로 이동
        navigationController?.pushViewController(ScrollViewController(), animated: true)
    
    }

    
    // 생김새 뷰를 담당하는 함수 따로정리
    // MARK: Configures
    func configureColors() {
        // view가 어두운테마일때
        if self.traitCollection.userInterfaceStyle == .dark {
            loginButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
            loginButton.backgroundColor = .white
        // view가 밝은 테마일때
        } else {
            loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            loginButton.backgroundColor = .black
        }
            
    }
    
    
    func configureViewComponent() {
        // self는 생략가능하고, RootViewController = UIViewController(화면View)를 의미
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    
        view.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(loginTextFieldView)
        loginTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        loginTextFieldView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50).isActive = true
        loginTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextFieldView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        loginTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
        view.addSubview(passwordTextFieldView)
        passwordTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldView.topAnchor.constraint(equalTo: loginTextFieldView.bottomAnchor, constant: 20).isActive = true
        passwordTextFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextFieldView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
    
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 40).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        configureColors()
    }
}
