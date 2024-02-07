

restart
load("~/Dropbox/Math/Clemson/certifiedHomotopy/code/krawczykHomotopy.m2")

C = RR[i]
R = RR[x_1 .. x_5]
K= {.92727821534567534p53*x_1^2+.58826531366445844p53*x_1-.82314737173696118p53*x_2^2+.60774778263155205p53*x_1*x_3+.69349703159203102p53*x_2*x_3+.7220644306599493p53*x_3^2+.96318695960016365p53*x_1*x_4
     +.95089413318941696p53*x_2*x_4+.40727849915521963p53*x_3*x_4+.75650810172749028p53*x_4^2+.37970301104634496p53*x_1*x_5+.22071162937468713p53*x_2*x_5+.13711457931328597p53*x_3*x_5+.19665647227173944p53*x_4*
     x_5+.52498821188804301p53*x_5^2-1,.36555736422363494p53*x_1^2+.29365917306342981p53*x_1*x_2+.48621746623236484p53e-1*x_2^2+.76008692385119325p53*x_1*x_3+.19276454501849616p53*x_2*x_3+.18709598924891924p53*
     x_3^2+.97068483481731493p53*x_1*x_4+.81815376260088157p53*x_2*x_4+.68703787629057245p53*x_3*x_4+.72533061297600598p53*x_4^2+.92143577232922436p53*x_1*x_5+.3837490506440645p53*x_2*x_5+.60037810226234722p53*
     x_3*x_5+.47578653034121565p53e-1*x_4*x_5+.54421139306996225p53*x_5^2+.66563051006233309p53*x_1+.37243798796294347p53*x_2+.68989469879841336p53e-1*x_3+.45598083575930537p53e-1*x_4+.10567334000215145p53*x_5-
     1,.88684037971519991p53*x_1^2+.50150554504814149p53*x_1*x_2+.95097353842175991p53*x_2^2+.28047416544035397p53*x_1*x_3+.39049953706065266p53*x_2*x_3+.60162980372874808p53*x_3^2+.35337787388206587p53e-1*x_1*
     x_4+.16404501548335504p53e-1*x_2*x_4+.4402120633737574p53*x_3*x_4+.90282458816756894p53e-1*x_4^2+.62651808620604643p53*x_1*x_5+.37188484235031338p53*x_2*x_5+.14155155339640957p53e-1*x_3*x_5
     +.52101119425084619p53*x_4*x_5+.42892707578104827p53*x_5^2+.75261060022163584p53*x_1+.90208547132031158p53*x_2+.38697808035255532p53*x_3+.93275643817877063p53*x_4+.74945214575500496p53*x_5+1
     ,.33101041726113323p53*x_1^2+.85736094351703929p53e-1*x_1*x_2+.16898515028676075p53*x_2^2+.22718537927698901p53*x_1*x_3+.80778510914323609p53*x_2*x_3+.82666608521972629p53*x_3^2+.36681131997331529p53*x_1*x
     _4+.47103606933829667p53*x_2*x_4+.93336702024654317p53*x_3*x_4+.74967092155313364p53*x_4^2+.13858220528852272p53*x_1*x_5+.80008322202337256p53*x_2*x_5+.28607702657457046p53*x_3*x_5+.68501615419778916p53*x_
     4*x_5+.65684043351916077p53*x_5^2+.486869687746462p53*x_1+.41969347233199117p53e-1*x_2+.62031950116617851p53*x_3+.52523646457598383p53*x_4+.9259164057063759p53*x_5-1,.96895170540670428p53e-1*x_1^2
     +.35133100543367823p53e-1*x_1*x_2+.76903663219420881p53e-1*x_2^2+.80095034066922155p53*x_1*x_3+.73001965545131275p53e-1*x_2*x_3+.89896830176775888p53*x_3^2+.98692492248432639p53*x_1*x_4
     +.41455096627563437p53*x_2*x_4+.31413098808326256p53*x_3*x_4+.19663317872402286p53*x_4^2+.71439516240775658p53*x_1*x_5+.533856981797177p53*x_2*x_5+.19049131154551546p53*x_3*x_5+.77206661752110695p53*x_4*x_
     5+.99236160881407776p53*x_5^2+.62480472408473609p53*x_1+.50329173548081652p53*x_2+.72763986016968796p53*x_3+.37679724995321195p53*x_4+.22168280864616396p53*x_5-1}
sols = solveSystem K
T = {x_1^2- 1, x_2^2-1, x_3^2-1, x_4^2-1,x_5^2-1}
xs = solveSystem T



R = C[gens R]
K = K/(i -> sub(i, R))
T = T/(i -> sub(i, R))
S = R[t]
H = matrix{(1+2*i)*t * T + (1-t) * K}
dt = .10

p = xs#0
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o18 = ({- .975797i - .334695, .243679i + .704318, - .0890772i + .965481, .248976i - 1.87525, .339335i + .0851242}, 353)




p = xs#1
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.538562i - .352458, .750082i - .856794, - 1.24927i + .496796, .662905i - 1.07684, - .878123i - .881497}, 414)



p = xs#2
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .338011i + .0564599, .201929i - 1.09379, - .359789i + .75652, .230945i - 1.28249, - .338228i - .391521}, 421)



