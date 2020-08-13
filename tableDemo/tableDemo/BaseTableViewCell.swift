//
//  BaseTableViewCell.swift
//  swiftApp
//
//  Created by zzc on 2020/7/17.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell, XNViewProtocol {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

    // MARK: 协议方法
    func commonInit() {
        //默认
        defaultSetup()
        
        setupSubview()
        setupConstraint()
        setupEvent()
    }

    func setupSubview() {}
    
    func setupConstraint() {}
    
    func setupEvent() {}
    
    func bindModel(_ model: Any?) {}
    
    func viewHeight() -> CGFloat {
        return CGFloat(0)
    }
    
}

extension BaseTableViewCell {
    
    func defaultSetup() {
        self.backgroundColor = .white
        self.backgroundView = nil
        self.selectedBackgroundView = nil
        self.textLabel?.isHidden = true
        self.detailTextLabel?.isHidden = true
        self.selectionStyle = .none
    }
    
}
