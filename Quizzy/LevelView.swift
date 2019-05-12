//
//  LevelView.swift
//  Quizzy
//
//  Created by Bruno Pastre on 11/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import UIKit

class LevelView: UIView {

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit(){
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
