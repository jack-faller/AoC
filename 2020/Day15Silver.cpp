#include <map>
#include <iostream>

int main(int argc, char *argv[])
{
    std::map<int, int> num_turn;
    int turn = 1;

    int num = 0;
    for(int i = 0; argv[1][i] != '\0'; i++)
        if (argv[1][i] != ',')
            num *= 10, num += argv[1][i] - '0';
        else
        {
            num_turn[num] = turn;
            turn++;
            num = 0;
        }

    turn++;

    bool repeated;
    int prev_num;

    for (;turn < 30000001; num_turn[prev_num] = turn - 1, turn++)
    {
        prev_num = num;
        repeated = num_turn.count(prev_num); //contains num

        if (repeated)
            num = turn - 1 - num_turn[prev_num];
        else num = 0;
    }
    std::cout << num << '\n';
}
