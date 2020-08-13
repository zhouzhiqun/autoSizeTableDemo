//
//  CellModel.swift
//  tableDemo
//
//  Created by zzc on 2020/8/14.
//  Copyright © 2020 zzc. All rights reserved.
//

import Foundation


class CellModel {
    
    var dtype: Int = 0
    var title: String?
    var value: String?
    
    init(_ dtype: Int, _ title: String?, _ value: String?) {
        self.dtype = dtype
        self.title = title
        self.value = value
    }
}
