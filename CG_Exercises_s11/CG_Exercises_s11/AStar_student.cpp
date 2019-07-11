#include "AStar_student.h"
#include <iostream>


AStar::AStar()
{
	cities.push_back(Node("Frankfurt", 96));
	cities.push_back(Node("Kaiserslautern", 158));
	cities.push_back(Node("Ludwigshafen", 108));
	cities.push_back(Node("W�rzburg", 0));
	cities.push_back(Node("Heilbronn", 87));
	cities.push_back(Node("Karlsruhe", 140));
	cities.push_back(Node("Saarbr�cken", 222));

	cities[0].insertNeighbor(&cities[3], 116);
	cities[0].insertNeighbor(&cities[1], 103);

	cities[1].insertNeighbor(&cities[2], 53);
	cities[1].insertNeighbor(&cities[6], 70);
	cities[1].insertNeighbor(&cities[0], 103);

	cities[2].insertNeighbor(&cities[1], 53);
	cities[2].insertNeighbor(&cities[3], 183);

	cities[3].insertNeighbor(&cities[0], 116);
	cities[3].insertNeighbor(&cities[2], 183);
	cities[3].insertNeighbor(&cities[4], 102);

	cities[4].insertNeighbor(&cities[3], 102);
	cities[4].insertNeighbor(&cities[5], 84);

	cities[5].insertNeighbor(&cities[4], 84);
	cities[5].insertNeighbor(&cities[6], 145);

	cities[6].insertNeighbor(&cities[5], 145);
	cities[6].insertNeighbor(&cities[1], 70);

	start = &cities[6];
	target = &cities[3];
}


bool AStar::computePath()
{
	//== Your code here (you may add other functions when necessary) =====
	openList.push_back(std::pair<Node*, int>(start, start->g + start->h));
	printOpenList();

	while (true)
	{
		if (openList.empty())
		{
			std::cout << "No existing path" << std::endl;
			return false;
		}
		currentNode = openList.back().first;
		for (auto& n : openList.back().first->neighbors)
		{
			std::string name = n.first->name;
			std::cout << "Name: " << currentNode->name << std::endl;
			int g = currentNode->g + n.second;	// g: cost of the path from start
			int h = n.first->h;				// h: heuristic
			int f = g + h;

			if (openList.back().second > f)
			{
				n.first->g = g;		// g: cost of the path from start
				n.first->h = h;		// h: heuristic
				n.second = g + f;	// f: cost function
			}
			n.first->lastNode = openList.back().first;

			auto it = openList.begin();
			openList.insert(it, std::pair<Node*, int>(n.first, n.second));
		}
		closeList.push_back(currentNode);
		openList.pop_back();
		if (currentNode == target)
		{
			std::cout << "Found shortest path" << std::endl;
			return true;
		}
		std::sort(openList.begin(), openList.end(), openListSort);
		printOpenList();
	}
}

void AStar::printPath()
{
	Node* next = target;
	while (next != NULL)
	{
		std::cout << next->name.c_str() << " " << next->g << std::endl;
		next = next->lastNode;
	}
}

void AStar::printOpenList()
{
	std::vector<std::pair<Node*, int>>::iterator iter;
	for (iter = openList.begin(); iter != openList.end(); ++iter)
	{
		std::cout << iter->first->name.c_str() << " " << iter->second << std::endl;
	}
}