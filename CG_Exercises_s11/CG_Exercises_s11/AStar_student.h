#include <string>
#include <vector>
#include <map>
#include <algorithm>

//! Class to store graph node ellements
class Node
{
  public:
	//! Default constructor 
	//n - Node name
	//cost - node cost
	Node(std::string n, int cost) : name(n), h(cost) 
	{
		lastNode = NULL; 
		g = 0;
	}
	
	//Node name
	std::string name;
	//h - cost
	int h;
	//g - cost
	int g;
	// Parent node pointer
	Node* lastNode;
	// Map of neighbour nodes
	std::map<Node*, int> neighbors;

	//Function to insert the neighbours
	void insertNeighbor(Node* n, int cost)
	{
		neighbors.insert(std::pair<Node*,int>(n,cost));
	}
};

class AStar
{
  public:
	  	//Default constructor
		AStar();

		//Compute path (return "false" if the path cannot be found)
		bool computePath();
		//Print the computed path
		void printPath();
		//Print the open list
		void printOpenList();
  private:
	//List of all cities
	std::vector<Node> cities;

	//Start node
	Node* start;
    //Target node	
	Node* target;
	//Current node
	Node* currentNode;

	//Open list of nodes
	//Note, second parameter in the std::pair structure is the cost, used for sorting
	std::vector<std::pair<Node*, int>> openList;
	//Close list of nodes
	std::vector<Node*> closeList;

	//Sorting function, call "std::sort(openList.begin(), openList.end(), openListSort);"
	//each time when updating the open list
	struct {
		bool operator()(std::pair<Node*, int> a, std::pair<Node*, int> b)
		{
			return a.second > b.second;
		}
	} openListSort;
		
};
