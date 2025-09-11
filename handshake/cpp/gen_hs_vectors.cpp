// gen_hs_vectors.cpp
#include <bits/stdc++.h>
using namespace std;
int main(){
    ofstream f("hs_vectors.txt");
    for (int i=0;i<200;i++){
        int req = (rand()%5==0);
        int data = rand()%256;
        f << i << " " << req << " " << data << "\n";
    }
    f.close();
    cout << "Wrote hs_vectors.txt\n";
    return 0;
}
