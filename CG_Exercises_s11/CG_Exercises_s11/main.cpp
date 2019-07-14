/*
Name: Sebastian Hegmann
Fakultät : Mathematik und Informatik
Studiengang : Angewandte Informatik
Matrikelnummer : 3539941

coauthor :
	Name : Oliver Mautschke
	Fakultät : Mathematik und Informatik
	Studiengang : Angewandte Informatik
	Matrikelnummer : 3538495
*/

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