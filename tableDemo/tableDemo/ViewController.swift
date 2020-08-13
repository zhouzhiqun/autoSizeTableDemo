//
//  ViewController.swift
//  tableDemo
//
//  Created by zzc on 2020/8/14.
//  Copyright © 2020 zzc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    lazy var dataSource: [[CellModel]] = {
        var arr: [[CellModel]] = []
        
        var tmp1: [CellModel] = []
        let cmodel1 = CellModel(0, "hhhhh",  "1")
        let cmodel2 = CellModel(1, "hhhhhddddddddddddddd",  "2")
        let cmodel3 = CellModel(2, "hhhhhdddddddddddddddddddddddddddddddddddddddddddddddddddddddd",  "3")
        tmp1.append(cmodel1)
        tmp1.append(cmodel2)
        tmp1.append(cmodel3)
        
        
        var tmp11: [CellModel] = []
        let cmodel11 = CellModel(0, "hhhhh",  "11")
        let cmodel12 = CellModel(1, "hhhhhddddddddddddddd",  "22")
        let cmodel13 = CellModel(2, "hhhhhdddddddddddddddddddddddddddddddddddddddddddddddddddddddd",  "33")
        tmp11.append(cmodel11)
        tmp11.append(cmodel12)
        tmp11.append(cmodel13)
        
        arr.append(tmp1)
        arr.append(tmp11)
        return arr
    }()
    
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        tableView.register(HeaderCell.self, forCellReuseIdentifier: String(describing: HeaderCell.self))
        tableView.register(FixHeightCell.self, forCellReuseIdentifier: String(describing: FixHeightCell.self))
        tableView.register(AutoHeightCell.self, forCellReuseIdentifier: String(describing: AutoHeightCell.self))
        
    }

    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource[section].count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cmodel = dataSource[indexPath.section][indexPath.row]
        if cmodel.dtype == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderCell.self), for: indexPath) as! HeaderCell
            cell.bindModel(cmodel)
            return cell
        } else if cmodel.dtype == 1 {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FixHeightCell.self), for: indexPath) as! FixHeightCell
            cell.bindModel(cmodel)
            return cell
        } else {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AutoHeightCell.self), for: indexPath) as! AutoHeightCell
            cell.bindModel(cmodel)
            return cell
        }
    }
    
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        /**
         UITableView.automaticDimension = -1, 返回automaticDimension， cell将自适应高度
         返回值 >= 0 的话，cell的高度为返回值
         */
        
        
        let cmodel = dataSource[indexPath.section][indexPath.row]
        if cmodel.dtype == 0 {
            if HeaderCell.show(title: cmodel.title) {
                return UITableView.automaticDimension
            } else {
                return 0.0
            }
        } else if cmodel.dtype == 1 {
        
            return FixHeightCell.height
        } else {
        
            return UITableView.automaticDimension
        }
    }
    
    
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44.0
    }
    
}

