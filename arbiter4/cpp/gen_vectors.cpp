// gen_vectors.cpp - simple vector generator for arbiter
#include <bits/stdc++.h>
using namespace std;
int main(){
    ofstream f("vectors.txt");
    int ptr = 0;
    for (int t=0;t<200;t++){
        int req = 0;
        for (int i=0;i<4;i++) if (rand()%4==0) req |= (1<<i);
        f << t << " " << (req & 8 ? 1:0) << " " << (req & 4 ? 1:0) << " " << (req & 2 ? 1:0) << " " << (req & 1 ? 1:0) << "\n";
    }
    f.close();
    cout << "Wrote vectors.txt\n";
    return 0;
}
