//given root node
// return an array that 

/*
return array that hold the nodes of the shortest path back to given node.


[3,4,5,1,2] => shortestPath
[3, 4, 5, 2] => shortPath
[3,4,6] => shortPath


[3,4,5,1,2] => shortestPath
[3,4,5,2] => shortestPath

let visited = [3,4,6,1];


*/

function shortestPath(node){
  let shortestPath = [];

  for(let i = 0; i < node.outEdges.length; i++){
    let currPath = recursiveHelper
  }
}

function recursiveHelper(node, target, path){
  path.push(node);
  if (node === target) return path;
  let bestPath = [];

  for(let i = 0; i < node.outNodes.length ; i++){
    let currPath = recursiveHelper(node.outEdges[i], target, path);
    if(bestPath.length === 0){
      bestPath = currPath;
    } else if (bestPath.length > currPath){
      bestPath = currPath;
    }
  }
  path.pop();

  return [...path, node, ...bestPath];
}

/*
way fair



// project questions
//general algs

*/