p = xs#3
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({1.49999i + .0655052, .610777i - .420104, - .317823i - 1.56969, - .00589542i - .339008, - 1.342i + .0359487}, 661)



p = xs#4
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({1.71194i - .205086, .705698i - .649259, - .832194i - 1.52495, .0480969i - .466884, - 1.6594i + .890161}, 687)



p = xs#5
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .0473806i + .173497, 1.39591i - .339098, .742717i + .221679, .166426i - .116448, - 1.04908i + 1.27461}, 337)



p = xs#6
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.338011i + .0564599, - .201929i - 1.09379, .359789i + .75652, - .230945i - 1.28249, .338228i - .391521}, 305)



p = xs#7
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({1.05097i + .351918, - 1.14118i - .0244589, - .497592i + .532959, - .155017i + .905988, .838191i - .505372}, 955)



p = xs#8
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 1.05097i + .351918, 1.14118i - .0244589, .497592i + .532959, .155017i + .905988, - .838191i - .505372}, 297)



p = xs#9
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .540321i - .284734, 1.53841i + .376503, - 2.48734i + .392467, - 1.71015i - .286359, 1.17031i + 2.93472}, 313)



p = xs#10
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .458217i - .46565, - .401582i - .896788, .286435i + 1.13809, - .120753i - 1.06198, .150471i + 1.03417}, 341)



p = xs#11
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 1.17718i - .666915, .881214i + .202896, .530154i - .774449, - .210393i - .713209, .0255382i + 1.28675}, 416)



p = xs#12
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.0473806i + .173497, - 1.39591i - .339098, - .742717i + .221679, - .166426i - .116448, 1.04908i + 1.27461}, 507)



p = xs#13
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.806246i + 1.14129, - 1.3802i + .258888, - 1.96278i + .0880243, 2.30219i - 2.39414, - .77771i - 1.93628}, 455)



p = xs#14
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .627865i + .907395, .320957i - 1.01987, - 1.39221i - .811265, - .761508i + .927783, .327583i - 2.41083}, 345)



p = xs#15
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .538562i - .352458, - .750082i - .856794, 1.24927i + .496796, - .662905i - 1.07684, .878123i - .881497}, 803)



p = xs#16
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.975797i - .334695, - .243679i + .704318, .0890772i + .965481, - .248976i - 1.87525, - .339335i + .0851242}, 423)



p = xs#17
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .534915i - .538864, 1.58757i + .277836, 1.05889i + .547162, - 1.77429i + .234485, - .262737i + 1.14233}, 467)



p = xs#18
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({1.64435i + .25924, - 1.01476i + .110865, .679664i - 1.09787, - .878968i + 1.75129, - .0590105i - .00805908}, 347)



p = xs#19
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({1.23651i - .0345867, .153201i + .331818, - .320629i + .698751, - .316993i + 1.27301, .958431i - 1.35936}, 209)



p = xs#20
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .806246i + 1.14129, 1.3802i + .258888, 1.96278i + .0880243, - 2.30219i - 2.39414, .77771i - 1.93628}, 713)



p = xs#21
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 1.59203i + .561754, .303849i - .845288, - .634259i - 1.55291, 1.11523i + 1.84082, .369088i - .743752}, 2427)


p = xs#22
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.627865i + .907395, - .320957i - 1.01987, 1.39221i - .811265, .761508i + .927783, - .327583i - 2.41083}, 404)


p = xs#23
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.458217i - .46565, .401582i - .896788, - .286435i + 1.13809, .120753i - 1.06198, - .150471i + 1.03417}, 577)


p = xs#24
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({1.17718i - .666915, - .881214i + .202896, - .530154i - .774449, .210393i - .713209, - .0255382i + 1.28675}, 540)


p = xs#25
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 1.71194i - .205086, - .705698i - .649259, .832194i - 1.52495, - .0480969i - .466884, 1.6594i + .890161}, 5119)


p = xs#26
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 1.49999i + .0655052, - .610777i - .420104, .317823i - 1.56969, .00589542i - .339008, 1.342i + .0359487}, 543)


p = xs#27
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({1.59203i + .561754, - .303849i - .845288, .634259i - 1.55291, - 1.11523i + 1.84082, - .369088i - .743752}, 413)

p = xs#28
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 1.64435i + .25924, 1.01476i + .110865, - .679664i - 1.09787, .878968i + 1.75129, .0590105i - .00805908}, 333)

p = xs#29
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 1.23651i - .0345867, - .153201i + .331818, .320629i + .698751, .316993i + 1.27301, - .958431i - 1.35936}, 392)

p = xs#30
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.534915i - .538864, - 1.58757i + .277836, - 1.05889i + .547162, 1.77429i + .234485, .262737i + 1.14233}, 717)

p = xs#31
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.540321i - .284734, - 1.53841i + .376503, 2.48734i + .392467, 1.71015i - .286359, - 1.17031i + 2.93472}, 376)



iters = {353, 414, 421, 661, 687, 337, 305, 955, 297, 313, 341, 416, 507, 455, 345, 803, 423, 467, 347, 209, 713, 2427, 404, 577, 540, 5119, 543, 413, 333, 392, 717, 376}

averIter = 675.3125
maxIter = 5119
minIter = 209
