#include <iostream>

using namespace std;

int main(int argc, const char * argv[]) {
    int rectangle[4][2]{0};

    
    for(int i = 0; i < 3; i++)
        for(int j = 0; j < 2; j++)
            cin >> rectangle[i][j];
    
    int row = 0;
    for(int col = 0; col < 2; col++) {
        if(rectangle[row][col] == rectangle[row+1][col]) rectangle[3][col] = rectangle[row+2][col];
        else if(rectangle[row][col] == rectangle[row+2][col])
            rectangle[3][col] = rectangle[row+1][col];
        else
            rectangle[3][col] = rectangle[row][col];
    }
    
    cout << rectangle[3][0] << " " << rectangle[3][1] <<'\n';
    return 0;
}
