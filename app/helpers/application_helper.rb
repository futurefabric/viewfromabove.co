module ApplicationHelper

	def is_current?(page_name)
  	"current" if params[:controller] == page_name
	end

	def blacklisted_tweet_ids(tweet_id)
		# tweets we don't want to show (ie pics of Chris, etc)
		# aspect ratio issues: 318477785662365696

		blacklist_array = 
		["316975738584711168",
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
		"318461873869692928"]

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
