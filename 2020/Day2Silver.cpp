#include <iostream>
#include <fstream>
#include <string>

int read_int(std::fstream &file, char delim)
{
    std::string read;
    char chr;
    for (chr = file.get(); chr != delim; chr = file.get())
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
        int counted = 0;

        char counting;
        counting = file.get();
        //clear junk
        chr = file.get();
        chr = file.get();

        for (chr = file.get(); chr != EOF && chr != '\n'; chr = file.get())
            if (chr == counting)
                counted++;


        if (counted >= low && counted <= high)
            valid++;
    }
    std::cout << valid << '\n';
    return 0;
}
