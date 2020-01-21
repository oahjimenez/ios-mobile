//
//  Bucles.swift
//  Bucles
//
//  Created by user164457 on 1/21/20.
//  Copyright © 2020 user164457. All rights reserved.
//

import Foundation

var ciudades : [String] = ["Santiago","Chillan","Mendoza"]
var valores : [String:AnyObject] = ["Sol":"Estrella" as AnyObject,"Rut":1612376 as AnyObject]

for i in ciudades.enumerated(){
    print(i)
}

for (k,v) in valores {
    print(k,v)
}

ciudades.contains("Chillan")

var tupla = ("lugares",213,true,2.34,2.34)

//let valores(direcciones,precio,activo,altura) = tupla
print(tupla)

func user(value:(String,Int,Bool,Double,Double)) {
    print("mitup",value.0)
}
user(value:tupla)

var i = 23
print(i)
