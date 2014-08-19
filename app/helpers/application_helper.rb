module ApplicationHelper

	def is_current?(page_name)
  	"current" if params[:controller] == page_name
	end

	def find_and_remove_url(string)
		string.gsub!(/(?:f|ht)tps?:\/[^\s]+/, '')
	end

	def blacklisted_tweet_ids(tweet_id)
		# tweets we don't want to show (ie pics of Chris, etc)
		# aspect ratio issues: 318477785662365696

		blacklist_array =
		["316975738584711168",	# Hadfield starts
		"328920180241596417",
		"328821294474862592",
		"316626544862846976",
		"316621978981257216",
		"315424980076728321",
		"313658219555848192",
		"313627318130196483",
		"313200150711529473",
		"315009913283813376",
		"314655596722933760",
		"317054613901684737",
		"318806874935939074",
		"318705878838702080",
		"318640649509425152",
		"318385254186496000",
		"318280266747617280",
		"318477785662365696",
		"318435309706702848",
		"318839597624872960",
		"312597127744348161",
		"312516399664865280",
		"312168122968834048",
		"311981297272766464",
		"311448149870927873",
		"311210947987505152",
		"311246893827117057",
		"311229739849363456",
		"311008556080046081",
		"310724523618091008",
		"310370539883610112",
		"309995660466348032",
		"309760071687086080",
		"309725575508017153",
		"309233652418621440",
		"308911936689565696",
		"308721204691361792",
		"308331403836268544",
		"308275876615827456",
		"308228898745892867",
		"307816255061114880",
		"306763182255513601",
		"306366867046555649",
		"306034040245473280",
		"305643965934354432",
		"305290343623041024",
		"304932428911349760",
		"304200247159189506",
		"303998905761271811",
		"303244780006150145",
		"303450432737521664",
		"303179877916491778",
		"302898663934545920",
		"302876567833546754",
		"303649347290157056",
		"303979073879822338",
		"302771749886496768",
		"302561905753612288",
		"302432422530797568",
		"302138668230008832",
		"301472276958818304",
		"301421027802632192",
		"301368734751260673",
		"301708481096994816",
		"301309013541404672",
		"300972126582751232",
		"300254500281794560",
		"299880609977888768",
		"299657818628321280",
		"299521908175691776",
		"297754130045349888",
		"296028140348792832",
		"295660807482638337",
		"294839552831528960",
		"294210251413151744",
		"291653961344241666",
		"291681185682317312",
		"291604321857069056",
		"291531541530693632",
		"290962462591811584",
		"290808610177572864",
		"290519896989761536",
		"290770806974337024",
		"289874386478043136",
		"289859517544554496",
		"289852499513454592",
		"289831840175505408",
		"289830315608920065",
		"289809237373239296",
		"289794681406111746",
		"289774873524445184",
		"289754380889112576",
		"289733192041242624",
		"289703232568168448",
		"289513227321217024",
		"289336725875068928",
		"289151424531660800",
		"289029293240119297",
		"289005436689076228",
		"288989116689969152",
		"288684521497448448",
		"288626767806226432",
		"288579529390301184",
		"288266213530947584",
		"288030924967391232",
		"288002472365150208",
		"287840570083246081",
		"287161303414489088",
		"286964946338734080",
		"286770583214100480",
		"286761634796556288",
		"286537894703816704",
		"286533393183825921",
		"286518097219842049",
		"286496622928613376",
		"286480698892771328",
		"286464881035726848",
		"286444727182708738",
		"286433862249218048",
		"286432431559548928",
		"286230068739575808",
		"286138946205908993",
		"286112933577097216",
		"286111504258965505",
		"286102301880483840",
		"285767710888038401",
		"285721945406844928",
		"285652883393892352",
		"285508278824366082",
		"285506620195221505",
		"285459928984985600",
		"285443886946598913",
		"285412433244348417",
		"285389016587722752",
		"285387954271174656",
		"285353695787495424",
		"285299048158752769",
		"285131960525930497",
		"285131360597843968",
		"285129694871969793",
		"285129291103076352",
		"284981813666013184",
		"284907742689361922",
		"284904107007942657",
		"284375390045220864",
		"284360240709902336",
		"284331796362063873",
		"284175050427473920",
		"284023402258370560",
		"283973489113853952",
		"283973489113853952",
		"285004384499286016",
		"317420853098848256",
		"317558664389074944",
		"319719005566951424",
		"320085145677881344",
		"320467486552256514",
		"320966976468033536",
		"320960647728873473",
		"321399214397591552",
		"324078964257746944",
		"324205081744506881",
		"324414185024925696",
		"324638635766980608",
		"325358461657419778",
		"325340389567520768",
		"325301816600457216",
		"325614587988807681",
		"325978864272691200",
		"326014890596777986",
		"326057029452046336",
		"325550897318989825",
		"326244969243344896",
		"326085255381544960",
		"326663243332452352",
		"327133625403441153",
		"327343373226762240",
		"327377234203660288",
		"327890481528852481",
		"327928645047971840",
		"328612968470310913",
		"329627015001034752",
		"329523877984219137",
		"329252174225874945",
		"329937815678906368",
		"329882960033624065",
		"329988416802541568",
		"330102028925808640",
		"330427992927002624",
		"330295461737013249",
		"330608733992386560",
		"330755751993819136",
		"331541287595560961",
		"331709657305473025",
		"331749180580192256",
		"331913137198616576",
		"332187074788741120",
		"333319320136462336",
		"333297229135745024",
		"333268906976354304",
		"333267875634769920",
		"333154819789443072",
		"333341376806797312",
		"333355156588597250",
		"318461873869692928",
		"341329245596954625",
		"342117923575455745",
		"343221309137887232",
		"342133603347623937",
		"386109028339695616",
		"385816389472108544",
		"382842147143036928",
		"377563594965000192",
		"375364556739973120",
		"374885158840578048",
		"373185333082337280",
		"373161702725926914",
		"373146824619466752",
		"371285143568138241",
		"370631852488273920",
		"369142227152273408",
		"368680595380895746",
		"368484927425093632",
		"368105282720649216",
		"367322188702953472",
		"366642488045342723",
		"365527569447133186",
		"365458467177259008",
		"364452097963483136",
		"363765083551191040",
		"363706659413032962",
		"360480504128081923",
		"360454807577837568",
		"360159113499516928",
		"359754823027011585",
		"358335124582055937",
		"357582395505012736",
		"356056459743723520",
		"355070232534061056",
		"354345690996035584",
		"353527687593201664",
		"352497964331184128",
		"352190763041427457",
		"351685554120822784",
		"351685554120822784",
		"351460718001938432",
		"350721316451663872",
		"350314215225032704",
		"349647751488892928",
		"349647038243278849",
		"349488903172005888",
		"349279352745250816",
		"348878543624753152",
		"347795750593363968",
		"346959339296268288",
		"346646471065624576",
		"346363250658643969",
		"345664961802027008",
		"344532366758400000",
		"344172423337365504",
		"343340492152524801",
		"342962480772943874",
		"342688406482075648",
		"341895663879073793",
		"341197557336264705",
		"340588962315907072",
		"363665938140233730",
		"392663854334767104",
		"392661973743046657",
		"393038960051503104",
		"394936741724827648",
		"394932363949391872",
		"399564808401326081",
		"409401419528024064",
		"405081785890914304",
		"405080222388596736",
		"407627305201057794",
		"403611019332694016",
		"403483712504868864",
		"410166502042521601",
		"410166502042521601",
		"410160439851376640",
		"409401419528024064",
		"410879009610678273",
		"404011491298246656",
		"409809877553278976",
		"408718414564175872",
		"405447897757396992",
		"408734137973878784",
		"408004336472436736",
		"411259837280813056",
		"411260186431467520",
		"411262649360322560",
		"411258474677272576",
		"409242855622721536",
		"411739390155571200",
		"411738889997402112",
		"413061370184085505",
		"413433225118117888",
		"413780876867039235",
		"414719329498718209",
		"414718882306199552",
		"414880201722437632",
		"415908753003646976",
		"415955599700946944",
		"416645219560345601",
		"417065042995978240",
		"417080622612377601",
		"408734876989259777",
		"417764216502620161",
		"418079876197793792",
		"418436076844232705",
		"418437553167945728",
		"418868610098950145",
		"419488137698480128",
		"419838153537511424",
		"420272593581518848",
		"420271250817040384",
		"420270941625516032",
		"421404368403853312",
		"421781910348521473",
		"422381338243518464",
		"422833512438173696",
		"423206589504299008",
		"423212878028500992",
		"423579360528834560",
		"424084904981168129",
		"424806909510549504",
		"424872001690296321",
		"425011568934277120",
		"425687473058873344",
		"425688264607924224",
		"426117152005824513",
		"426470349614489600",
		"427008899577696256",
		"428193076721373185",
		"428270450964058112",
		"428221850955427840",
		"428192458376110080",
		"428279943236026368",
		"428192147653681152",
		"427511743951036417",
		"429005350549741568",
		"428645953168347136",
		"429655076206944256",
		"430046339766829057",
		"430009524968099841",
		"430448147089739776",
		"430444386573242368",
		"431321491238424579",
		"431546079658508288",
		"431544943937474560",
		"431542945435492353",
		"431544638919294976",
		"431696007349288960",
		"431695456037388288",
		"433244270770667520",
		"433583942029950976",
		"433712315108556800",
		"433710577567805440",
		"433713388007333888",
		"433713047543115776",
		"433972888916336642",
		"434067006518599680",
		"434459103746727936",
		"433736628914233345",
		"434720564901474304",
		"434716585270325249",
		"434715655191789568",
		"434646271198887937",
		"435878599451611136",
		"435893947311738880",
		"436012019875995648",
		"435906231299891200",
		"436978356429389824",
		"436979131654221824",
		"436979751987597312",
		"438052751411404800",
		"438068785883250688",
		"437712058126065664",
		"438070310231760896",
		"438070023697879040",
		"438069575037370368",
		"439156760977235968",
		"439305444008284160",
		"440590459212005376",
		"440607680143446016",
		"440260265083273216",
		"441606865403650048",
		"442307333188640768",
		"440226742565761024",
		"443200918691930112",
		"443079778573094912",
		"444657847008112641",
		"447336674037477376",
		"447335818793730048",
		"447781396807835648",
		"447335272322064384",
		"446782747533520896",
		"446064466237485056",
		"449356467028516864",
		"449359679043301376",
		"448573267222069248",
		"450247911322824704",
		"449682077454049280",
		"452145006094995456",
		"452896289051533313",
		"452807060736843776",
		"452772896113315840",
		"453281931820412928",
		"455451055438839808",
		"455404502523191296",
		"455809622712926208",
		"455457913868271616",
		"455849338292289537",
		"456564839934984193",
		"456570604489945089",
		"456570789249052672",
		"456573842899472384",
		"456574626944925696",
		"456574870273273856",
		"456575118320214016",
		"456575413481766915",
		"456575706642644993",
		"457884743820787712",
		"459049770049236992",
		"459049447209459712",
		"459047027704201217",
		"457646684965568512",
		"457646317615869953",
		"459109490755764224",
		"459421269801185281",
		"460190220042768384",
		"459681308453515264",
		"460551045135872000",
		"464082604128743424",
		"463823269821296640",
		"462981902031257602",
		"462974156699471872",
		"462722378938580993",
		"462721939182587904",
		"462721939182587904",
		"462660852206673920",
		"462653940136296448",
		"462656673794887680",
		"462653357065125888",
		"462652652967297025",
		"462650776343425025",
		"462650193972695040",
		"462649476771876864",
		"462648936671375360",
		"462648480784076800",
		"462606113066594305",
		"462651219064795136",
		"462657375917199360",
		"462652111855968256",
		"464773962220969984",
		"465053949901697024",
		"465032424335101952",
		"465033348315099136",
		"466265224207540224",
		"481204464850710528",
		"480847778671648768",
		"481059344692170752",
		"479998015483412480",
		"479785356657565696",
		"479759266434121728",
		"479366804385452032",
		"481572281303318528",
		"481907185996136450",
		"482277896338173952",
		"483015121933828096",
		"482479273811247104",
		"482994775268655104",
		"483332028046114816",
		"483711617222205440",
		"483711254389743616",
		"443923393411182593",
		"445770084737245184",
		"448992633021403136",
		"474058380449824769",
		"473240317949640704",
		"472902434508247040",
		"484016484260126720",
		"483996153294249984",
		"484331240850333696",
		"484276487575441408",
		"484429345952235520",
		"484741172842086400",
		"484741296108482560",
		"484702874358652931",
		"484840476718022656",
		"485206670297927680",
		"484816334585212928",
		"485747950279065601",
		"485554769407115265",
		"486251821539663872",
		"487259736031510529",
		"487346785866620928",
		"487569735874121729",
		"488006916618981376",
		"487921073044746241",
		"488007354021978113",
		"488405944536023040",
		"489157562562928640",
		"489376689135165440",
		"489365004009754625",
		"489364816016850944",
		"489335919523028992",
		"489409238137966592",
		"489498447725469696",
		"489847368418750466",
		"490889409965719552",
		"491231108101447680",
		"491182457756983296",
		"491522851615158272",
		"492654928209252354",
		"492003846508380160",
		"493365075885817856",
		"492741094140952576",
		"490529709373935616",
		"494173042101088256",
		"494100624854638593",
		"495569476142653443",
		"495241110898237440",
		"494808957756510209",
		"496409555807772672",
		"496669340918231041",
		"496671486933860352",
		"496780029011820544",
		"496939635293970432",
		"497330411572183042",
		"496966791269060608",
		"496951780027031552",
		"497782683603582976",
		"498933552759967744",
		"499135736872849408",
		"499135053797265408",
		"499128521860861952",
		"499180544153120769",
		"499193879519035393",
		"499301069957398529",
		"501065342362611712",
		"501116539123138561",
		"501007971669667843",
		"500607847411888129",
		"500622946994774016",
		"500397739021463553",
		"500014918729744384",
		"501332027426496513",
		"501467494083604480",
		"501490500890021889",
		"501326597216296960",
		"501329737415798784"
	]

		blacklisted = false

		blacklist_array.each_with_index do |val, index|

			if tweet_id == blacklist_array[index]
				blacklisted = true
				break
			else
				blacklisted = false
			end

		end

		blacklisted

	end

end
