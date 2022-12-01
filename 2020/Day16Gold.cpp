#include <iostream>
#include <fstream>
#include <istream>
#include <vector>
#include <string>
using std::vector;
using std::string;

struct feild
{
    string name;
    int nums[4];
};

void read_nums(std::istream &file, int *nums)
{
    char chr;
    nums[0] = 0;
    nums[1] = 0;
    for (int i = 0; i < 2; i++)
        while (file.get(chr), chr <= '9' && chr >= '0')
            nums[i] *= 10, nums[i] += chr - '0';
}

int main(int argc, char *argv[])
{
    std::fstream file(argv[1]);
    vector<feild> feilds;
    char chr;
    while (file.peek() != '\n')
    {
        feild f;
        while(file.get(chr), chr != ':')
            f.name += chr;
        file.get(chr);
        read_nums(file, &f.nums[0]);
        for (int i = 0; i < 3; i++) file.get(chr);
        read_nums(file, &f.nums[2]);

        feilds.push_back(f);
    }

    for (int i = 2; file.get(chr), i -= (chr == ':'), i > 0;)
        file.get(chr);
    file.get(chr);

    int sum = 0;
    int num = 0;
    while (file.peek() != EOF)
    {
        file.get(chr);
        num *= 10, num += chr - '0';
        if (file.peek() == EOF || file.peek() == '\n' || file.peek() == ',')
        {
            file.get(chr);
            bool in_range = false;
            for (feild i: feilds)
                in_range |= (num >= i.nums[0] && num <= i.nums[1]) || (num >= i.nums[2] && num <= i.nums[3]);
            if (!in_range) sum += num;

            num = 0;
        }
    }
    std::cout << sum << '\n';
}
