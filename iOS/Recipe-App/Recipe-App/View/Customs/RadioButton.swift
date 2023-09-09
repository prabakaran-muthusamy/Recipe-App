//
//  RadioButton.swift
//  Recipe-App
//
//  Created by Mohamed Salah on 09/09/2023.
//


import UIKit

class RadioButton: UIButton {
    var isChecked: Bool = false {
        didSet {
            updateButtonAppearance()
        }
    }
    
    private let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initButton()
    }
    
    func initButton() {
        self.backgroundColor = .clear
        self.tintColor = .clear
        self.setTitle("", for: .normal)
        updateButtonAppearance()
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        isChecked = !isChecked
        feedbackGenerator.impactOccurred()
    }
    
    func updateButtonAppearance() {
        if isChecked {
            self.setImage(UIImage(named: K.ImageAssets.savedImage)?.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            self.setImage(UIImage(named: K.ImageAssets.UnsavedImage)?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
    }
}