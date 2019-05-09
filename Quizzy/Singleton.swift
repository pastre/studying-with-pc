//
//  Singleton.swift
//  Quizzy
//
//  Created by Bruno Pastre on 08/05/19.
//  Copyright © 2019 Bruno Pastre. All rights reserved.
//

import Foundation

class PerguntaProvider{
    
    static let instance: PerguntaProvider = PerguntaProvider()
    
    let perguntas: [Pergunta] = {
        
        var perguntas:[Pergunta] = [Pergunta]()
        let titulos: [String] = ["a", "b", "c", "d"]
        let respostas: [[String]] = [["a", "b", "c", "d"], ["a1", "b1", "c1", "d1"], ["a2", "b2", "c2", "d2"], ["a3", "b3", "c3", "d3"], ]
        
        for (i, titulo) in titulos.enumerated(){
            let resp: [String] = respostas[i]
            let p: Pergunta = Pergunta(titulo: titulo, respostas: resp, rightIndex: i)
            
            perguntas.append(p)
        }
        
        return perguntas
    }()
    
    var jaMostrou: [Pergunta]!
    var aindaNaoMostrou: [Pergunta]!
    
    private init(){
        self.setupSingleton()
    }
    
    func getPergunta() -> Pergunta?{
        if self.aindaNaoMostrou.count == 0{
            return nil
        }
        let ret = self.aindaNaoMostrou.randomElement()!
        self.jaMostrou.append(ret)
        
        for (i, p) in self.aindaNaoMostrou.enumerated(){ // TODO pesquisar como fazer isso sem for, deve ter algum metodo dentro das listas
            if p.titulo == ret.titulo{
                self.aindaNaoMostrou.remove(at: i)
                break
            }
        }
        
        return ret
    }
    
    func setupSingleton(){
        self.jaMostrou = [Pergunta]()
        self.aindaNaoMostrou = self.perguntas
        // Colocar coisas que podem ser legais aqui
        
    }
    
}
