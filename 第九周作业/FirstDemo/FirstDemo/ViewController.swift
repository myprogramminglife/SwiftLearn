//
//  ViewController.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/12/12.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import Vision

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var model = Inceptionv3()
    var result: ARHitTestResult!
    var requests = [VNRequest]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        regiterGestureRecognizers()
        
    }
    
    func regiterGestureRecognizers(){
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapped))
        
        self.sceneView.addGestureRecognizer(tapGes)
    }
    
    @objc func tapped(recognizer: UIGestureRecognizer){
        let sceneView = recognizer.view as! ARSCNView
        let touchLocation = self.sceneView.center
        guard let currentFrame = sceneView.session.currentFrame else { return }
        
        let results = sceneView.hitTest(touchLocation, types: .featurePoint)
        if results.isEmpty {
            return
        }
        
        guard let result = results.first else { return }
        
        self.result = result
        let buffer = currentFrame.capturedImage
        perfomVisionRequest(pixelBuffer: buffer)
    }
    
    func perfomVisionRequest(pixelBuffer: CVPixelBuffer){
        
        let visionModel = try! VNCoreMLModel(for: self.model.model)
        
        let request = VNCoreMLRequest(model: visionModel) { request, error in
            
            if error != nil { return }
            guard let observations = request.results else { return }
            let observation = observations.first as! VNClassificationObservation
            
            print("Name \(observation.identifier) and confidence is \(observation.confidence)")
            
            DispatchQueue.main.async {
                self.displayPredictions(text: observation.identifier)
            }
        }
        
        request.imageCropAndScaleOption = .centerCrop
        self.requests = [request]
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .upMirrored, options: [:])
        
        DispatchQueue.global().async {
            try! imageRequestHandler.perform(self.requests) 
        }
    }
    
   
    func createText(text: String) -> SCNNode {
        let parentNode = SCNNode()
     
        let sphere = SCNSphere(radius: 0.01)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIColor.orange
        sphere.firstMaterial = sphereMaterial

        let sphereNode = SCNNode(geometry: sphere)
        let textGeo = SCNText(string: text, extrusionDepth: 0)
        textGeo.alignmentMode = kCAAlignmentCenter
        textGeo.firstMaterial?.diffuse.contents = UIColor.orange
        textGeo.firstMaterial?.specular.contents = UIColor.white
        textGeo.firstMaterial?.isDoubleSided = true
        textGeo.font = UIFont(name: "Futura", size: 0.15)
        
        let textNode = SCNNode(geometry: textGeo)
        textNode.scale = SCNVector3Make(0.2, 0.2, 0.2)
        
        parentNode.addChildNode(sphereNode)
        parentNode.addChildNode(textNode)
        
        return parentNode
    }
    
    
    
    func displayPredictions(text: String){
        
        let node = createText(text: text)
        
        node.position = SCNVector3(self.result.worldTransform.columns.3.x,
                                   self.result.worldTransform.columns.3.y,
                                   self.result.worldTransform.columns.3.z) // 把模型展示在我們點擊作用的當前位置（中央）
        
        self.sceneView.scene.rootNode.addChildNode(node) // 把ＡＲ結果展示出來
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

