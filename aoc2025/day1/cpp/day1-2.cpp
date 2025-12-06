#include <iostream>
#include <fstream>
#include <sstream>

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

    string line;
    char direction;
    int turns;
    int dial = 50;
    int dialAfter = 50;
    int timesAtZero = 0;

    while (getline(f, line)) {
        // skip blank lines
        if (line.find_first_not_of(" \t\r\n") == string::npos) continue;

        istringstream iss(line);
        if (!(iss >> direction >> turns)) {
            cerr << "Malformed line (expected direction and turns): '" << line << "'" << endl;
            continue;
        }


        if (direction == 'L') {
            dialAfter = (dial - turns + 100) % 100;
            if (dial > dialAfter) {
                if (dialAfter <= 0) {
                    timesAtZero++;
                }
            }
        } else if (direction == 'R') {
            dialAfter = (dial + turns) % 100;
            if (dialAfter < dial) {
                if (dialAfter <= 0) {
                    timesAtZero++;
                }
            }
        } else {
            cerr << "Unknown direction: '" << direction << "'" << endl;
            continue;
        }

        dial = dialAfter;

        int rotations = turns / 100;
        timesAtZero += rotations;
    }

    cout << "times at zero: " << timesAtZero << endl;

    return 0;
}

