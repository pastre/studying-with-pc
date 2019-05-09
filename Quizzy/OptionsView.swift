//
//  OptionsView.swift
//  Quizzy
//
//  Created by Bruno Pastre on 09/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

@IBDesignable
class OptionsView: UIView {

    let views: [RoundedView] = {
        let ret: [RoundedView] = [
            RoundedView(),
            RoundedView(),
            RoundedView(),
            RoundedView(),
            ]
        
        return ret
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit(){
        self.setupPerguntas()
    }
    
    func setupPerguntas(){
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
        
        for view in views{
            
            view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            
        }
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
