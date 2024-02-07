

restart
load("~/Dropbox/Math/Clemson/certifiedHomotopy/code/krawczykHomotopy.m2")
needsPackage "ExampleSystems"
K = katsura(6,QQ)
R = ring first K
K = K/(i -> sub(i, R))
sols = solveSystem K
S = R[t]
K = K/(i -> sub(i, S))
T = {R_0- 1, R_1^2 - 1, R_2^2 - 1, R_3^2 -1 , R_4^2-1,R_5^2-1}
xs = solveSystem T
p = xs#0


C = RR[i]

R = C[gens R]
K = K/(i -> sub(i, R))
T = T/(i -> sub(i, R))
S = R[t]
H = matrix{(.106378874029861+.596935*i)*t * T + (1-t) * K}
dt = .10

p = xs#0
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o27 = ({- 4.81482e-35i + .333333, - 6.01853e-36i + 9.0278e-36, 6.01853e-36, 6.01853e-36, - 1.20371e-35i + 1.20371e-35, 2.40741e-35i + .333333}, 801)

p = xs#1
sol = point matrixConvertToRR(matrix p, C);
krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- .0102904i + .453814, .086211i - .0136499, - .0209063i - .179916, - .269876i + .0103061, .00303728i + .46336, .206679i - .00700712}, 966)


p = xs#2
sol = point matrixConvertToRR(matrix p, C);
krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({4.93038e-31i + .732554, 7.88861e-31i + .186333, - 2.12006e-30i - .00642831, 7.02579e-31i - .14604, 1.97215e-30i + .185731, - 1.57772e-30i - .0858732}, 577)


p = xs#3
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({.00139926i + .398375, - .0792433i + .0425184, .0156452i - .247474, .296271i + .0906186, - .049633i + .423125, - .183739i - .00797612}, 873)


p = xs#4
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({.0616569i + .359633, - .0491772i - .145459, .00353048i + .216671, .0507395i - .0897957, - .102579i + .127728, .0666574i + .21104}, 595)


p = xs#5
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- 6.16298e-33i + .278219, 3.08149e-33i + .223259, .162067, - 2.50371e-33i + .0866966, .0172511, 2.31112e-33i - .128384}, 497)

p = xs#6
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- .0727231i + .730286, - .0224714i - .244378, .0585062i - .0700373, .0974339i + .116445, .0537883i + .224034, - .150895i + .108794}, 573)

p = xs#7
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- .0572945i + .441089, .0454528i - .118161, - .0127042i + .137976, - .0385446i - .154685, .109418i + .165612, - .0749747i + .248714}, 619)

p = xs#8
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- 1.60237e-31i + .248097, 2.93358e-30i - .0267244, - 2.95823e-30i + .0707703, - 2.81032e-30i + .0754755, 3.05684e-30i - .0282698, - 1.41748e-31i + .2847}, 782)

p = xs#9
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({1.92593e-34i + 1, 0, 9.62965e-35i, 2.40741e-35i + 3.00927e-36, -9.62965e-35i, - 9.62965e-35i + 1.57972e-17}, 681)

p = xs#10
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({.462689, .310045, - 5.0652e-32i + .0511408, - 3.69779e-32i - .104968, 6.47112e-32i - .0788263, 2.15704e-32i + .0912641}, 1003)

p = xs#11
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({6.16298e-33i + .448781, - 1.84889e-32i + .150923, - 1.92593e-33i + .0143211, - 7.70372e-34i + .229894, 6.16298e-33i + .0829083, 9.24446e-33i - .202436}, 507)

p = xs#12
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({7.70372e-34i + .713609, - 1.15556e-33i + .0675555, - 3.85186e-34i + .22718, 1.15556e-33i - .152165, - 7.70372e-34i - .106591, 7.70372e-34i + .107216}, 531)

p = xs#13
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- .0616569i + .359633, .0491772i - .145459, - .00353048i + .216671, - .0507395i - .0897957, .102579i + .127728, - .0666574i + .21104}, 737)

p = xs#14
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({.0727231i + .730286, .0224714i - .244378, - .0585062i - .0700373, - .0974339i + .116445, - .0537883i + .224034, .150895i + .108794}, 529)

