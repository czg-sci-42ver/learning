#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

bool
compare(std::pair<std::string, float> p1, std::pair<std::string, float> p2)
{
  return p1.second < p2.second;
}

int
main()
{
  // std::vector<std::pair<int, float>> pairs;
  std::vector<std::pair<std::string, float>> pairs;
  pairs = { { "apple", 34.785 },
            { "banana", 67.8467 },
            { "dog", 13.476 },
            { "cat", 56.486 } };
  // pairs = { { 2, -2.0 }, { 3, -4.0 } };
  // pairs = { { 1, 2.0 }, { 2, -2.0 }, { 3, -4.0 } };
  std::vector<float> a = {1.9,2.5,3.6};

  const auto p = std::max_element(
    pairs.begin(), pairs.end(), [](const auto& lhs, const auto& rhs) {
      return lhs.second < rhs.second;
    });
    int i=0;
  for (const auto& item : pairs) {
    // std::cout << " czg_test " << &pairs.at(0) << '\n' << std::endl;
    // std::cout << " czg_test " << &item << '\n' << std::endl;
    std::cout << " czg_test " << item.first << '\n' << std::endl;
    for (const auto& item: a) { 
      std::cout << " czg_test " << item << '\n' << std::endl;
    }
    i++;
    a.push_back(i);
    if (*a.end()==0) {
      continue;
    }
    else if (*a.end()==1) {
      continue;
    }
    else {
      break; // no pair output
    }
  }
  auto label = p->first;
  auto prob = p->second;

  std::cout << label << " " << prob;
}