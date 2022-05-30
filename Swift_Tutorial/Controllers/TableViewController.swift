//
//  TableViewController.swift
//  Swift_Tutorial
//
//  Created by JAEHEE LEE on 2022/05/30.
//

import UIKit

// Cell 등록
private let reuseableIdentifier = "cell"

class TableViewController:UITableViewController {
    //MARK: Properties, 성질
    let items = ["1","2","3","4","5","6","7","8","9","10"]
    
    
    //MARK: Init, 초기치 설정
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Table View DidLoad!!")
        
        configure()
    }
    
    
    //MARK: Configures, 환경설정
    func configure() {
        tableView.register(TableCell.self, forCellReuseIdentifier: reuseableIdentifier)
    }
}

//MARK: TableViewController Delegate and Datasource functions, extension으로 확장
//Datasource와 Delegate를 이용해서 어떻게 데이터들을 화면에 보여줄것 인지
extension TableViewController {
    // 몇개의 셀을 화면에 띄워줄 것인지 정해줘야 한다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // 몇번째 셀의 어떤 셀을 반환해줄것 인지 지정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseableIdentifier, for: indexPath)
            as! TableCell
        let item = self.items[indexPath.row]
        cell.item = item
        return cell
    }
    
    // cell의 크기지정
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 200
        } else {
            return 100
        }        
    }
}

