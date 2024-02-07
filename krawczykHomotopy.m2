restart
needsPackage "NumericalAlgebraicGeometry"


-- Krawczy Test function (simplified ver for real intervals)
matrixApply = method()
matrixApply (Matrix,FunctionClosure) := (M,F) -> (matrix (apply(entries M,L->apply(L,i->F i))))

intervalEval = method(Options => {Strategy=>Substitution})
intervalEval (RingElement,Matrix) := o -> (f,X) -> (
	     if o.Strategy == Substitution then sub(f,X))


generalizedKrawczykOperator = (y,Y,Fy,DF',X) -> (
       y - Y*Fy+(id_((ring y)^(numrows y))-Y*DF')*(X-y))

krawczykOperator = method()
krawczykOperator (Matrix,Matrix,Matrix) := (F,X,y) -> (
	jac := transpose jacobian(F);
	jacInterval := matrixApply (jac,i->sub(i,X));
	midJac := matrixApply(jacInterval,i->midpoint i);
	Y := midJac^(-1);
	generalizedKrawczykOperator(transpose y,Y,transpose sub(F,y),jacInterval,transpose X)
)



intervalKrawczykOperator = method()
intervalKrawczykOperator (Matrix,Matrix,Matrix) := (F,X,y) -> (
	jac := transpose jacobian(F);
	jacInterval := matrixApply (jac,i->sub(i,X));
	midJac := matrixApply(jacInterval,i->midpoint i);
	Y := midJac^(-1);
	generalizedIntervalKrawczykOperator(transpose y,Y,transpose sub(F,sub(y,RRi)),jacInterval,transpose X)
)
intervalKrawczykOperatorNorm = method()
intervalKrawczykOperatorNorm (Matrix,Matrix,Matrix) := (F,X,y) -> (
	jac := transpose jacobian(F);
	jacInterval := matrixApply (jac,i->sub(i,X));
	midJac := matrixApply(jacInterval,i->midpoint i);
	Y := midJac^(-1);
	normCondition(transpose y,Y,transpose sub(F,sub(y,RRi)),jacInterval,transpose X)
)

generalizedIntervalKrawczykOperator = (y,Y,Fy,DF',X) -> (
       y - Y*Fy+(id_((ring y)^(numrows y))-Y*DF')*(X-y))

normCondition = (y,Y,Fy,DF',X) -> (
    maxNorm(id_((ring y)^(numrows y))-Y*DF')
    )

maxNorm = method()
maxNorm(Matrix) := M -> (
    max((norm \ flatten entries M)/(i -> right i))
    )
    


pointToInterval = method()
pointToInterval (Matrix, Point) := (F, rp) -> (
    jacOfI := transpose jacobian F;
    evalJac := evaluate(jacOfI, rp);
    Y := inverse evalJac;
    coords := coordinates rp;
    I := matrix{(coords)/(i -> interval i)};
    eqF := flatten entries F;
    u := (2.22*1e-16)^(-1/4); --machine precision
    evalF := transpose matrix {eqF/(i -> sub(i, I))};
    radii := (flatten entries(Y*evalF))/(i -> 
	u*max{abs(right i), abs(left i)});
    matrixEntries := apply(length coords, i -> 
    	interval(coords#i - radii#i,coords#i + radii#i));
    matrix {matrixEntries}
    )


predictor = method()
predictor (Matrix, Number, Number, Point) := (H, t0, t1, p) -> (
    R := ring H;
    S := coefficientRing R;
    CS := coefficientRing S;
    n := numcols H;
    (fR, fRmap) := flattenRing R;
    fH := fRmap H;
    jacH := jacobian fH;
    jacHx := transpose evaluate(sub(sub((jacH)^{1..n}, {(gens fR)_0 => t0}),S),p);
    jacHt := transpose (jacH)^{0};
    pathDerivative := sub(jacHx^(-1)*jacHt,S);
    coords := coordinates p;
    point(matrix p + (transpose evaluate(sub(pathDerivative,S), p))*(t0-t1))
    )



corrector = method(Options => {CorrectorStrategy => "absolute"})
corrector (Matrix, Number, Point) := o -> (H, t1, p) -> (
    R := ring H;
    F := polySystem transpose sub(H, {R_0 => t1});
    p = matrix p;
    iter := 0;
    if o.CorrectorStrategy == "absolute" then (
    	while norm(evaluate(F,p)) > 1e-12 do (
	    p = newton(F, point p);
	    );
    ) else if o.CorrectorStrategy == "relative" then (
        local pNew;
	relErr := 1;
        while relErr > 1e-12 do (
	    pNew = newton(F, point p);
	    relErr = norm(2, matrix pNew - matrix p) / norm(2, pNew);
	    p = pNew;
	    iter = iter+1;
	    if iter > 10 then (
		return point p;
		break
		) 
	    );
    ) else error "strategy not supported";
    point p
    )

intervalKrawczykTest = method()
intervalKrawczykTest (Matrix,Matrix,Matrix) := (F,X,y) ->
(
	I = intervalKrawczykOperator(F,X,y);
	if intervalKrawczykOperatorNorm(F,X,y) < 1/sqrt(2) then (
	    if {true} == unique apply(flatten entries I,flatten entries X,(i,j)->isSubset(i,j)) then (
		m = max flatten entries matrixApply(I,i->diameter(i)/2);
		M = max flatten entries matrixApply(X,i->diameter(i)/2);
		if m < M then true else false
	   	)
	    else false
	    )
	else false
)



krawczykHomotopy = method(Options => {CorrectorStrategy => "absolute"})
krawczykHomotopy(Matrix,Point,Number) := o -> (H, p, R) -> (

    ----- INITIAL SET UP -----
    
    -- initial radius of the interval box
    -------
    r := .1; -- what is a good radius to start?
    dt := r*R;
    
    
    -- define rings for the polynomial system
    --------
    ringH := ring H;
    S := coefficientRing ringH;
    originaldt := dt;
    

    -- set t1 from dt
    --------
    t0 := 1;
    t1 := t0 - dt;

    -- set p1 using predictor corrector method
    -------
    p0 := p;
    p1predictor := predictor(H,t0,t1,p0);
    p1 := corrector(H,t1,p1predictor, o);

    -- define a polynomial ring with a interval coefficients
    --------
    v := first flatten entries last coefficients H;
    vRing := ring v;
    coeffRing := coefficientRing vRing;
    (fR, fRmap) := flattenRing vRing;
    v = sub(v, coefficientRing fR);
    SI := RRi[gens coeffRing];
    RI := SI[gens ringH];
    


    ----- MODIFY THE SYSTEM FOR INTERVAL ARITHMETIC -----

    -- solutionPath
    -- a path connecting p0 and p1
    -- the path is translated that p0 and p1 are located at 0.
    --------
    solutionPath := pipeBox(p0, p1, t0, t1, ringH);
    optionList := apply(length gens S, i -> fR_(i+1)=>fR_(i+1) + sub(solutionPath#i, fR));
    translatedH := sub(sub(H, fR), optionList);

    -- midt
    -- the midpoint of t0 and t1 (for tighter interval arithmetic computation)
    -- the system is translated that the midt is located at 0.
    --------
    midt := (t0+t1)/2; 
    translatedH = sub(translatedH, {fR_0=>fR_0 + midt});
    
    -- intervalH
    -- substitute the translatedH into the polynomial ring of interval coefficients
    --------
    intervalH := sub(translatedH, RI);
    
    -- inputInterval
    -- centered at 0 with the radius r
    --------
    inputInterval := matrix{apply(length gens S, i -> interval(-r, r))};
    

    -- this lines are inserted for the test. should be removed.   
    KF := transpose intervalKrawczykOperator(
	sub(intervalH,{RI_0=>interval(-dt/2,dt/2)}),inputInterval,matrix origin S); 
    intervalKrawczykTest(sub(intervalH,{RI_0=>interval(-dt/2,dt/2)}),inputInterval,matrix origin S);
    intervalKrawczykOperatorNorm(sub(intervalH,{RI_0=>interval(-dt/2,dt/2)}),inputInterval,matrix origin S);

    iter := 0;
    stringList := {};
    
    
    ----- A LOOP FOR HOMOTOPY TRACKING
    while t0 > dt do (
	print (dt, iter, toRR t0, r);
    	KF = transpose intervalKrawczykOperator(
	    sub(intervalH,{RI_0=>interval(-dt/2,dt/2)}),inputInterval,matrix origin S); -- Krawczyk operator for interval homotopy
    	if intervalKrawczykTest(sub(intervalH,{RI_0=>interval(-dt/2,dt/2)}),inputInterval,matrix origin S) then 
    	(
	    -- if Krawczyk test succeeds then increase dt and r
	    -----
	    stringList = append(stringList, "draw[color=olive] ("|toString t0|","|toString log(originaldt)|")--("|toString t1|","|toString log(dt)|");");
	    originaldt = dt;
    	    dt = 3*dt;
	    r = 3*r; -- what should be the good ratio for dt & r ?
    
            t0 = t1;
    	    t1 = t0 - dt;
    
    	    p0 = p1;
	        
            p1predictor = predictor(H,t0,t1, p0);
    	    p1 = corrector(H,t1,p1predictor, o);
	    
    	    solutionPath = pipeBox(p0, p1, t0, t1, ringH);
    	    optionList = apply(length gens S, i -> fR_(i+1)=>fR_(i+1) + sub(solutionPath#i, fR));
    	    translatedH = sub(sub(H, fR), optionList);

    	    midt = (t0+t1)/2;
    	    translatedH = sub(translatedH, {fR_0=>fR_0 + midt});
    	    
	    intervalH = sub(translatedH, RI);
    	    inputInterval = matrix{apply(length gens S, i -> interval(-r, r))};
	    
	    iter = iter + 1;
	    )
    	else (
	    -- if Krawczyk test fails then decrease dt and r
	    -----
	    dt = dt* (1/3);
	    r = 1/3* r;

    	    t1 = t0 - dt;    
    
            p1predictor = predictor(H,t0,t1, p0);
    	    p1 = corrector(H,t1,p1predictor, o);

    	    solutionPath = pipeBox(p0, p1, t0, t1, ringH);
    	    optionList = apply(length gens S, i -> fR_(i+1)=>fR_(i+1) + sub(solutionPath#i, fR));
    	    translatedH = sub(sub(H, fR), optionList);

    	    midt = (t0+t1)/2;
    	    translatedH = sub(translatedH, {fR_0=>fR_0 + midt});
    	    
	    intervalH = sub(translatedH, RI);
    	    inputInterval = matrix{apply(length gens S, i -> interval(-r, r))};
    	    )
	);
    t0 = t0 + 1/3*dt;
    stringList = append(stringList, "draw[color=olive] ("|toString t0|","|toString log(dt)|")--("|toString 0|","|toString log(dt)|");");
    t1 = 0;
    p1predictor = predictor(H,t0,t1,p0);
    p1 = corrector(H,t1,p1predictor, o);
    (p1, iter+1, stringList)
    )        
    

pipeBox = (p0, p1, t0, t1, ringH) -> (
    t := first gens ringH;
    solutionPath := flatten entries((1/(t0-t1)*matrix(p0)*(t-t1)+1/(t1-t0)*matrix(p1)*(t-t0)));
    solutionPath
    )


matrixConvertToCC = method()
matrixConvertToCC (Matrix) := M -> (
    R := ring M;
    if class coefficientRing R =!= RealField then error "matrix over an incorrect ring"; 
    CR := CC[gens R];
    entriesM := flatten entries M;    
    maxDeg := max(entriesM/(i -> first degree i));
    (m, c) := coefficients M;
    m = sub(m, {R_0 => ii});
    m * sub(c, CC)
    )


matrixConvertToRR = method()
matrixConvertToRR (Matrix, Ring) := (M, ringM) -> (
    C := ring M;
    if class C =!= ComplexField then error "matrix over an incorrect ring"; 
    R := RR[gens ringM];
    entriesM := entries M;    
    M = matrix apply(entriesM, i -> 
	apply(i, j -> 
	    (sub(realPart j,R)+first((imaginaryPart j)*(gens R)))));    
    sub(M, ringM)
    )
    
    
    
    
    

predictorCC = method()
predictorCC (Matrix, Number, Number, Point) := (H, t0, t1, p) -> (
    R := ring H;
    S := coefficientRing R;
    CS := coefficientRing S;
    n := numcols H;
    (fR, fRmap) := flattenRing R;
    fH := fRmap H;
    jacH := jacobian fH;
    jacHx := transpose evaluate(sub(sub((jacH)^{1..n}, {(gens fR)_0 => t0}),S),p);
    jacHx = matrixConvertToCC jacHx;
    invjacHx := sub(matrixConvertToRR(jacHx^(-1), CS), fR);
    jacHt := transpose (jacH)^{0};
    pathDerivative := evaluateImaginary sub(invjacHx*jacHt,S);
    coords := coordinates p;
    point evaluateImaginary(matrix p + (transpose evaluate(sub(pathDerivative,S), p))*(t0-t1))
-*    tangentLine := sub(pathDerivative, R) + R_0 * sub(transpose matrix p,R);
    point{sub(sub(tangentLine, {R_0=>t0-t1}),CS)}*-
    )


correctorCC = method(Options => {CorrectorStrategy => "absolute"})
correctorCC (Matrix, Number, Point) := o -> (H, t1, p) -> (
    R := ring H;
    coeffRing := coefficientRing R;
    C := coefficientRing coeffRing;
    Ht1 := sub(H, {R_0 => t1});
    (m, c) := coefficients Ht1;
    CR := CC[gens coeffRing];
    m = sub(m, CR);
    c = matrixConvertToCC(sub(c, C));
    F := polySystem transpose(m*c);    
    ringP := ring matrix p;
    p = matrixConvertToCC(matrix p);
    iter := 0;
    if o.CorrectorStrategy == "absolute" then (
    	while norm(evaluate(F,p)) > 1e-12 do (
	    p = newton(F, point p);
	    );
    ) else if o.CorrectorStrategy == "relative" then (
        local pNew;
	relErr := 1;
        while relErr > 1e-12 do (
	    pNew = newton(F, point p);
	    relErr = norm(2, matrix pNew - matrix p) / norm(2, pNew);
	    p = pNew;
	    iter = iter+1;
	    if iter > 10 then (
		return point matrixConvertToRR(matrix p, ringP);
		break
		) 
	    );
    ) else error "strategy not supported";
    point matrixConvertToRR(matrix p, ringP)
    )
    

intervalKrawczykOperatorCC = method()
intervalKrawczykOperatorCC (Matrix,Matrix,Matrix) := (F,X,y) -> (
    	n := numcols y;
	jac := transpose((jacobian(F))^{0..n-1});
	CIR := coefficientRing ring F;
	R := RR[gens CIR];
	jacInterval := matrixApply (jac,i->sub(sub(i,X), CIR));
	midJac := matrix apply(entries jacInterval, i -> (
		apply(i, j -> (
		    	(m, c) := coefficients j;
			if m == transpose c then (
			    return 0_R;
			    ) else (
			stringm := toString m;
			use R;
			m = value stringm;
		    	c = sub(c, coefficientRing CIR);
		    	c = matrixApply(c, k -> midpoint k);
		    	first flatten entries(m*sub(c, R))
			)
		    	)
		    )
	    	)
	    );
	Y := matrixConvertToRR((matrixConvertToCC(midJac))^(-1),R);
	Y = sub(Y, CIR);
	y = sub(y, CIR);
	Fy = evaluateImaginary sub(transpose sub(F, sub(y, ring F)), CIR);
       	evaluateImaginary sub(
	    generalizedIntervalKrawczykOperatorCC(
		transpose y,Y,Fy,jacInterval,transpose X),
	    CIR)
)

intervalKrawczykOperatorNorm = method()
intervalKrawczykOperatorNorm (Matrix,Matrix,Matrix) := (F,X,y) -> (
	jac := transpose jacobian(F);
	jacInterval := matrixApply (jac,i->sub(i,X));
	midJac := matrixApply(jacInterval,i->midpoint i);
	Y := midJac^(-1);
	normCondition(transpose y,Y,transpose sub(F,sub(y,RRi)),jacInterval,transpose X)
)

evaluateImaginary = method()
evaluateImaginary(RingElement) := e -> (
    fR := first flattenRing ring e;
    degI := last degree e;
    coeffRing := coefficientRing fR;
    gensfR := gens fR;
    if length gensfR > 1 then (
	I := last gensfR;
	gensR := delete(I, gensfR);
	R := coeffRing[gensR][I];
	e = sub(e, R);
	)
    else (
	I = first gensfR;
	);
    (m, c) := coefficients e;
    Ilist := {1, I, -1, -I};
    m = matrix{apply(flatten entries m, i -> Ilist#(first(degree(i))%4))};
    m * sub(c,fR)
    )
evaluateImaginary(Matrix) := M -> matrixApply(M, i -> evaluateImaginary i)

generalizedIntervalKrawczykOperatorCC = (y,Y,Fy,DF',X) -> (
    YFy := evaluateImaginary(Y*Fy);
    YDF' = evaluateImaginary(Y*DF');
    iYDF' = id_((ring y)^(numrows y)) - YDF';
    Xy := X-y;
    iYDF'Xy := evaluateImaginary(iYDF'*Xy);
    y-YFy+iYDF'Xy
    )

normCondition = (y,Y,Fy,DF',X) -> (
    maxNorm(id_((ring y)^(numrows y))-Y*DF')
    )

maxNorm = method()
maxNorm(Matrix) := M -> (
    max((norm \ flatten entries M)/(i -> right i))
    )
    

intervalKrawczykTestCC = method()
intervalKrawczykTestCC (Matrix,Matrix,Matrix) := (F,X,y) ->
(
	I = intervalKrawczykOperatorCC(F,X,y);
	entriesI := flatten((flatten entries I)/(i -> flatten entries last coefficients i));
	entriesI = entriesI/(i -> sub(i, RRi));
    	entriesX := flatten((flatten entries X)/(i -> flatten entries last coefficients i));
	entriesX = entriesX/(i -> sub(i, RRi));	
	
        if {true} == unique apply(entriesI,entriesX,(i,j)->isSubset(i,j)) then (
	    m = max apply(entriesI,i->diameter(i)/2);
	    M = max apply(entriesX,i->diameter(i)/2);
	    if m < M then true else false
	    )
	else false
)





krawczykHomotopyCC = method(Options => {CorrectorStrategy => "absolute"})
krawczykHomotopyCC(Matrix,Point,Number) := o -> (H, p, dt) -> (

    ----- INITIAL SET UP -----
    
    -- define rings for the polynomial system
    --------
    ringH := ring H;
    S := coefficientRing ringH;
    originaldt := dt;
    

    -- set t1 from dt
    --------
    t0 := 1;
    t1 := t0 - dt;

    -- set p1 using predictor corrector method
    -------
    p0 := p;
    p1predictor := predictorCC(H,t0,t1,p0);
    p1 := correctorCC(H,t1,p1predictor, o);
    
    -- initial radius of the interval box
    -------
    r := .4; -- what is a good radius to start?

    -- define a polynomial ring with a interval coefficients
    --------
    ringF := coefficientRing ringH;
    CS := coefficientRing ringF;
    
    (fR, fRmap) := flattenRing ringH;
    CIR := RRi[gens CS];
    SI := CIR[gens ringF];
    RI := SI[gens ringH];


    ----- MODIFY THE SYSTEM FOR INTERVAL ARITHMETIC -----

    -- solutionPath
    -- a path connecting p0 and p1
    -- the path is translated that p0 and p1 are located at 0.
    --------
    solutionPath := pipeBox(p0, p1, t0, t1, ringH);
    optionList := apply(length gens S, i -> fR_(i+1)=>fR_(i+1) + sub(solutionPath#i, fR));
    translatedH := evaluateImaginary sub(sub(H, fR), optionList);

    -- midt
    -- the midpoint of t0 and t1 (for tighter interval arithmetic computation)
    -- the system is translated that the midt is located at 0.
    --------
    midt := (t0+t1)/2; 
    translatedH = sub(translatedH, {fR_0=>fR_0 + midt});
    
    -- intervalH
    -- substitute the translatedH into the polynomial ring of interval coefficients
    --------
    intervalH := sub(translatedH, RI);
    
    -- inputInterval
    -- centered at 0 with the radius r
    --------
    inputInterval := matrix{apply(length gens S, i -> interval(-r, r)+sub(first gens CS, RI)*interval(-r,r))};
    
    F := sub(intervalH, {RI_0=> interval(-dt/2,dt/2)});
    X := sub(inputInterval,CIR);
    y := matrix origin S;
    
    

    

    iter := 0;
    
    ----- A LOOP FOR HOMOTOPY TRACKING
    while t1 > 0 do (
	print ("(dt, #paths tracked, radius, t0) = "|toString(dt, iter, r, toRR t0));
--	print coordinates p1;
	KF = transpose intervalKrawczykOperatorCC(F, X, y); 
    	if     intervalKrawczykTestCC(F, X, y) then 
    	(
	    -- if Krawczyk test succeeds then increase dt and r
	    -----
    	    dt = 3*dt;
	    r = 3*r; -- what should be the good ratio for dt & r ?

    
            t0 = t1;
    	    t1 = t0 - dt;
    
    	    p0 = p1;
	    
	    p1predictor = predictorCC(H,t0,t1,p0);
    	    p1 = correctorCC(H,t1,p1predictor, o);
	    
	    solutionPath = pipeBox(p0, p1, t0, t1, ringH);
	    optionList = apply(length gens S, i -> fR_(i+1)=>fR_(i+1) + sub(solutionPath#i, fR));
    	    translatedH = evaluateImaginary sub(sub(H, fR), optionList);
	    

    	    midt = (t0+t1)/2;
    	    translatedH = sub(translatedH, {fR_0=>fR_0 + midt});
    	    
	    intervalH = sub(translatedH, RI);
	    inputInterval = matrix{apply(length gens S, i -> interval(-r, r)+sub(first gens CS, RI)*interval(-r,r))};
	    
	    F = sub(intervalH, {RI_0=> interval(-dt/2,dt/2)});
	    X = sub(inputInterval,CIR);
    	    y = matrix origin S;

	    iter = iter + 1;
	    )
    	else (
	    -- if Krawczyk test fails then decrease dt and r
	    -----
	    dt = dt* (1/3);
	    r = 1/3* r;

    	    t1 = t0 - dt;    
    
	    p1predictor = predictorCC(H,t0,t1,p0);
    	    p1 = correctorCC(H,t1,p1predictor, o);
    	    
	    solutionPath = pipeBox(p0, p1, t0, t1, ringH);
	    optionList = apply(length gens S, i -> fR_(i+1)=>fR_(i+1) + sub(solutionPath#i, fR));
    	    translatedH = evaluateImaginary sub(sub(H, fR), optionList);


    	    midt = (t0+t1)/2;
    	    translatedH = sub(translatedH, {fR_0=>fR_0 + midt});
	        	    
	    intervalH = sub(translatedH, RI);
	    inputInterval = matrix{apply(length gens S, i -> interval(-r, r)+sub(first gens CS, RI)*interval(-r,r))};

	    F = sub(intervalH, {RI_0=> interval(-dt/2,dt/2)});
	    X = sub(inputInterval,CIR);
    	    y = matrix origin S;

    	    )
	);
    t0 = t0 + 1/3*dt;
    t1 = 0;
    p1predictor = predictorCC(H,t0,t1,p0);
    p1 = correctorCC(H,t1,p1predictor, o);
    (p1, iter+1)
    )        




krawczykHomotopyCC2 = method(Options => {CorrectorStrategy => "absolute"})
krawczykHomotopyCC2(Matrix,Point,Number) := o -> (H, p, dt) -> (

    ----- INITIAL SET UP -----
    
    -- define rings for the polynomial system
    --------
    ringH := ring H;
    S := coefficientRing ringH;
    originaldt := dt;
    

    -- set t1 from dt
    --------
    t0 := 1;
    t1 := t0 - dt;

    -- set p1 using predictor corrector method
    -------
    p0 := p;
--    p1predictor := predictorCC(H,t0,t1,p0);
--    p1 := correctorCC(H,t1,p1predictor, o);
    
    -- initial radius of the interval box
    -------
    r := .1; -- what is a good radius to start?

    -- define a polynomial ring with a interval coefficients
    --------
    ringF := coefficientRing ringH;
    CS := coefficientRing ringF;
    
    (fR, fRmap) := flattenRing ringH;
    CIR := RRi[gens CS];
    SI := CIR[gens ringF];
    RI := SI[gens ringH];


    ----- MODIFY THE SYSTEM FOR INTERVAL ARITHMETIC -----

    -- solutionPath
    -- a path connecting p0 and p1
    -- the path is translated that p0 and p1 are located at 0.
    --------
    translatedH := sub(H, fR);

    -- intervalH
    -- substitute the translatedH into the polynomial ring of interval coefficients
    --------
    intervalH := sub(translatedH, RI);
    
    -- inputInterval
    -- centered at 0 with the radius r
    --------
    p0coords := coordinates p0;
    inputInterval := matrix{apply(length gens S, i -> sub(p0coords#i, RI) + interval(-r, r)+sub(first gens CS, RI)*interval(-r,r))};
    

    F := sub(intervalH, {RI_0=> interval(t1,t0)});
    X := sub(inputInterval,CIR);
    y := matrix p0;--matrix origin S;
    
    

    

    iter := 0;
    
    ----- A LOOP FOR HOMOTOPY TRACKING
    while t1 > 0 do (
	print ("(dt, #paths tracked, radius, t0) = "|toString(dt, iter, r, toRR t0));
	KF = transpose intervalKrawczykOperatorCC(F, X, y); 
    	if     intervalKrawczykTestCC(F, X, y) then 
    	(
	    -- if Krawczyk test succeeds then increase dt and r
	    -----
    	    dt = 3*dt;
	    r = 3*r; -- what should be the good ratio for dt & r ?

    	    p0 = correctorCC(H,t1,p0, o);
    
            t0 = t1;
    	    t1 = t0 - dt;
    
	    
    translatedH = sub(H, fR);
    	    
    
    -- inputInterval
    -- centered at 0 with the radius r
    --------
    p0coords = coordinates p0;
    inputInterval = matrix{apply(length gens S, i -> sub(p0coords#i, RI) + interval(-r, r)+sub(first gens CS, RI)*interval(-r,r))};
    
    F = sub(intervalH, {RI_0=> interval(t1,t0)});
    X = sub(inputInterval,CIR);
    y = matrix p0;--matrix origin S;

	    iter = iter + 1;
	    )
    	else (
	    -- if Krawczyk test fails then decrease dt and r
	    -----
	    dt = dt* (1/3);
	    r = 1/3* r;

    	    t1 = t0 - dt;    
    

    translatedH = sub(H, fR);

    
    -- inputInterval
    -- centered at 0 with the radius r
    --------
    p0coords = coordinates p0;
    inputInterval = matrix{apply(length gens S, i -> sub(p0coords#i, RI) + interval(-r, r)+sub(first gens CS, RI)*interval(-r,r))};
    

    F = sub(intervalH, {RI_0=> interval(t1,t0)});
    X = sub(inputInterval,CIR);
    y = matrix p0;--matrix origin S;

    	    )
	);
    t0 = t0 + 1/3*dt;
    t1 = 0;
    p0 = correctorCC(H,t1,p0, o);
    (p0, iter+1)
    )        


    



end--


-- CC examples
restart
load("krawczykHomotopy.m2")

C = RR[i]
S = C[x]
R = S[t]
m = 10;
F = x^2-1+m;
v = 10;
H = matrix{{F+v*t}}
dt = 1/30
p = point{{4.358898943*i}}


krawczykHomotopyCC(H,p,dt, CorrectorStrategy => "relative")

restart
load("krawczykHomotopy.m2")


C = RR[i]
S = C[x]
R = S[t]
m = 39;
F = x^2-1+m;
v = 39;
H = matrix{{F+ v*t}};
dt = 1/30;
p = point{{8.77496*i}}

krawczykHomotopyCC(H,p,dt,CorrectorStrategy => "relative")


--parameter homotopy examples CC
restart
load("krawczykHomotopy.m2")

C = RR[i]
S = C[x,y]
R = S[t]
P = R[a,b] -- parameters
F = matrix{{x^3+y+x^2-a,x*y-a+b}}; 
startParameter = matrix{{1_R,0}}
targetParameter = matrix{{2_R,5}}
paramHomotopy = startParameter*t + (1-t)*targetParameter; -- parameter homotopy
H = sub(F,paramHomotopy)

dt = 1/20;
p = point matrix {{-.864054*i-1.06612, .458821*i-.566121}}

krawczykHomotopyCC(H,p,dt)
krawczykHomotopyCC(H,p,dt,CorrectorStrategy => "relative")
krawczykHomotopyCC2(H,p,dt,CorrectorStrategy => "relative")



-- random degree 3 example 
restart
load("krawczykHomotopy.m2")

C = RR[i]
R = RR[x_1 .. x_3]
K = {random(2,R)-1, random(2,R)+ random(1,R) -1, random(2, R) + random(2, R)-1}
sols = solveSystem K
T = {x_1^2- 1, x_2^2-1, x_3^2-1}
xs = solveSystem T


R = C[gens R]
K = K/(i -> sub(i, R))
T = T/(i -> sub(i, R))
S = R[t]
H = matrix{(random(RR)+random(1,C))*t * T + (1-t) * K}
dt = .4


k = 1;
elapsedTime results = apply(xs, p -> (
	print(k);
	sol = point matrixConvertToRR(matrix p, C);
	k = k + 1;
    	krawczykHomotopyCC(H, sol,dt, CorrectorStrategy => "relative")
	)
    )
-- 517.868 seconds.
	
averageIter = toRR sum(results/(i -> last i))/(#results)
-- 317.75 iters/path
maxIter = toRR max(results/(i -> last i))
-- 509
minIter = toRR min(results/(i -> last i))
-- 203



-- random degree 4 example 
restart
load("krawczykHomotopy.m2")

C = RR[i]
R = RR[x_1 .. x_4]
K = {random(2,R)-1, random(2,R)+ random(1,R) -1, random(2, R) + random(1, R)-1,random(2, R) + random(1, R)-1}
sols = solveSystem K
T = {x_1^2- 1, x_2^2-1, x_3^2-1, x_4^2-1}
xs = solveSystem T


R = C[gens R]
K = K/(i -> sub(i, R))
T = T/(i -> sub(i, R))
S = R[t]
H = matrix{(random(RR)+random(1,C))*t * T + (1-t) * K}
dt = .10
dt = .8

k = 1;
elapsedTime results = apply(xs, p -> (
	print(k);
	sol = point matrixConvertToRR(matrix p, C);
	k = k + 1;
    	krawczykHomotopyCC(H, sol,dt, CorrectorStrategy => "relative")
	)
    )
-- 5962.35 seconds.
	
averageIter = toRR sum(results/(i -> last i))/(#results)
-- 563.25 iters/path
maxIter = max(results/(i -> last i))
-- 1257
minIter = min(results/(i -> last i))
-- 211





-- katsura 3
restart
needsPackage "ExampleSystems"
load("krawczykHomotopy.m2")
K = katsura(3,QQ)
R = ring first K
K = K/(i -> sub(i, R))
sols = solveSystem K
S = R[t]
K = K/(i -> sub(i, S))
T = {R_0- 1, R_1^2 - 1, R_2^2 - 1}
xs = solveSystem T

C = RR[i]

R = C[gens R]
K = K/(i -> sub(i, R))
T = T/(i -> sub(i, R))
S = R[t]
H = matrix{(random(RR)+random(1,C))*t * T + (1-t) * K}
dt = .003



elapsedTime results = apply(xs, p -> (
	sol = point matrixConvertToRR(matrix p, C);
    	krawczykHomotopyCC2(H, sol,dt, CorrectorStrategy => "relative")
	)
    )
-- 150 seconds.
	
averageIter = toRR sum(results/(i -> last i))/(#results)
-- 264.25 iters/path
maxIter = toRR max(results/(i -> last i))
-- 289
miIter = toRR min(results/(i -> last i))
-- 239


-- katsura 4
restart
needsPackage "ExampleSystems"
load("krawczykHomotopy.m2")
K = katsura(4,QQ)
R = ring first K
K = K/(i -> sub(i, R))
sols = solveSystem K
S = R[t]
K = K/(i -> sub(i, S))
T = {R_0- 1, R_1^2 - 1, R_2^2-1, R_3^2 - 1}
xs = solveSystem T

C = RR[i]

R = C[gens R]
K = K/(i -> sub(i, R))
T = T/(i -> sub(i, R))
S = R[t]
H = matrix{(random(RR)+random(1,C))*t * T + (1-t) * K}
dt = .10



elapsedTime results = apply(xs, p -> (
	sol = point matrixConvertToRR(matrix p, C);
    	krawczykHomotopyCC(H, sol,dt, CorrectorStrategy => "relative")
	)
    )
-- 1505.87 secs
	
averageIter = toRR sum(results/(i -> last i))/(#results)
-- 331.75 iters/path
maxIter = max(results/(i -> last i))
-- 451
minIter = min(results/(i -> last i))
-- 233




-- katsura 5
restart
needsPackage "ExampleSystems"
load("krawczykHomotopy.m2")
K = katsura(5,QQ)
R = ring first K
K = K/(i -> sub(i, R))
sols = solveSystem K
S = R[t]
K = K/(i -> sub(i, S))
T = {R_0- 1, R_1^2 - 1, R_2^2 - 1, R_3^2 -1 , R_4^2-1}
xs = solveSystem T
p = xs#0


C = RR[i]

R = C[gens R]
K = K/(i -> sub(i, R))
T = T/(i -> sub(i, R))
S = R[t]
H = matrix{(random(RR)+random(1,C))*t * T + (1-t) * K}
dt = .10



elapsedTime results = apply(xs, p -> (
	sol = point matrixConvertToRR(matrix p, C);
    	krawczykHomotopyCC(H, sol,dt, CorrectorStrategy => "relative")
	)
    )
-- 6788.17 secs.
	
averageIter = toRR sum(results/(i -> last i))/(#results)
-- 444.75 iters/path
maxIter = max(results/(i -> last i))
-- 731
minIter = min(results/(i -> last i))
-- 311





