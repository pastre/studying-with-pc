//
//  Pergunta.swift
//  Quizzy
//
//  Created by Bruno Pastre on 08/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import Foundation


class Pergunta{
    
    internal init(titulo: String, respostas: [String], rightIndex: Int) {
        self.titulo = titulo
        self.respostas = respostas
        self.rightIndex = rightIndex
    }
    
    
    var titulo: String!
    var respostas: [String]!
    var rightIndex: Int!
    
    
}
