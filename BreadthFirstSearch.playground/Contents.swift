//
// Breadth first search
//

import Foundation

class Vertex
{
    let name : String
    var parent : Vertex?
    var level : Int?
    var neighbors : [Vertex]
    
    init(name: String)
    {
        self.name = name
        self.parent = nil
        self.level = nil
        self.neighbors = [Vertex]()
    }
}

func markLevels(startVertex startVertex : Vertex)
{
    startVertex.level = 0
    var level = 1

    var frontier : [Vertex] = [Vertex]([startVertex])
    var nextFrontier : [Vertex] = [Vertex]()

    while(frontier.isEmpty == false)
    {
        for vertex : Vertex in frontier
        {
            for neighbor in vertex.neighbors
            {
                if neighbor.level == nil
                {
                    neighbor.parent = vertex
                    neighbor.level = level
                    nextFrontier.append(neighbor)
                }
            }
        }

        frontier = nextFrontier
        nextFrontier.removeAll()

        level = level + 1
    }
}


//
//   B - C - D
//   |   |   |
//   A   E - F - G
//

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

markLevels(startVertex: cVertex)


aVertex.level
bVertex.level
cVertex.level
dVertex.level
eVertex.level
fVertex.level
gVertex.level


// shortest path from G to C

var vertex : Vertex? = gVertex

while (vertex != nil)
{
    print(vertex!.name)
    
    vertex = vertex!.parent
}
























