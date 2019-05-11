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
        var ret: [RoundedView] = [RoundedView]()
        for i in 0...3{
            let view = RoundedView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.optionId = i
            ret.append(view)
        }
        return ret
    }()
    
    var questions: [String]!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit(){
        self.setupPerguntas()
//        self.backgroundColor = #colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)
    }
    
    func updateGestures(enabled: Bool){
        
        for view in self.views{
            for gesture in view.gestureRecognizers!{
                gesture.isEnabled = enabled
            }
        }
    }
    
    func disableTouch(){
        self.updateGestures(enabled: false)
    }
    
    func enableTouch(){
        self.updateGestures(enabled: true)
    }
    
    func updatePerguntas(){
        for (i, titulo) in self.questions.enumerated(){
            let view = self.views[i]
            view.titleLabel.text = titulo
            view.numberLabel.text = "\(i + 1)."
        }
    }
    
    func setupPerguntas(){
        for view in views{
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        for (i, view) in views.enumerated(){
            let mult = CGFloat(i) * view.frame.height
            view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            
            if i == 0{
                view.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            }else{
                let viewOnTop = self.views[i - 1]
//                view.anchor
                view.topAnchor.constraint(equalTo: viewOnTop.bottomAnchor, constant: 20).isActive = true
                
            }
            
            view.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
            
            
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
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
