#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <filesystem>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
    // open the text file (relative to this executable's working dir)
    // ifstream f("../res/sample-input.txt");
    ifstream f("../res/input.txt");

    //check if it is opened 
    if (!f.is_open()) {
        cerr << "Error opening the file" << endl;
        return 1;
    }

    string s;
    vector<long> firsts;
    vector<long> seconds;

    // read each line, parse two integers separated by whitespace and store them
    while (getline(f, s)) {
        // skip blank lines
        if (s.find_first_not_of(" \t\r\n") == string::npos) continue;

        istringstream iss(s);
        long a, b;
        if (!(iss >> a >> b)) {
            cerr << "Malformed line (expected two numbers): '" << s << "'" << endl;
            continue;
        }

        firsts.push_back(a);
        seconds.push_back(b);
    }

    // sort each vector independently
    sort(firsts.begin(), firsts.end());
    sort(seconds.begin(), seconds.end());

    // print sorted firsts then seconds
    // cout << "Sorted first numbers:" << endl;
    // for (auto v : firsts) cout << v << ' ';
    // cout << endl;

    // cout << "Sorted second numbers:" << endl;
    // for (auto v : seconds) cout << v << ' ';
    // cout << endl;

    // compute sum of absolute differences between corresponding elements
    size_t n = min(firsts.size(), seconds.size());
    long long total_diff = 0;
    for (size_t i = 0; i < n; ++i) {
        long long diff = (long long)firsts[i] - (long long)seconds[i];
        if (diff < 0) diff = -diff;
        total_diff += diff;
    }
    if (firsts.size() != seconds.size()) {
        cerr << "Warning: different vector sizes; compared " << n << " pairs" << endl;
    }
    cout << "Sum of absolute differences: " << total_diff << endl;

    f.close();
    return 0;
}