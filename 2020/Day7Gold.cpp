#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <istream>
#include <map>
using std::vector;
using std::string;
using BagMap = std::map<string, struct BagNode>;

struct Bag
{
    int count;
    string color;
};

struct BagNode
{
    bool counted;
    int valency;
    vector<Bag> contains;
};

BagMap bag_tree;

int count_contents(BagMap::iterator to_count)
{
    if (to_count->second.counted)
        return to_count->second.valency;
    else
    {
        int count = 0;
        for (Bag i: to_count->second.contains)
            count += (1 + count_contents(bag_tree.find(i.color))) * i.count;
        to_count->second.valency = count;
        to_count->second.counted = true;
        return count;
    }
}

string read(int count, char read_until, std::istream &file)
{
    string out;
    char chr;
    for
    (
        file.get(chr);
        count -= chr == read_until,
            count != 0 && chr != '\n' && chr != EOF;
        file.get(chr)
    )
    {
        out.push_back(chr);
    }
    return out;
}

int main(int argc, char *argv[])
{
    std::fstream file(argv[1]);

    while (file.peek() != EOF)
    {
        string this_color { read(2, ' ', file) };
        BagNode this_node
        {
            false,
            0,
            vector<Bag>(),
        };
        read(2, ' ', file);

        bool contains_none = file.peek() <= '0' || file.peek() >= '9';
        this_node.counted = contains_none;

        while (file.peek() >= '0' && file.peek() <= '9')
        {
            int count = std::stoi(read(1, ' ', file));
            Bag to_push
            {
                count,
                read(2, ' ', file)
            };
            this_node.contains.push_back(to_push);
            read(1, ' ', file);
        }

        if (contains_none)
            read(1, '\n', file);

        bag_tree[this_color] = this_node;
    }

    std::cout << count_contents(bag_tree.find("shiny gold")) << '\n';
}
