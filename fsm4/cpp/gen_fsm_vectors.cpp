// gen_fsm_vectors.cpp
#include <bits/stdc++.h>
using namespace std;
int main(){
    ofstream f("fsm_vectors.txt");
    int pattern[16] = {0,1,1,0,0,1,0,1,1,0,1,0,0,1,1,1};
    for (int i=0;i<16;i++) f << i << " " << pattern[i] << "\n";
    f.close();
    cout << "Wrote fsm_vectors.txt\n";
    return 0;
}
