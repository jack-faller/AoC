#include <iostream>
#include <vector>
using std::vector;

int main() {
    vector<int> numbers {};
    for (std::string line; getline(std::cin, line);)
        numbers.push_back(std::stoi(line));

    for (int i = 0; i < numbers.size(); i++)
    {
        int number1 = numbers[i];
        for (int ii = i + 1; ii < numbers.size(); ii++)
        {
            int number2 = numbers[ii];
            for (int to_comp = i + 1; to_comp < numbers.size(); to_comp++)
                if (numbers[to_comp] + number1 + number2 == 2020)
                {
                    std::cout << numbers[to_comp] << '\n'
                        << number1 << '\n'
                        << number2 << '\n'
                        << numbers[to_comp] * number1 * number2 << '\n'
                    ;
                    goto done;
                }
        }
    }
done:
    return 0;
}
