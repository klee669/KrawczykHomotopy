
restart
load("~/Dropbox/Math/Clemson/certifiedHomotopy/code/krawczykHomotopy.m2")


C = RR[i]
R = RR[x_1 .. x_6]
--K = {random(2,R)-1, random(2,R)+ random(1,R) -1,random(2,R)+ random(1,R) -1,random(2,R)+ random(1,R) -1, random(2, R) + random(1, R)-1,random(2, R) + random(1, R)-1}
K = {.89516034850633175p53*x_1^2+.2066039676388739p53*x_1*x_2+.15757654107894437p53*x_2^2+.91119344526069401p53e-2*x_1*x_3+.60980730066697442p53*x_2*x_3+.92134845376179098p53*x_3^2+.83114526950270884p53e-1*x_
      1*x_4+.89962437416339203p53*x_2*x_4+.10231248684214278p53*x_3*x_4+.85293051303113998p53*x_4^2+.1182506130366261p53*x_1*x_5+.66761739188260805p53*x_2*x_5+.12398079960667563p53*x_3*x_5+.43245485693552921p53
      *x_4*x_5+.67887526101322204p53e-1*x_5^2+.81877685200791084p53*x_1*x_6+.26256224564366337p53*x_2*x_6+.33109296100851782p53e-1*x_3*x_6+.75806148035455467p53*x_4*x_6+.19909650030643822p53*x_5*x_6
      +.54824892402104153p53*x_6^2-1,.57143601129792276p53*x_1^2+.91842968164509275p53*x_1*x_2+.34918589836957792p53*x_2^2+.37162614398458604p53*x_1*x_3+.94680644278546444p53*x_2*x_3+.54461091589017763p53*x_3^2
      +.34347700354397015p53*x_1*x_4+.67298194749284901p53*x_2*x_4+.41680488188662546p53*x_3*x_4+.9412116236716207p53*x_4^2+.28327420067164777p53*x_1*x_5+.36897411638833832p53*x_2*x_5+.47348358930817103p53*x_3*
      x_5+.39816725929304631p53*x_4*x_5+.42475290174483848p53*x_5^2+.69762366207799154p53*x_1*x_6+.35963948438808824p53*x_2*x_6+.45965089318845775p53*x_3*x_6+.54070700567228558p53*x_4*x_6+.82542950174724861p53*
      x_5*x_6+.86833323119460348p53*x_6^2+.40757430585641308p53*x_1+.54303432319591161p53*x_2+.70296218323912185p53*x_3+.24192105742423498p53*x_4+.81805408111002453p53e-1*x_5+.29451493291195774p53*x_6-1
      ,.44417625319871856p53*x_1^2+.45035798005977312p53*x_1*x_2+.6667296100936192p53*x_2^2+.18105855476968535p53*x_1*x_3+.23947509401011868p53*x_2*x_3+.7915948947374063p53*x_3^2+.81487827773712684p53*x_1*x_4
      +.65231792071630457p53*x_2*x_4+.12954941794206365p53*x_3*x_4+.22479300546012826p53*x_4^2+.49887612446048413p53*x_1*x_5+.50535251584427976p53*x_2*x_5+.28526090604696075p53*x_3*x_5+.75098265680071552p53*x_4
      *x_5+.37292273791545771p53*x_5^2+.4858716470445561p53*x_1*x_6+.25588753806764608p53*x_2*x_6+.13385549617185655p53*x_3*x_6+.6903513052855037p53e-1*x_4*x_6+.97508383205783p53*x_5*x_6+.69726643367623009p53*x
      _6^2+.980681758635084p53*x_1+.6928525383594355p53*x_2+.59478926701695511p53*x_3+.95102906550185251p53*x_4+.10273535186130278p53*x_5+.90916870283706575p53*x_6-1,.43766375370161148p53e-2*x_1^2
      +.73605287093063843p53*x_1*x_2+.36629526743275209p53*x_2^2+.70249275348717388p53e-1*x_1*x_3+.21145912838574954p53*x_2*x_3+.52666013599334316p53*x_3^2+.93650250818597125p53*x_1*x_4+.92757707872794248p53e-1
      *x_2*x_4+.48633851579119347p53*x_3*x_4+.94951266885301422p53e-4*x_4^2+.5877162061029777p53*x_1*x_5+.80068251873128893p53*x_2*x_5+.61026792268074281p53e-1*x_3*x_5+.40375616098441169p53*x_4*x_5
      +.86150027513387062p53*x_5^2+.57401471571346108p53*x_1*x_6+.13827357360168202p53*x_2*x_6+.84576375170466533p53*x_3*x_6+.69354296622721945p53*x_4*x_6+.74481427409407952p53*x_5*x_6+.56044054993453274p53*x_6
      ^2+.98769005903653662p53*x_1+.84725990635570325p53*x_2+.95997672294973413p53*x_3+.95590682016820439p53*x_4+.31009605007835428p53*x_5+.93091083531466845p53*x_6-1,.29978757163310821p53*x_1^2
      +.18063712889127492p53*x_1*x_2+.21951181440860867p53*x_2^2+.54677595683870317p53e-1*x_1*x_3+.1440740171338194p53*x_2*x_3+.29515661350299272p53*x_3^2+.58696669840290805p53*x_1*x_4+.87652060473615179p53e-1*
      x_2*x_4+.58162829496554591p53*x_3*x_4+.50220293607608635p53*x_4^2+.79373781234844298p53*x_1*x_5+.77408551991947327p53*x_2*x_5+.79487990848958223p53*x_3*x_5+.11813861815104776p53*x_4*x_5
      +.85118059796053136p53e-1*x_5^2+.32044486431745678p53*x_1*x_6+.72690995530963765p53*x_2*x_6+.36999395945423708p53*x_3*x_6+.24389654049778264p53*x_4*x_6+.38849675184874466p53*x_5*x_6+.55690728558754865p53*
      x_6^2+.67191227973476342p53*x_1+.78083322232202357p53*x_2+.52458409627576985p53*x_3+.96426724931800745p53*x_4+.68524583891524649p53*x_5+.93701786204197757p53*x_6-1,.97438713278264777p53*x_1^2
      +.59103157746416624p53*x_1*x_2+.18745605250994035p53*x_2^2+.697282011138457p53e-1*x_1*x_3+.14082078907514117p53e-1*x_2*x_3+.85340426925979984p53e-1*x_3^2+.12349300469302049p53e-1*x_1*x_4
      +.27916067633659869p53*x_2*x_4+.21702939863699855p53*x_3*x_4+.75991046361615133p53*x_4^2+.86305464075769334p53*x_1*x_5+.66943458503835873p53e-1*x_2*x_5+.2237036183271488p53*x_3*x_5+.29266132351020147p53*x
      _4*x_5+.84375564394816527p53e-1*x_5^2+.62528085041209069p53*x_1*x_6+.72240145644192411p53*x_2*x_6+.89152897531287845p53*x_3*x_6+.80167292023264414p53*x_4*x_6+.94090884962022114p53*x_5*x_6
      +.5981800523818348p53e-1*x_6^2+.28389955130275701p53*x_1+.28972056595330931p53*x_2+.36442835206351054p53*x_3+.46156831661251585p53*x_4+.30975146406711129p53*x_5+.60182601147593495p53*x_6-1}
