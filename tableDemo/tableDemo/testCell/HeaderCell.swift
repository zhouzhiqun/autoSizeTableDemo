//
//  HeaderCell.swift
//  tableDemo
//
//  Created by zzc on 2020/8/14.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

/**
 高度可能为0
 */
class HeaderCell: BaseTableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func setupSubview() {
        contentView.addSubview(titleLabel)
    }
    
    override func setupConstraint() {
        
        let topPadding = 20.0
        let leftPadding = 20.0
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(topPadding)
            make.left.equalTo(leftPadding)
            make.right.equalTo(-leftPadding)
            make.bottom.equalTo(-topPadding)
        }
    }
    
    override func bindModel(_ model: Any?) {
        
        let cellModel = model as! CellModel

        let title = cellModel.title
        titleLabel.text = title
        
        if HeaderCell.show(title: title) {
            titleLabel.isHidden = false
        } else {
            titleLabel.isHidden = true
        }
    }
}


extension HeaderCell {
    
    static func show(title: String?) -> Bool {
        return title != nil && title!.count > 0
    }
}
