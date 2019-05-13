//
//  RoundedView.swift
//  Quizzy
//
//  Created by Bruno Pastre on 09/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit


protocol OptionDelegate{
    func onOptionSelected(new option: Int!)
}

@IBDesignable
class RoundedView: UIView {

    let bgColor = #colorLiteral(red: 0.9813041091, green: 0.9456515908, blue: 0.9077532887, alpha: 1)
    
    let numberLabel: UILabel = {
        let ret = UILabel()
        ret.text = "1."
        ret.translatesAutoresizingMaskIntoConstraints = false
        return ret
    }()
    
    let titleLabel: UILabel = {
        let ret = UILabel()
        ret.text = "testee"
        ret.translatesAutoresizingMaskIntoConstraints = false
        return ret
    }()
    
    
    var delegate: OptionDelegate?
    var optionId: Int!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.backgroundColor = self.bgColor
//        self.layer.cornerRadius = 10
        
        self.addGestureRecognizer(tapGesture)
        self.setupNumberLabel()
        self.setupTitleLabel()
        self.setupShadow()
//        print("Instanciou")
    }
    
    func clear(){
        self.backgroundColor = self.bgColor
    }
    
    func animateWrong(){
        self.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
    }
    
    func animateRight(){
        self.backgroundColor = #colorLiteral(red: 0, green: 0.831372549, blue: 0.3921568627, alpha: 1)
    }
    
    func updateData(number: Int, title: String){
        self.numberLabel.text = "\(number)"
        self.titleLabel.text = "\(title)"
    }

    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        self.delegate?.onOptionSelected(new: self.optionId)
//        self.viewController.handleOptionChanged(1)
    }
    
    
    func setupTitleLabel(){
        let font =  UIFont.init(name: "Courier", size: 18)
//        let font =  UIFont.systemFont(ofSize: 18, weight: .light)
        self.titleLabel.font = font
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textAlignment = .left
        self.addSubview(self.titleLabel)
        self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.numberLabel.trailingAnchor, constant: 1).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        self.titleLabel.topAnchor.constraint(equalTo: self.numberLabel.topAnchor).isActive = true
//        self.titleLabel.bottomAnchor.constraint(equalTo: self.numberLabel.bottomAnchor, constant: -10).isActive = true
    }
    
    func setupNumberLabel(){
        let font = UIFont.init(name: "Courier", size: 18)
        self.numberLabel.font = font
        self.numberLabel.numberOfLines = 0
        self.numberLabel.textAlignment = .left
        self.addSubview(numberLabel)
        self.numberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.numberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.numberLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.08).isActive = true
//        self.numberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
//        self.numberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20).isActive = true
    }
    
    func setupShadow(){ // TODO: Nao ta funfando
//        self.layer.cornerRadius = 15
        
//        self.layer.shadowOffset =  CGSize(width: 0, height: 1)   // CGSizeMake(0, 1)
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowRadius = 1.2
//        self.layer.shadowOpacity = 0.65
//        self.layer.cornerRadius = 1
//        self.clipsToBounds = true
//        self.layer.masksToBounds = false
//        self.layer.masksToBounds = false
//        
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = UIColor.blue.cgColor
//
//        self.layer.shadowOpacity = 1
//        self.layer.shadowOffset = CGSize(width: 10, height: 10)
//        self.layer.shadowRadius = 15
//        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        self.layer.shouldRasterize = true
    }
    
    override func layoutSubviews() {
        self.backgroundColor = self.bgColor
//        self.layer.cornerRadius = 10
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