sols = solveSystem K
T = {x_1^2- 1, x_2^2-1, x_3^2-1, x_4^2-1,x_5^2-1,x_6^2-1}
xs = solveSystem T


R = C[gens R]
K = K/(i -> sub(i, R))
T = T/(i -> sub(i, R))
S = R[t]
H = matrix{(1+2.3*i)*t * T + (1-t) * K}
dt = .10

p = xs#0
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .518307i - 2.62441, 1.02405i + 3.00531, 3.26403i - .628863, - 2.43802i - .393984, - .861758i - .373831, .892571i - 2.97755}, 552)
--- o16 = ({.518307i - 2.62441, - 1.02405i + 3.00531, - 3.26403i - .628863, 2.43802i - .393984, .861758i - .373831, - .892571i - 2.97755}, 860)

p = xs#1
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.376208i - 1.24075, .234969i + .233478, - .74966i - 1.00429, 1.04939i - .167421, - .243893i - 1.84618, - .473874i + .472672}, 581)
--- o16 = ({- .376208i - 1.24075, - .234969i + .233478, .74966i - 1.00429, - 1.04939i - .167421, .243893i - 1.84618, .473874i + .472672}, 1581)

p = xs#2
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .376208i - 1.24075, - .234969i + .233478, .74966i - 1.00429, - 1.04939i - .167421, .243893i - 1.84618, .473874i + .472672}, 1013)
--- o16 = ({.376208i - 1.24075, .234969i + .233478, - .74966i - 1.00429, 1.04939i - .167421, - .243893i - 1.84618, - .473874i + .472672}, 1904)

