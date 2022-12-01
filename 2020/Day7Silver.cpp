#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <istream>
#include <map>
using std::vector;
using std::string;
using BagMap = std::map<string, struct BagNode>;

struct BagNode
{
    bool counted;
    vector<string> contains;
    vector<BagMap::iterator> contained_by;
};

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
    BagMap bag_tree;
    std::fstream file(argv[1]);

    while (file.peek() != EOF)
    {
        string this_color { read(2, ' ', file) };
        BagNode this_node
        {
            false,
            vector<string>(),
            vector<BagMap::iterator>()
        };
        read(2, ' ', file);

        bool contains_none = file.peek() <= '0' || file.peek() >= '9';

        while (file.peek() >= '0' && file.peek() <= '9')
        {

            read(1, ' ', file);
            this_node.contains.push_back(read(2, ' ', file));
            read(1, ' ', file);
        }

        if (contains_none)
            read(1, '\n', file);

        bag_tree[this_color] = this_node;
    }

    BagMap::iterator iter;
    for (iter = bag_tree.begin(); iter != bag_tree.end(); iter++)
    {
        vector<string> &contains = iter->second.contains;
        for (string str: contains)
            bag_tree.at(str).contained_by.push_back(iter);
    }

    vector<vector<BagMap::iterator> *> to_print { &(bag_tree.find("shiny gold")->second.contained_by) };

    int count = 0;

    for (int curr = 0; curr != to_print.size(); curr++)
        for (BagMap::iterator i: *to_print[curr])
            if (! i->second.counted)
            {
                to_print.push_back(& i->second.contained_by);
                count++;
                i->second.counted = true;
            }
    std::cout << count << '\n';
}
