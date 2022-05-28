//
//  Extensions.swift
//  Swift_Tutorial
//
//  Created by JAEHEE LEE on 2022/05/15.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // 키보드 키에 반응하는 로그인 화면
    // MARK: Helpers
    func moveViewWithKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    // 셀렉터 부분에 들어갈 함수
    // MARK: Selectors
    @objc func KeyboardWillShow(notification:NSNotification) {

        // 키보드가 나타날때 키보드의 사이즈를 담는다.
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?NSValue)?.cgRectValue {
            // view.frame.origin(스마트폰 상단 시계와 와이파이 부분).y(x와 y는 일반적으로 0,0)
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func KeyboardWillHide(notification:NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
