//: Playground - noun: a place where people can play

import UIKit


//
//   B - C - D
//   |   |   |
//   A   E - F - G
//


class Vertex
{
    let name : String
    var parent : Vertex?
    var neighbors : [Vertex]
    
    init(name: String)
    {
        self.name = name
        self.parent = nil
        self.neighbors = [Vertex]()
    }
}

var aVertex = Vertex(name: "A")
var bVertex = Vertex(name: "B")
var cVertex = Vertex(name: "C")
var dVertex = Vertex(name: "D")
var eVertex = Vertex(name: "E")
var fVertex = Vertex(name: "F")
var gVertex = Vertex(name: "G")

aVertex.neighbors = [bVertex]
bVertex.neighbors = [aVertex, cVertex]
cVertex.neighbors = [bVertex, dVertex, eVertex]
dVertex.neighbors = [cVertex, eVertex, fVertex]
eVertex.neighbors = [cVertex, dVertex, fVertex]
fVertex.neighbors = [dVertex, eVertex, gVertex]
gVertex.neighbors = [fVertex]


func depthFirstSearch(vertex : Vertex)
{
    for neighbor in vertex.neighbors
    {
        if neighbor.parent == nil
        {
            neighbor.parent = vertex
            
            depthFirstSearch(neighbor)
        }
    }
    
    print(vertex.name)
}

depthFirstSearch(cVertex)













