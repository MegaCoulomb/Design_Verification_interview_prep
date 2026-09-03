# matrix_rot_solution.py
def rotate90(m):
    n = len(m)
    for i in range(n//2):
        for j in range(i, n-1-i):
            m[i][j], m[j][n-1-i], m[n-1-i][n-1-j], m[n-1-j][i] = m[n-1-j][i], m[i][j], m[j][n-1-i], m[n-1-i][n-1-j]
if __name__=='__main__':
    m=[[1,2,3],[4,5,6],[7,8,9]]; rotate90(m); print(m)
