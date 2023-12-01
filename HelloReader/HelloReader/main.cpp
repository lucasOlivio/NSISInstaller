#include <iostream>
#include <fstream>
#include <string>

int main() 
{
    // Open the hello.txt file and print its content
    std::ifstream inputFile("hello.txt");

    if (!inputFile.is_open()) {
        std::cerr << "Error opening hello.txt" << std::endl;
        return 1;
    }

    std::string line;
    while (std::getline(inputFile, line)) {
        std::cout << line << std::endl;
    }

    inputFile.close();

    // Wait for user input
    system("pause");

    return 0;
}
