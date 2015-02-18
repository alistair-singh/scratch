#include <iostream>
#include <iterator>
#include <vector>
#include <algorithm>
#include <cmath>
#include <array>

using namespace std;

int main(int, char **) {
  clog << "scratch 0a\n";

  array<short, 10> header;
  vector<int> ints;
  vector<char> out;

  istream_iterator<int> iit(std::cin);
  istream_iterator<int> eos;

  copy(iit, eos, back_inserter(ints));
  sort(begin(ints), end(ints));

  for (const auto val : ints)
  {
    size_t numOfDigits = static_cast<size_t>(ceil(log10(val)));
    ++header[numOfDigits];
  }

  for (const auto h : header)
    cout << h << endl;

  return 0;
}
