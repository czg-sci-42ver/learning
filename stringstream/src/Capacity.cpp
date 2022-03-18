#include <iomanip>
#include <iostream>
#include <string>
#include <vector>

int
main()
{
  // std::string input = "[test czg czg";
  std::string input =
    "[ [-0.252, 0.232], [0.252, -0.232], [-0.252, -0.232], [-0.252, 0.232] ]";
  std::string error_return;
  std::stringstream input_ss(input);
  // while (input_ss) {
  // }
  // while (!!input_ss) {
  // }
  std::vector<std::vector<float>> result;

  // std::stringstream input_ss(input);
  int depth = 0;
  std::vector<float> current_vector;
  while (!!input_ss && !input_ss.eof()) {
    switch (input_ss.peek()) {
      case EOF:
        break;
      case '[':
        depth++;
        if (depth > 2) {
          error_return = "Array depth greater than 2";

          for (int i = 0; i < result.size(); i++) {
            std::cout << " czg_test " << i << '\n' << std::endl;
            for (auto& item : result.at(0)) {
              std::cout << " czg_test " << item << '\n' << std::endl;
            }
          }
        }
        input_ss.get();
        current_vector.clear();
        break;
      case ']':
        depth--;
        if (depth < 0) {
          error_return = "More close ] than open [";
          for (int i = 0; i < result.size(); i++) {
            std::cout << " czg_test " << i << '\n' << std::endl;
            for (auto& item : result.at(0)) {
              std::cout << " czg_test " << item << '\n' << std::endl;
            }
          }
        }
        input_ss.get();
        if (depth == 1) {
          result.push_back(current_vector);
          for (const auto& item : current_vector) {
            std::cout << " czg_test "
                      << "push "
                      << "current_vector " << item << '\n'
                      << std::endl;
          }
        }
        break;
      case ',':
      case ' ':
      case '\t':
        input_ss.get();
        break;
      default: // All other characters should be part of the numbers.
        if (depth != 2) {
          std::stringstream err_ss;
          err_ss << "Numbers at depth other than 2. Char was '"
                 << char(input_ss.peek()) << "'.";
          error_return = err_ss.str();
          for (int i = 0; i < result.size(); i++) {
            std::cout << " czg_test " << i << '\n' << std::endl;
            for (auto& item : result.at(0)) {
              std::cout << " czg_test " << item << '\n' << std::endl;
            }
          }
        }
        float value;
        input_ss >> value;
        if (!!input_ss) {
          current_vector.push_back(value);
          for (const auto& item : current_vector) {
            std::cout << " czg_test "
                      << "current_vector" << item << '\n'
                      << std::endl;
          }
        }
        break;
    }
  }

  if (depth != 0) {
    error_return = "Unterminated vector string.";
  } else {
    error_return = "";
  }

  for (int i = 0; i < result.size(); i++) {
    std::cout << " czg_test " << i << '\n' << std::endl;
    for (auto& item : result.at(i)) {
      std::cout << " czg_test " << item << '\n' << std::endl;
    }
  }
}