//
//  ViewController.swift
//  CAShapeLayerTest
//
//  Created by 紹郁 on 2024/8/13.
//

import UIKit

class ViewController: UIViewController {
    
    var signatureView: SignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // 初始化并设置 SignatureView 的框架
        signatureView = SignatureView(frame: CGRect(x: 20, y: 100, width: self.view.frame.width - 40, height: 300))
        signatureView.layer.borderWidth = 1
        signatureView.layer.borderColor = UIColor.gray.cgColor
        self.view.addSubview(signatureView)
        
        // 添加清除按钮
        let clearButton = UIButton(type: .system)
        clearButton.frame = CGRect(x: 20, y: signatureView.frame.maxY + 20, width: self.view.frame.width - 40, height: 50)
        clearButton.setTitle("清除簽名", for: .normal)
        clearButton.backgroundColor = .lightGray
        clearButton.setTitleColor(.white, for: .normal)
        clearButton.layer.cornerRadius = 5
        clearButton.addTarget(self, action: #selector(clearSignature), for: .touchUpInside)
        self.view.addSubview(clearButton)
    }
    
    
    @objc func clearSignature() {
        signatureView.clear()
    }
}

