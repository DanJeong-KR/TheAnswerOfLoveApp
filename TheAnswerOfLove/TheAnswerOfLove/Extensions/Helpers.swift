//
//  Extensions.swift
//  LoveTest
//
//  Created by chang sic jung on 04/07/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

// MARK: - Helper extensions
public func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}


extension CGPoint {
    
    init(vector: CGVector) {
        self.init(x: vector.dx, y: vector.dy)
    }
    
    var normalized: CGPoint {
        return CGPoint(x: x / magnitude, y: y / magnitude)
    }
    
    var magnitude: CGFloat {
        return CGFloat(sqrtf(powf(Float(x), 2) + powf(Float(y), 2)))
    }
    
    static func areInSameTheDirection(_ p1: CGPoint, p2: CGPoint) -> Bool {
        
        func signNum(_ n: CGFloat) -> Int {
            return (n < 0.0) ? -1 : (n > 0.0) ? +1 : 0
        }
        
        return signNum(p1.x) == signNum(p2.x) && signNum(p1.y) == signNum(p2.y)
    }
    
}

extension CGVector {
    
    init(point: CGPoint) {
        self.init(dx: point.x, dy: point.y)
    }
    
}

extension Array where Element: Equatable {
    
    func arrayByRemoveObjectsInArray(_ array: [Element]) -> [Element] {
        return Array(self).filter() { element in !array.contains(element) }
    }
    
}
