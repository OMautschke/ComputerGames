#include <iostream>
#include "AStar_student.h"


int main()
{
	AStar pathSearch;

	if ( pathSearch.computePath() )
	{
		pathSearch.printPath();
	}
	else
	{
		std::cout << "Error while computing the path" << std::endl;
	}
	return 0;
}