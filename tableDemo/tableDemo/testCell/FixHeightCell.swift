//
//  FixHeightCell.swift
//  tableDemo
//
//  Created by zzc on 2020/8/14.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation
import UIKit

/**
 固定高度cell
 */
class FixHeightCell: BaseTableViewCell {
    
    static let height: CGFloat = 30.0
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override func setupSubview() {
        contentView.addSubview(titleLabel)
    }
    
    override func setupConstraint() {
    
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    override func bindModel(_ model: Any?) {
        
        let cellModel = model as! CellModel
        titleLabel.text = cellModel.title
    }
}
