restart
load("krawczykHomotopy.m2")
needsPackage "NumericalAlgebraicGeometry"
n = 11; -- n<= m
--m = 2;
r = 1;

R = RR[x_(1,1)..x_(r,n)]
S = RR[y_(1,1)..y_(n,r)]

T = RR[gens R, gens S]
A = sub(diagonalMatrix(toList(1..n)),RR)--random(RR^n, RR^m)

X = sub(genericMatrix(R,n,r),T)
Y = sub(genericMatrix(S,r,n),T)
X*Y
fX = sum((flatten entries(A- X*Y))/(i -> i^2))

D = map(RR^r,RR^(n-r),0)|id_(RR^r)--|map(RR^r,RR^(n-r),0)--random(RR^r,RR^n)--id_(RR^r)|map(RR^r,RR^(n-r),0) -- random(RR^r,RR^n)
E = id_(RR^r)--random(RR^r,RR^r)--id_(RR^r)--random(RR^r,RR^r)
ptc = flatten entries(E-D*X) --- DX = E
jac = flatten entries(jacobian fX);
G = matrix{jac | ptc};
Gsq = matrix{drop(jac,-r^2) | ptc};

-- solving with SVD
vec = x -> (m := numrows x; n := numcols x; matrix flatten apply(n, j -> apply(m, i -> {x_(i,j)})))
(svals, U, Vt) = SVD A
criticalXUnscaled = apply(subsets(n,r), S -> matrix{apply(S, i -> sqrt(svals#i) * U_{i})})
criticalYUnscaled = apply(subsets(n,r), S -> matrix{apply(S, i -> sqrt(svals#i) * transpose Vt^{i})})
unscaledSolutions = apply(criticalXUnscaled, criticalYUnscaled, (x,y) -> vec x || vec transpose y)
apply(unscaledSolutions, x -> sub(G, transpose vec x))
scaledSolutions = apply(criticalXUnscaled, criticalYUnscaled, (x,y) -> (mult := inverse(D*x) * E; vec (x * mult) || vec transpose (y * transpose inverse(mult))))
assert(all(scaledSolutions, x -> norm sub(G, transpose matrix x)<1e-6))
sols = point \ scaledSolutions

-- make another problem instance
A' = matrix apply(n, i -> apply(n, j -> 1/(i+j+1)))--random(RR^n, RR^m)
fX' = sum((flatten entries(A'- X*Y))/(i -> i^2))

D' = map(RR^r,RR^(n-r),0)|id_(RR^r)--id_(RR^r)|map(RR^r,RR^(n-r),0)--random(RR^r,RR^n)
E' = id_(RR^r)--random(RR^r,RR^r)

ptc' = flatten entries(E'-D'*X)
jac' = flatten entries(jacobian fX');
F = matrix{jac' | ptc'}
Fsq = matrix{jac'_{0.. length jac' - length ptc' -1} | ptc'}

tRing = T[t]
Gsq = sub(Gsq, tRing)
Fsq = sub(Fsq, tRing)

H = Gsq*t+(1-t)*Fsq
p = point{(coordinates first sols)/(i -> realPart i)}
p = point{(coordinates last sols)/(i -> realPart i)}
R = toRR 2
elapsedTime krawczykHomotopy(H,p,R,CorrectorStrategy => "relative")