p = xs#3
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.623863i - .0773709, - .0207474i + 1.32098, - .119728i - 1.51699, - .0427179i - 1.21089, .0425301i - .512174, .143372i - .348108}, 3492)

p = xs#4
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.0434388i - .892616, .512525i + .209444, .0334874i + .801635, - .0152931i - .423498, - .228121i - .374488, - .199426i + .84296}, 917)

p = xs#5
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .643604i + .661878, - .473441i - .237573, .375229i + .969804, - .444618i - .468444, .41943i + .273192, .49137i + .183181}, 896)

p = xs#6
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.493005i - .45097, - .750099i + .328881, .217918i + .555024, - .0313969i + .104458, 1.46957i - .287577, - .704514i + .728974}, 2941)

p = xs#7
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 3.77455i - 6.83017, 2.99383i - .82776, - .533679i + 3.7404, 3.68078i - 3.52087, 3.40597i + 3.75091, 2.83413i + 1.20295}, 847)

p = xs#8
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 5.14279e-39i - .566427, - 1.3959e-38i - .576331, 4.68361e-39i + 1.05114, - 1.17549e-38i + .457675, 2.05712e-38i + .393118, -.091955}, 1183)

p = xs#9
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .0971949i - .851217, - .187091i + .613691, .120721i + .795577, - .427419i - .156238, .0545307i - .203073, .248882i + .449679}, 679)

p = xs#10
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .0972407i - .342571, - 1.94357i - .102099, .446248i - 1.53574, - .910062i + 1.58367, 1.81913i - 1.88575, - 1.55359i - .578301}, 700)

p = xs#11
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .747082i - .0426053, - .504482i - 1.48643, - .77695i - .524106, .666387i + .0227646, .169071i - .667555, .943283i - .829073}, 1275)

p = xs#12
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({10.1058i - 3.74363, - 4.37657i + 1.27288, - 1.43888i - 8.36767, 4.44783i - 4.8189, - 8.53467i + 1.84219, - 2.52653i + .806761}, 2337)

p = xs#13
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .322256i - .22719, - .694458i - .400885, .327887i + 1.08386, .204368i - .509856, 1.02829i + .64628, - .492305i + .297352}, 1143)

p = xs#14
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 2.40741e-35i + 1.42946, 9.62965e-35i - 2.28155, 2.40741e-35i - 1.21304, - 1.54225e-35i + .369614, - 8.42594e-35i + 2.66076, 7.22224e-35i - 2.23233}, 367)

p = xs#15
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .668489i + .49143, 1.28894i - .254647, - .359318i - .735237, - .0563246i + .677637, .250346i + .23594, - .170398i + .412154}, 859)

p = xs#16
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.0972407i - .342571, 1.94357i - .102099, - .446248i - 1.53574, .910062i + 1.58367, - 1.81913i - 1.88575, 1.55359i - .578301}, 1493)

p = xs#17
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .383745i + .0716222, .515785i + .144232, .00818845i - .303708, - .283638i + .90823, - .19054i - .359403, .460594i + .297098}, 919)

p = xs#18
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.557886i - 1.42478, .684388i - .803871, 1.44263i - .330654, - 1.6531i - 1.18557, - .252674i - .71929, .167181i + .324049}, 5415)

p = xs#19
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.518307i - 2.62441, - 1.02405i + 3.00531, - 3.26403i - .628863, 2.43802i - .393984, .861758i - .373831, - .892571i - 2.97755}, 491)

p = xs#20
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.719917i + .27666, - .297347i - .299799, .27758i - 1.4597, - .884022i + .133539, - 1.00992i - .465547, .812463i - 1.0481}, 759)

p = xs#21
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .198462i - .360758, - .564154i - 1.76159, - .212432i - .294375, .383922i + .729671, .226202i - .848736, .677967i - .225973}, 515)

p = xs#22
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.0350976i + .743023, - 1.07752i + .417176, .617705i - .35372, .567696i - .129777, .193418i + .337683, .0783583i + .207754}, 431)

p = xs#23
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .493005i - .45097, .750099i + .328881, - .217918i + .555024, .0313969i + .104458, - 1.46957i - .287577, .704514i + .728974}, 723)

p = xs#24
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.643604i + .661878, .473441i - .237573, - .375229i + .969804, .444618i - .468444, - .41943i + .273192, - .49137i + .183181}, 3979)

