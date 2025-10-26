#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>
#include <algorithm>
#include <unordered_map>

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

    // compute similarity score using an unordered_map frequency table (robust method)
    unordered_map<long,long> freq;
    for (auto v : seconds) ++freq[v];
    long long similarity_score = 0;
    for (auto a : firsts) {
        auto it = freq.find(a);
        if (it != freq.end()) similarity_score += (long long)it->second * (long long)a;
    }
    cout << "Similarity score: " << similarity_score << endl;

    f.close();
    return 0;
}