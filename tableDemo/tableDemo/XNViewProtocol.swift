//
//  XNViewProtocol.swift
//  swiftApp
//
//  Created by zzc on 2020/7/17.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation
import UIKit

protocol XNViewProtocol: class {
    
    func commonInit()
    
    func setupSubview()
    func setupConstraint()
    func setupEvent()
    
    //数据填充
    func bindModel(_ model: Any?)
    
    func viewHeight() -> CGFloat
}
