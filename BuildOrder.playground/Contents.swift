//
// Determine the build order for a list of projects with dependencies
//

enum State
{
    case NotBuilt
    case Visiting
    case Built
}

class Project
{
    let name : String
    var state : State
    var dependencies : [Project]
    
    init(name: String)
    {
        self.name = name
        self.state = State.NotBuilt
        self.dependencies = [Project]()
    }
}

func orderProjects(projects : [Project]) -> [Project]
{
    var orderedProjects : [Project] = [Project]()
    
    for project in projects
    {
        if project.state != State.Built
        {
            if depthFirstSearch(rootProject: project, orderedProjects: &orderedProjects) == false
            {
                orderedProjects.removeAll()
                break
            }
        }
    }
    
    return orderedProjects
}

func depthFirstSearch(rootProject rootProject : Project, inout orderedProjects : [Project]) -> Bool
{
    if (rootProject.state == State.Visiting)
    {
        return false
    }
    
    if rootProject.state == State.NotBuilt
    {
        rootProject.state = State.Visiting

        for project in rootProject.dependencies
        {
            if depthFirstSearch(rootProject: project, orderedProjects: &orderedProjects) == false
            {
                return false
            }
        }
        
        rootProject.state = State.Built
    
        orderedProjects.append(rootProject)
    }

    return true
}


//
//   B - C - D       H
//   |   |   |       |
//   A   E - F - G   I
//

var projects : [Project] = [Project]()

var aProject = Project(name: "A")
projects.append(aProject)

var bProject = Project(name: "B")
projects.append(bProject)

var cProject = Project(name: "C")
projects.append(cProject)

var dProject = Project(name: "D")
projects.append(dProject)

var eProject = Project(name: "E")
projects.append(eProject)

var fProject = Project(name: "F")
projects.append(fProject)

var gProject = Project(name: "G")
projects.append(gProject)

var hProject = Project(name: "H")
projects.append(hProject)

var iProject = Project(name: "I")
projects.append(iProject)

bProject.dependencies = [aProject]
cProject.dependencies = [bProject, dProject, eProject]
dProject.dependencies = [fProject]
eProject.dependencies = [fProject]
fProject.dependencies = [gProject]
hProject.dependencies = [iProject]


var orderedProjects : [Project] = orderProjects(projects)

for project in orderedProjects
{
    print(project.name)
}


gProject.dependencies = [cProject]

orderProjects(projects)













