//
//  AutoHeightCell.swift
//  tableDemo
//
//  Created by zzc on 2020/8/14.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation
import UIKit

/**
 自适应高度cell
 */
class AutoHeightCell: BaseTableViewCell {
    
    var title: String?
    
    //多行
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override func setupSubview() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
    }
    
    override func setupConstraint() {
        
        let topPadding = 10.0
        let leftPadding = 20.0
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(topPadding)
            make.left.equalTo(leftPadding)
            make.width.equalTo(200)
            make.bottom.equalTo(-topPadding)
        }
        
        valueLabel.snp.makeConstraints { make in
            make.right.equalTo(-leftPadding)
            make.centerY.equalToSuperview()
        }
    }
    
    override func bindModel(_ model: Any?) {
        
        let cellModel = model as! CellModel
        titleLabel.text = cellModel.title
        valueLabel.text = cellModel.value
    }
}

