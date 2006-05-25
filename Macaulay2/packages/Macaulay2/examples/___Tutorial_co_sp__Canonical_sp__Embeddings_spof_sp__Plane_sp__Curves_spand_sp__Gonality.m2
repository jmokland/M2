R = ZZ/31991[a,b,c] -- the coordinate ring of P^2
ipoint1 = ideal matrix({{a,b}})
ipoint1 = ideal(a,b)
ipoint2 = ideal(a,c)
ipoint3 = ideal(b,c)
icurves1 = intersect(
ipoint1^2,
ipoint2^2,
ipoint3^2
)
Icurves1 = gens icurves1
F1 = Icurves1 * random(source Icurves1, R^{-6})
betti F1
Icurves2 = gens (ipoint1^3)
F2 = Icurves2 * random(source Icurves2, R^{-6})
betti F2
i = ideal((a-b)^2) + (ipoint1^4)
icurves3 = intersect(i, ipoint3^2)
Icurves3 = gens icurves3
F3 = Icurves3 * random(source Icurves3, R^{-6})
betti F3
can1 = basis(3, intersect(ipoint1,ipoint2,ipoint3))
target can1
source can1
can1 = can1 ** R
can1 = super can1
can2 = basis(3, ipoint1^2)
can2 = super (can2 ** R)
can3 = basis(3, intersect(ideal(a-b) + ipoint1^2, ipoint3))
can3 = super (can3 ** R)
betti  can1
betti  can2
betti  can3
S = (coefficientRing R)[x_0..x_6]
T1 = R/ideal F1
f1 = map(T1,S,substitute(can1, T1))
IC1 = mingens ker f1
T2 = R/ideal F2
f2 = map(T2,S,substitute(can2, T2))
IC2 = mingens ker f2
T3 = R/ideal F3
f3 = map(T3,S,substitute(can3, T3))
IC3 = mingens ker f3
IC1res = res(coker IC1)
betti  IC1res
IC2res = res(coker IC2)
betti  IC2res
IC3res = res(coker IC3)
betti  IC3res
IC1 = matrix entries IC1
IC1res = res(coker IC1, DegreeLimit => {1})
betti IC1res
ff1 = map(R,S,can1)
trim ideal pushForward1(ff1,coker F1)
