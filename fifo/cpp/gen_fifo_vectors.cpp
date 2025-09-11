// gen_fifo_vectors.cpp
#include <bits/stdc++.h>
using namespace std;
int main(){
    ofstream f("fifo_vectors.txt");
    for (int t=0;t<500;t++){
        int wr = (rand()%3==0);
        int rd = (rand()%4==0);
        int data = rand();
        f << t << " " << wr << " " << rd << " " << data << "\n";
    }
    f.close();
    cout << "Wrote fifo_vectors.txt\n";
    return 0;
}
