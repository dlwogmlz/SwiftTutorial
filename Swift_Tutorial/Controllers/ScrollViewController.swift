//
//  ScrollViewController.swift
//  Swift_Tutorial
//
//  Created by JAEHEE LEE on 2022/05/28.
//  진입점 파일을 바꿀때는 SceneDelegate에서 바꾼다.

import UIKit

class ScrollViewController:UIViewController {
    
    
    // 스크롤 기능
    // MARK: Properties
    lazy var scrollView:UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .systemBackground
        v.contentSize = CGSize(width: view.frame.width, height: 2000)
        return v
    }()
    
    // 스크롤링이 제대로 되는지 확인하기 위해 라벨을 만듬
    lazy var labelOne:UILabel = {
        let label = UILabel()
        label.text = "Top"
        return label
    }()
    
    lazy var labelTwo:UILabel = {
        let label = UILabel()
        label.text = "Bottom"
        return label
    }()

    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()
    }
    
    // MARK: Configure
    func configureViewComponents() {
        view.backgroundColor = .systemBackground
        
        // 화면에 스크롤 뷰 전부를 붙여주는 코드
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // scrollView에 labelOne을 붙여준다.
        scrollView.addSubview(labelOne)
        // scrollView의 가운데 위에 붙여주는 코드
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100).isActive = true
        labelOne.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        
        // labelTwo를 scrollView바닥에 붙여주는 작업
        scrollView.addSubview(labelTwo)
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.bottomAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 1500).isActive = true
        labelTwo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }
}
