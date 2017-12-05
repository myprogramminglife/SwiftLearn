//
//  ViewController.swift
//  ThirdDemo
//
//  Created by 姜开棋 on 2017/12/4.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var targetImageView: UIImageView!
    
    
    var session = ARSession()
    var configuration = ARWorldTrackingConfiguration()
    var isMeasuring = false // 默認是沒有在測量狀態
    
    var vectorZero = SCNVector3() // 0,0,0
    var vectorStart = SCNVector3()
    var vectorEnd = SCNVector3()
    var lines = [Line]()
    var currentLine: Line?
    var unit = LengthUnit.cenitMeter // 單位默認公分 cm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //全局追蹤的高級用法，牛逼！
        session.run(configuration, options: [.resetTracking,.removeExistingAnchors])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        session.pause()
    }
    
    func setup() {
        sceneView.delegate = self
        sceneView.session = session
        infoLabel.text = "環境初始中～"
    }
    
    @IBAction func resetButtonHandler(_ sender: UIButton) {
        
        for line in lines {
            line.remove()
        }
        lines.removeAll()
    }
    
    @IBAction func unitButtonHandler(_ sender: UIButton) {
    }
    //    點擊屏幕
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //    如果不在測量狀態的話
        if  !isMeasuring {
            reset() //
            isMeasuring = true
            targetImageView.image = UIImage(named: "GreenTarget")
        } else {
            isMeasuring = false
            
            if let line = currentLine {
                lines.append(line)
                currentLine = nil
                targetImageView.image = UIImage(named: "WhiteTarget")
            }
            
        }
    }
    
    func reset(){
        //        isMeasuring = true
        vectorStart = SCNVector3()
        vectorEnd = SCNVector3()
    }
    
    //    掃描這個世界（開始測量）
    func scanWorld(){
        //        拿取現在畫面中心點的位置
        guard let worldPosition = sceneView.worldVector(for: view.center) else {
            return
        }
        //        如果畫面上一條線都沒有？
        if  lines.isEmpty {
            infoLabel.text = "點擊畫面是試試看"
        }
        
        //        如果現在測量狀態
        if isMeasuring {
            //            設置開始節點
            if  vectorStart == vectorZero {
                vectorStart = worldPosition //  把現在的位置設為開始
                currentLine = Line(sceneView: sceneView, startVector: vectorStart, unit: unit)
            }
            
            //            設置結束的節點
            vectorEnd = worldPosition
            currentLine?.update(to: vectorEnd)
            infoLabel.text = currentLine?.distance(to: vectorEnd) ?? "..."
        }
        
    }
    
}

extension ViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
        DispatchQueue.main.async {
            self.scanWorld()
        }
        
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        
        infoLabel.text = "錯誤"
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        
        infoLabel.text = "中斷～"
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        
        infoLabel.text = "結束"
    }
    
}

