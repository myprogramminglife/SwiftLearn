//
//  SCNVector3 + Extension.swift
//  ARuler
//
//  Created by XerangaWang on 2017/9/7.
//  Copyright © 2017年 Johannes Ruof. All rights reserved.
//

import ARKit

extension SCNVector3 {
//    拿到鏡頭的座標
    static func positionTrasform(_ tranform: matrix_float4x4) -> SCNVector3 {
        
        return SCNVector3Make(tranform.columns.3.x, tranform.columns.3.y, tranform.columns.3.z)
    }
//    求距離
    func distance(form vector: SCNVector3) -> Float{
        
        let distanceX = self.x - vector.x
        let distanceY = self.y - vector.y
        let distanceZ = self.z - vector.z
        
        return sqrt((distanceX * distanceX) + (distanceY * distanceY) + (distanceZ * distanceZ))
//        A(x1,y1,z1),B(x2,y2,z2),则A,B之间的距离为
//        d=√[(x1-x2)^2+(y1-y2)^2+(z1-z2)^2]
    }
    
//    畫線的方法
    func line(to vector: SCNVector3, color: UIColor) -> SCNNode {
        
        let indices: [UInt32] = [0,1] // 指數 (這個 0,1 到底是啥？ homework!) 材料
// 維度
// 緯度
        //        0: 1
//        [什麼東西,打算作成什麼樣子]
// ............. ___________________________________
        
        let source = SCNGeometrySource(vertices: [self,vector]) // 創建一個幾何的容器
        
        let element = SCNGeometryElement(indices: indices, primitiveType: .line) // 創建了一個幾何元素 （一條線）
        
        let geomtry = SCNGeometry(sources: [source], elements: [element])
 
        
        
        geomtry.firstMaterial?.diffuse.contents = color
        let node = SCNNode(geometry: geomtry)
        return node
    }
}

extension SCNVector3: Equatable {
    
    public static func == (lhs: SCNVector3, rhs: SCNVector3) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y) && (lhs.z == rhs.z)
    }
}
