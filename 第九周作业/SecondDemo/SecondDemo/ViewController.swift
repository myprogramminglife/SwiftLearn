//
//  ViewController.swift
//  SecondDemo
//
//  Created by 姜开棋 on 2017/12/11.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit
import CoreML
import Vision
import ImageIO

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var emotions: UILabel!
    
    var modelAge:VNCoreMLModel!
    var modelGenderNet:VNCoreMLModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let modelAgeFile = AgeNet()
        let modelGenderNetFile = GenderNet()
        self.modelAge = try! VNCoreMLModel(for: modelAgeFile.model)
        
        self.modelGenderNet = try! VNCoreMLModel(for:modelGenderNetFile.model)
        
    }
    
    @IBAction func choosePhoto(_ sender: Any) {
        self .chooseImage()
    }
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .savedPhotosAlbum
        present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let uiImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("no image selected")
        }
        
        self.imageView.image = uiImage;
        self.processImage(image: uiImage)
        self.processImageNet(image: uiImage)
    }
    
    func processImage(image:UIImage){
        let handler = VNImageRequestHandler(cgImage: image.cgImage!)
        do{
            let requestA =  VNCoreMLRequest(model: self.modelAge,completionHandler: myResultsAge)
            try handler.perform([requestA])
        }catch{
            print(error)
        }
    }
    
    func processImageNet(image:UIImage){
        let handler = VNImageRequestHandler(cgImage: image.cgImage!)
        do{
            let requestG =  VNCoreMLRequest(model: self.modelGenderNet,completionHandler: myResultsGenderNet)
            try handler.perform([requestG])
        }catch{
            print(error)
        }
        
    }
    
    func myResultsAge(request:VNRequest,error:Error?){
        guard let results = request.results as? [VNClassificationObservation] else {
            fatalError("error")
        }
        
        if let entry = results.first {
            self.age.text = String.init(format: "Age:%@ (%%%.2f)",entry.identifier,entry.confidence * 100)
        }else{
            self.age.text = "no results"
        }
    }
    
    func myResultsGenderNet(request:VNRequest,error:Error?){
        guard let results = request.results as? [VNClassificationObservation] else {
            fatalError("error")
        }
        
        if let entry = results.first {
            self.gender.text = String.init(format: "Gender:%@ (%%%.2f)",entry.identifier,entry.confidence * 100)
        }else{
            self.gender.text = "no results"
        }
    }
}