p = xs#25
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.805773i + 1.03262, - .898467i - .314331, .69828i - .597519, .0911927i + .670806, - .55931i - .394135, - .418351i + .17688}, 1168)

p = xs#26
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 6.20661e-36i - 1.17632, 3.76158e-37i - .239157, - 7.52316e-36i + .438957, 9.40395e-37i - .111093, - 1.4294e-35i - .656819, 3.5735e-36i + 1.2508}, 607)

p = xs#27
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .332015i + .676127, 1.78325i - 2.0766, - .221705i - 2.41202, 1.68166i + 1.64189, .688291i + .862564, - .774557i - 1.71696}, 888)

p = xs#28
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.0971949i - .851217, .187091i + .613691, - .120721i + .795577, .427419i - .156238, - .0545307i - .203073, - .248882i + .449679}, 1277)

p = xs#29
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({5.87747e-39i - 1.29039, - 7.64071e-38i + .214821, 3.17383e-37i - .293635, - 1.07264e-37i - .133771, 2.93874e-37i - 1.76426, 1.11672e-37i + .931261}, 1191)

p = xs#30
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .0350976i + .743023, 1.07752i + .417176, - .617705i - .35372, - .567696i - .129777, - .193418i + .337683, - .0783583i + .207754}, 757)

p = xs#31
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .446021i - 1.03952, 1.39752i - .929486, .687536i + .597089, 1.13474i + .548245, - .860094i - .69785, .0981937i - 1.48911}, 1056)

p = xs#32
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .557886i - 1.42478, - .684388i - .803871, - 1.44263i - .330654, 1.6531i - 1.18557, .252674i - .71929, - .167181i + .324049}, 445)

p = xs#33
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.747082i - .0426053, .504482i - 1.48643, .77695i - .524106, - .666387i + .0227646, - .169071i - .667555, - .943283i - .829073}, 1071)

p = xs#34
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 10.1058i - 3.74363, 4.37657i + 1.27288, 1.43888i - 8.36767, - 4.44783i - 4.8189, 8.53467i + 1.84219, 2.52653i + .806761}, 939)

p = xs#35
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 4.21297e-35i - .700743, 1.35417e-35i + .268883, - 1.88079e-37i - .106375, - 4.5139e-35i + .423913, 1.76794e-35i + .920853, 4.5139e-35i + .344988}, 1117)

p = xs#36
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.223327i + .927058, .679547i - .097784, - .647885i + .150235, .355148i - .149207, - .380631i - .216197, - .338954i + .534533}, 1259)

p = xs#37
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- failed after 6147 iterations
-- changed gamma from 1+2*ii to 1+2.3*ii
-- o16 = ({.446021i - 1.03952, - 1.39752i - .929486, - .687536i + .597089, - 1.13474i + .548245, .860094i - .69785, - .0981937i - 1.48911}, 2357)


p = xs#38
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .623863i - .0773709, .0207474i + 1.32098, .119728i - 1.51699, .0427179i - 1.21089, -
--      .0425301i - .512174, - .143372i - .348108}, 369)

p = xs#39
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.668489i + .49143, - 1.28894i - .254647, .359318i - .735237, .0563246i + .677637, - .250346i + .23594, .170398i + .412154}, 1276)

p = xs#40
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 2.06686i - .803688, - .420732i - 1.60012, .836953i + .673049, 1.22351i - 1.24825, 1.76333i + .273122, - .583933i - 1.26566}, 528)

p = xs#41
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({5.659i + 3.47837, 3.98812i - .242533, .756178i - 4.08199, - .550415i - .118984, 3.46728i - .870231, - 4.51729i - 6.22771}, 1579)

p = xs#42
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.45722, - 1.10203e-39i - .01151, 7.34684e-40i - .712043, 3.67342e-40i - .672185, - 7.34684e-40i + .967025, 5.51013e-40i + .556887}, 550)

p = xs#43
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.46255i - .0521207, - .703607i + .241985, - .134252i - .208316, .399183i + .856028, .29304i + .16607, - .444047i + .093587}, 1342)

p = xs#44
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .719917i + .27666, .297347i - .299799, - .27758i - 1.4597, .884022i + .133539, 1.00992i - .465547, - .812463i - 1.0481}, 596)

p = xs#45
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.332015i + .676127, - 1.78325i - 2.0766, .221705i - 2.41202, - 1.68166i + 1.64189, - .688291i + .862564, .774557i - 1.71696}, 644)