p = xs#15
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({.00331216i + .560844, - .0157509i + .0461634, .109963i + .098778, - .077502i + .329226, - .108111i - .192707, .0897449i - .0618819}, 1391)

p = xs#16
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({1.54074e-33i + .844679, 3.85186e-34i + .149629, 4.81482e-34i - .135686, - 7.70372e-34i + .117326, - 7.70372e-34i - .0960742, .0424656}, 517)

p = xs#17
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- 6.16298e-33i + .653961, - 1.54074e-32i + .281062, 2.46519e-32i - .128994, - 2.77334e-32i - .0243202, - 6.16298e-33i + .111788, 2.46519e-32i - .0665167}, 588)

p = xs#18
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- .0254077i + .697564, .0153254i - .0866749, .0359108i + .231985, - .0268845i + .186862, - .0535587i - .0850011, .0419108i - .0959532}, 785)

p = xs#19
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({.105257i + .56164, - .0228767i - .0800044, - .0149243i - .215467, - .0948999i + .252267, - .0360466i + .0973784, .116119i + .165006}, 885)

p = xs#20
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
--  o21 = ({- .00139926i + .398375, .0792433i + .0425184, - .0156452i - .247474, - .296271i + .0906186, .049633i + .423125, .183739i - .00797612}, 959)

p = xs#21
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({.0572945i + .441089, - .0454528i - .118161, .0127042i + .137976, .0385446i - .154685, - .109418i + .165612, .0749747i + .248714}, 531)

p = xs#22
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- .00331216i + .560844, .0157509i + .0461634, - .109963i + .098778, .077502i + .329226, .108111i - .192707, - .0897449i - .0618819}, 535)

p = xs#23
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({.0254077i + .697564, - .0153254i - .0866749, - .0359108i + .231985, .0268845i + .186862, .0535587i - .0850011, - .0419108i - .0959532}, 533)

p = xs#24
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({1.2326e-32i + .52047, 5.3926e-33i + .0733444, - 8.47409e-33i + .0951573, 6.16298e-33i + .130363, - 6.74075e-34i + .184478, - 6.16298e-33i - .243577}, 738)

p = xs#25
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- 7.70372e-34i + .667994, 3.85186e-34i + .126103, 1.34815e-33i + .198821, - 3.08149e-33i - .227178, 3.08149e-33i + .00657895, - 1.15556e-33i + .0616778}, 947)

p = xs#26
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({.627887, 4.69927e-32i + .151028, - 1.60237e-31i + .117012, 3.69779e-32i + .00535604, 1.72563e-31i - .239218, - 9.86076e-32i + .151878}, 606)

p = xs#27
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- 1.84889e-32i + .371496, - 9.24446e-33i + .120192, - 6.16298e-33i + .254297, 1.2326e-32i + .00448053, 1.38667e-32i + .1009, - 3.08149e-33i - .165618}, 519)

p = xs#28
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({2.02146e-30i + .246818, 4.16617e-30i + .0721306, - 5.47272e-30i - .0319915, - 5.25086e-30i - .0232371, 4.60991e-30i + .0761735, 9.36772e-31i + .283515}, 611)

p = xs#29
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({5.37411e-30i + .155614, - 1.62703e-30i + .0480633, - 1.23876e-30i + .0467723, - 1.18945e-30i + .045032, - 1.49144e-30i + .0428787, 2.83497e-30i + .239447}, 920)

p = xs#30
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({.0102904i + .453814, - .086211i - .0136499, .0209063i - .179916, .269876i + .0103061, - .00303728i + .46336, - .206679i - .00700712}, 1152)

p = xs#31
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o21 = ({- .105257i + .56164, .0228767i - .0800044, .0149243i - .215467, .0948999i + .252267, .0360466i + .0973784, - .116119i + .165006}, 599)




iters = {801, 966, 577, 873, 595, 497, 573, 619, 782, 681, 1003, 507, 531, 737, 529, 1391, 517, 588, 785, 885, 959, 531, 535, 533, 738, 947, 606, 519, 611, 920, 1152, 599}

averIters = toRR sum(iters)/32
--721.46875
maxIters = max iters
--1391
minIters = min iters
--497
