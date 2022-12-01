#include <iostream>
#include <fstream>
#include <string>

int read_int(std::fstream &file, char delim)
{
    std::string read;
    char chr;
    for (file.get(chr); chr != delim; file.get(chr))
        read.push_back(chr);

    return std::stoi(read);
}

int main(int argc, char *argv[]) 
{
    std::fstream file(argv[1], std::ios::in);

    char chr;
    int valid = 0;

    while (file.peek() != EOF)
    {
        int low = read_int(file, '-');
        int high = read_int(file, ' ');
        std::cout << low << ' ' << high << '\n';
        int counted = 0;

        char counting;
        file.get(counting);
        file.get(chr);
        file.get(chr);
        std::cout << counting << '\n';

        std::string password;
        while (file.get(chr))
            if (chr != '\n')
                password.push_back(chr);
            else
                break;

        std::cout << password << '\n';
        if (password[low - 1] == counting ^ password[high - 1] == counting)
        {
            std::cout << "yes" << '\n';
            valid++;
        }
    }
    std::cout << valid << '\n';
    return 0;
}