p = xs#46
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.252572i - .299615, - .412304i - .12013, .113047i + .869778, .604521i + .672832, - .700579i + .0376193, - .347344i - .0112763}, 939)

p = xs#47
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({1.11343e-34i - .502773, - 4.36344e-35i + .175758, - 3.38542e-36i - .121283, 1.20371e-34i + .636476, - 4.10012e-35i + .868838, - 1.20371e-34i + .130644}, 913)

p = xs#48
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .0434388i - .892616, - .512525i + .209444, - .0334874i + .801635, .0152931i - .423498, .228121i - .374488, .199426i + .84296}, 1203)

p = xs#49
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 2.39801e-36i - .079242, 1.37298e-35i - 1.2267, 1.95132e-36i - .344651, - 6.77085e-36i + 1.16156, 3.3384e-36i - .140301, 4.70198e-36i + .623441}, 1470)

p = xs#50
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({2.06686i - .803688, .420732i - 1.60012, - .836953i + .673049, - 1.22351i - 1.24825, - 1.76333i + .273122, .583933i - 1.26566}, 2793)

p = xs#51
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 3.33215e-27i - .168659, 1.50199e-26i - .848752, 2.21039e-27i - .293925, - 7.67404e-27i + .97017, 3.28166e-27i - .0593847, 5.14022e-27i + .745392}, 1114)

p = xs#52
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 1.12847e-36i - .460301, 7.52316e-37i - .797903, 7.14701e-36i + .961517, .87705, 1.50463e-35i - .458409, 4.5139e-36i - .485645}, 900)

p = xs#53
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({3.77455i - 6.83017, - 2.99383i - .82776, .533679i + 3.7404, - 3.68078i - 3.52087, - 3.40597i + 3.75091, - 2.83413i + 1.20295}, 1215)

p = xs#54
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({1.88079e-37i - .985666, 4.70198e-37i + 2.05395, - 5.17218e-37i - .456164, - 5.17218e-37i - 1.28601, 1.88079e-37i - .129167, - 4.23178e-37i - .687472}, 669)

p = xs#55
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .805773i + 1.03262, .898467i - .314331, - .69828i - .597519, - .0911927i + .670806, .55931i - .394135, .418351i + .17688}, 794)

p = xs#56
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.198462i - .360758, .564154i - 1.76159, .212432i - .294375, - .383922i + .729671, - .226202i - .848736, - .677967i - .225973}, 915)

p = xs#57
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- 5.659i + 3.47837, - 3.98812i - .242533, - .756178i - 4.08199, .550415i - .118984, - 3.46728i - .870231, 4.51729i - 6.22771}, 669)

p = xs#58
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.322256i - .22719, .694458i - .400885, - .327887i + 1.08386, - .204368i - .509856, - 1.02829i + .64628, .492305i + .297352}, 673)

p = xs#59
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({5.87747e-39i + 1.17514, 5.87747e-39i + .332744, 5.65707e-38i - .391125, - 2.93874e-39i - .0966118, - 8.81621e-39i + .477047, 1.17549e-38i - .926396}, 692)

p = xs#60
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .223327i + .927058, - .679547i - .097784, .647885i + .150235, - .355148i - .149207, .380631i - .216197, .338954i + .534533}, 897)

p = xs#61
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .252572i - .299615, .412304i - .12013, - .113047i + .869778, - .604521i + .672832, .700579i + .0376193, .347344i - .0112763}, 1346)

p = xs#62
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({.383745i + .0716222, - .515785i + .144232, - .00818845i - .303708, .283638i + .90823, .19054i - .359403, - .460594i + .297098}, 1015)

p = xs#63
sol = point matrixConvertToRR(matrix p, C);
result = krawczykHomotopyCC(H, sol, dt, CorrectorStrategy => "relative")
-- o16 = ({- .46255i - .0521207, .703607i + .241985, .134252i - .208316, - .399183i + .856028, - .29304i + .16607, .444047i + .093587}, 1011)

iters = {552,581,1013,3492,917,896,2941,847,1183,679,700,1275,2337,1143,267,859,1493,919,5415,491,759,515,431,723,3979,1168,607,888,1277,1191,757,1056,445,1071,939,1117,1259,2357,369,1276,528,1579,550,1342,596,644,939,913,1203,1470,2793,1114,900,1215,669,794,915,669,673,692,897,1346,1015,1011}

averIter = 1166.421875
maxIter = 5415
minIter = 267
