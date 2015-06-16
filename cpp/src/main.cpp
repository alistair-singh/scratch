#include <iostream>
#include <iterator>
#include <vector>
#include <algorithm>
#include <cmath>
#include <array>

using namespace std;

int main(int, char **) {
  clog << "$<R@t<#projname> 0a\n";

  array<short, sizeof(int)> header;
  header.fill(0);

  vector<int> ints;
  vector<char> out;

  istream_iterator<int> iit(std::cin);
  istream_iterator<int> eos;

  copy(iit, eos, back_inserter(ints));
  sort(begin(ints), end(ints));

  for (const auto val : ints) {
    size_t numOfDigits = 0; 
    if (val > 0)
      numOfDigits = static_cast<size_t>(ceil((log2(val) + 1) / 8)) - 1;
    ++header[numOfDigits];
  }

  for (const auto h : header)
    cout << h << endl;

  return 0;
}
