------------------- INSERT 문 작성 --------------------

--tblAdmin(관리자)
insert into tblAdmin(a_id, a_pw, a_name, a_tel, a_nickname) values('admin1', 'animingle0822', '김대환', '010-1234-5678', '관리자김대환');
insert into tblAdmin(a_id, a_pw, a_name, a_tel, a_nickname) values('admin2', 'animingle0704', '백정석', '010-5487-1562', '관리자백정석');
insert into tblAdmin(a_id, a_pw, a_name, a_tel, a_nickname) values('admin3', 'animingle1026', '장기성', '010-4532-4512', '관리자장기성');
insert into tblAdmin(a_id, a_pw, a_name, a_tel, a_nickname) values('admin4', 'animingle0307', '이재성', '010-9541-0452', '관리자이재성');
insert into tblAdmin(a_id, a_pw, a_name, a_tel, a_nickname) values('admin5', 'animingle0117', '한효원', '010-5621-0456', '관리자한효원');
insert into tblAdmin(a_id, a_pw, a_name, a_tel, a_nickname) values('admin6', 'animingle0314', '이민지', '010-8543-0489', '관리자이민지');
insert into tblAdmin(a_id, a_pw, a_name, a_tel, a_nickname) values('admin7', 'animingle0915', '윤혜린', '010-3495-0459', '관리자윤혜린');


--tblUser(회원)
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('pecan789','lycheeY54','문유준','서울특별시 강남구 봉은사로108길 3-6','131동 1719호','010-9671-6308','pecan789@gmail.com','별이내리는밤','4109283475621893',to_date('64/06/02','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('almond012','guavaM25','박세이','서울특별시 구로구 구로동로7라길 2','798동 1354호','010-3230-3818','almond012@naver.com','행복을찾아서','4109832746512387',to_date('02/01/29','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('walnut345','avocadoZ13','정수이','서울특별시 동작구 현충로10길 101','982동 1012호','010-1472-2483','walnut345@gmail.com','사랑스러운당신','4109238475621893',to_date('84/04/18','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('pecan678','pomegranateV47','박유형','서울특별시 금천구 시흥대로12길 10','75동 1301호','010-7712-4174','pecan678@naver.com','밝은빛속으로','4108973428561239',to_date('76/08/07','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('almond901','raspberryJ86','이하윤','서울특별시 광진구 자양로3가길 3','132동 1934호','010-8520-5140','almond901@gmail.com','꿈을향해달리기','4109238475621893',to_date('92/12/27','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('walnut234','blueberryH39','염루원','서울특별시 강동구 동남로83길 2','628동 1215호','010-8772-5483','walnut234@naver.com','황홀한음악',null,to_date('65/05/16','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('pecan567','blackberryQ24','변선아','서울특별시 강북구 덕릉로24길 6','101동 765호','010-4097-1149','pecan567@gmail.com','설레는마음','4109238475621893',to_date('00/09/04','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('wain1719','strawberryT76','이원준','서울특별시 광진구 천호대로104길 19','789동 1965호','010-8012-6005','wain1719@naver.com','바다로가는길','4108973428561239',to_date('89/12/23','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('happy012','gooseberryF39','최태훈','서울특별시 마포구 포은로2길 4','464동 1546호','010-8993-8691','happy012@gmail.com','행복한인연','4109238475621893',to_date('78/03/12','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('pineappe4','cranberryS83','정여정','서울특별시 강남구 봉은사로105길 24','315동 1827호','010-2966-9432','pineappe4@naver.com','사랑하는친구','4108973428561239',to_date('94/07/31','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('bean0456','elderberryU45','박설빈','서울특별시 강북구 4.19로 1','805동 1978호','010-2307-5910','bean0456@gmail.com','따뜻한위로',null,to_date('73/11/19','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('leehan0608','bilberryD12','정이한','서울특별시 강남구 압구정로4길 10','891동 1529호','010-3995-9453','leehan0608@naver.com','밝은내일을향해','4108973428561239',to_date('66/06/08','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('ryuan0127','boysenberryE67','지류안','서울특별시 광진구 뚝섬로50길 3','769동 1235호','010-6856-6619','ryuan0127@gmail.com','사랑의속삭임','4109238475621893',to_date('01/01/27','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('seonghun0404','currantO29','박성훈','서울특별시 강북구 4.19로 1','238동 1884호','010-5091-4842','seonghun0404@naver.com','꿈꾸는하늘','4108973428561239',to_date('70/04/17','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('soi0732','mulberryW38','이소이','서울특별시 성동구 둘레9길 17','664동 1778호','010-6344-3916','soi0732@gmail.com','빛나는꿈','4109238475621893',to_date('90/08/05','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('seohyun05','lingonberryY54','박서현','서울특별시 강동구 천중로49길 91','5동 8호','010-1638-6184','seohyun05@naver.com','즐거운만남',null,to_date('74/12/25','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('yeoyeo0314','cloudberriesI57','여여혜','서울특별시 강동구 구천면로34길 2','102동 502호','010-7967-4321','yeoyeo0314@gmail.com','행복한시작','4109238475621893',to_date('89/03/14','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('younseob0602','durianP13','이윤섭','서울특별시 강남구 봉은사로109길 18','908호','010-9612-6296','younseob0602@naver.com','노래하는바람','4109238475621893',to_date('79/06/02','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('pearl012','asterC39','정설아','서울특별시 강동구 상암로17길 5','877동 999호','010-9538-9161','pearl012@naver.com','새벽의여신','4108973428561239',to_date('75/10/02','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('coral345','foxgloveL82','남장원','서울특별시 동대문구 망우로16길 32','16동 1741호','010-9902-6772','coral345@gmail.com','가슴뛰는봄',null,to_date('91/02/22','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('onyx678','poppyX54','김진영','서울특별시 마포구 독막로28길 7','804동 1662호','010-8694-5007','onyx678@naver.com','즐겁게놀자','4109483265791803',to_date('80/05/12','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('lilac901','violetY72','이영준','서울특별시 강서구 방화대로 94','705동 789호','010-6942-3991','lilac901@gmail.com','바다위의별',null,to_date('04/09/30','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('melon234','pansyM25','이다아','서울특별시 강남구 학동로19길 5','578동 1321호','010-4779-7034','melon234@naver.com','날아라구름',null,to_date('86/12/14','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('salmon567','primulaZ13','박준완','서울특별시 강동구 천중로49길 51','312동 1523호','010-5995-4145','salmon567@gmail.com','반짝이는바다','4105987236418209',to_date('66/03/03','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('mulberry890','ranunculusV47','이준아','서울특별시 강남구 선릉로112길 5','491동 1987호','010-3191-6160','mulberry890@naver.com','빛나는하늘',null,to_date('95/07/23','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('amber123','heatherJ86','김영찬','서울특별시 도봉구 노해로57길 59','803동 432호','010-9155-9799','amber123@gmail.com','깊은바다','4103641829750642',to_date('70/10/10','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('violet123','qwerty1234','기예주','서울특별시 강남구 도산대로4길 9','313동 1106호','010-5010-8506','violet123@gmail.com','화사한날','4101263758492078',to_date('64/05/06','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('indigo456','qawsed789','진대율','서울특별시 서초구 서운로 197','1동 3호','010-7408-4365','indigo456@naver.com','달콤한밤',null,to_date('02/11/12','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('azure789','jasmineB39','변윤아','서울특별시 동대문구 망우로18가길 31','502호','010-6275-3833','azure789@gmail.com','꽃피는봄',null,to_date('85/04/23','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('cerulean012','rosemaryK67','최연후','서울특별시 광진구 동일로48길 6','546동 112호','010-6191-8314','cerulean012@naver.com','즐거운여름','4103641258976234',to_date('76/01/30','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('cobalt345','lavenderG81','박효준','서울특별시 관악구 문성로 189','213동 1987호','010-3252-3295','cobalt345@gmail.com','황금가을','410097800247989',to_date('92/08/08','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('sienna678','marigoldP54','정원호','서울특별시 강동구 양재대로136길 24','789동 1625호','010-9295-6374','sienna678@naver.com','눈내리는겨울',null,to_date('70/12/02','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('amber901','orchidR92','최윤도','서울특별시 강북구 덕릉로 93','4동 1743호','010-4352-3438','amber901@gmail.com','차가운바람',null,to_date('62/07/17','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('teal234','daisyN36','강윤우','서울특별시 강남구 강남대로 402','394동 1077호','010-6095-1522','teal234@naver.com','따뜻한햇살',null,to_date('04/03/28','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('russet567','bluebellC48','정소은','서울특별시 도봉구 도봉로110아길 6','783동 1234호','010-8286-8059','russet567@gmail.com','깨끗한하늘','4108392756482013',to_date('69/09/13','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('crimson890','sunflowerL75','최유현','서울특별시 동대문구 약령중앙로12길 1','213동 587호','010-8355-9198','crimson890@naver.com','넓은바다',null,to_date('99/06/26','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('scarlet123','irisX24','최우원','서울특별시 강남구 삼성로107길 5','101동 1654호','010-2324-4099','scarlet123@gmail.com','푸른숲속으로',null,to_date('73/10/21','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('magenta456','dahliaY11','정세민','서울특별시 관악구 낙성대로 7','965동 435호','010-1978-7193','magenta456@naver.com','별빛처럼','4105978364280197',to_date('88/02/16','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('citrine789','petuniaM79','백다형','서울특별시 마포구 월드컵로31길 103','456동 980호','010-2783-5468','citrine789@gmail.com','무지개빛',null,to_date('78/05/09','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('aquamarine012','peonyZ86','전예령','서울특별시 강북구 덕릉로28길 45','2동 1290호','010-7299-4867','aquamarine012@naver.com','아름다운꿈',null,to_date('00/08/30','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('periwinkle345','pansyV53','정시원','서울특별시 관악구 남부순환로 1430','108동 111호','010-1843-3475','periwinkle345@gmail.com','노을빛하늘','4104862971389209',to_date('86/12/19','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('fuchsia678','primroseJ47','이영혜','서울특별시 강동구 성내로12길 9','823동 392호','010-6029-6052','fuchsia678@naver.com','고요한새벽',null,to_date('66/03/04','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('sage901','azaleaH65','박대규','서울특별시 강남구 개포로116길 3','394동 1435호','010-9906-4131','sage901@gmail.com','화려한불꽃',null,to_date('94/07/14','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('cornflower234','buttercupQ29','최연수','서울특별시 강남구 테헤란로13길 8-3','935동 1539호','010-4588-7346','cornflower234@naver.com','청량한물결','4102739841659018',to_date('71/11/23','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('lavender567','carnationT13','김원영','서울특별시 영등포구 신길로42다길 1','500동 333호','010-4434-4936','lavender567@gmail.com','가을의소리',null,to_date('63/06/12','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('canary890','chamomileF96','여은슬','서울특별시 강남구 압구정로42길 5','311동 1999호','010-3594-8651','canary890@naver.com','춤추는물결','4101239487562812',to_date('01/01/01','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('marigold123','snowdropS72','이동희','서울특별시 강남구 남부순환로 2627','913동 640호','010-7279-3980','marigold123@gmail.com','행복한하루','4108756941237891',to_date('67/04/17','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('jade456','sweetpeaU45','최윤렬','서울특별시 강남구 영동대로85길 13','301동 454호','010-9486-2863','jade456@naver.com','웃음꽃필때','4107834659285072',to_date('90/09/27','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('aqua789','hyacinthD61','박이안','서울특별시 노원구 덕릉로137길 7','102동 1792호','010-1609-8207','aqua789@gmail.com','선물같은날',null,to_date('74/12/10','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('tangerine012','lilacE27','최해슬','서울특별시 성동구 광나루로9길 2','728동 1753호','010-3651-6980','tangerine012@naver.com','소중한추억',null,to_date('89/02/02','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('emerald345','lilyO39','선동현','서울특별시 서초구 강남대로10길 5','549동 845호','010-6236-9961','emerald345@gmail.com','즐거운노래','4108237465986203',to_date('79/05/31','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('mauve678','narcissusI57','이연호','서울특별시 강남구 강남대로 298','390동 1487호','010-3883-4651','mauve678@naver.com','아침의햇살',null,to_date('65/08/20','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('cardinal901','tulipW83','이소원','서울특별시 서초구 동광로30길 5','71동 923호','010-7706-7568','cardinal901@gmail.com','밤하늘별빛','4101238756942189',to_date('96/12/25','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('indigo234','freesiaB76','이윤수','서울특별시 마포구 만리재옛4길 5','738동 1905호','010-2896-7998','indigo234@naver.com','맑은하늘',null,to_date('72/03/16','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('sapphire567','geraniumK29','최소민','서울특별시 서대문구 세검정로4길 13','167동 520호','010-6107-7846','sapphire567@gmail.com','찬란한봄','4101897268452012',to_date('87/07/05','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('garnet890','zinniaG45','장호영','서울특별시 영등포구 신길로41나길 1','356동 1054호','010-8178-4175','garnet890@naver.com','푸르른여름',null,to_date('68/11/18','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('vermilion123','magnoliaP13','이영찬','서울특별시 강동구 아리수로94길 72','998동 1302호','010-3546-7416','vermilion123@gmail.com','금빛가을',null,to_date('98/04/06','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('turquoise456','gardeniaR97','이주현','서울특별시 서초구 강남대로105길 5','45동 1379호','010-6949-7002','turquoise456@naver.com','얼음꽃겨울',null,to_date('61/06/27','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('topaz789','chrysanthemumN61','주성현','서울특별시 양천구 목동중앙남로16길 14','230동 490호','010-4391-1417','topaz789@gmail.com','바람의노래','4109238475621893',to_date('03/01/11','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('beryl456','fuchsiaH39','김진아','서울특별시 동대문구 약령시로3길 38','331동 1288호','010-6765-4409','beryl456@naver.com','별이빛나는밤',null,to_date('63/06/01','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('cinnamon789','snowflakeQ24','허예찬','서울특별시 강남구 선릉로103길 22','785동 596호','010-5203-9780','cinnamon789@gmail.com','웃음꽃','4109852173645891',to_date('02/01/28','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('buttercup012','hollyT76','최태현','서울특별시 광진구 능동로34길 86','195동 1896호','010-2078-2587','buttercup012@naver.com','기쁜하루',null,to_date('84/04/17','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('slate345','mistletoeF39','오하영','서울특별시 관악구 신원로 2','624동 423호','010-6268-7079','slate345@gmail.com','따스한햇살','4105789321468702',to_date('76/08/06','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('ruby678','poinsettiaS83','이도영','서울특별시 마포구 독막로29길 6','721동 1689호','010-6826-2982','ruby678@naver.com','밝은미래','4101239857462813',to_date('92/12/26','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('orchid901','ivyU45','손도율','서울특별시 강서구 곰달래로 168','355동 1712호','010-6643-5673','orchid901@gmail.com','시원한바람',null,to_date('64/05/15','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('lavender234','fernD12','채유채','서울특별시 강서구 강서로45다길 62-7','284동 756호','010-8948-4597','lavender234@naver.com','아름다운사랑','4101938476529013',to_date('00/09/03','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('azure567','spruceE67','최재현','서울특별시 강북구 삼양로 118','459동 1543호','010-6299-6523','azure567@gmail.com','맛있는음식','4108973428561239',to_date('88/12/22','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('fern890','pineO29','최은세','서울특별시 강북구 도봉로102길 6','908호','010-8222-5493','fern890@naver.com','행복한시간',null,to_date('77/03/11','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('peridot123','oakW38','최재훈','서울특별시 양천구 목동중앙남로14길 1','74동 1329호','010-8378-2195','peridot123@gmail.com','멋진세상','4106745389217835',to_date('94/07/30','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('straw456','mapleY54','엄정희','서울특별시 광진구 광나루로28길 6','763동 852호','010-2952-4436','straw456@naver.com','놀라운모험','4109847562398712',to_date('72/11/18','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('flamingo789','willowZ98','최민기','서울특별시 광진구 뚝섬로49길 11-1','128동 1765호','010-8296-4828','flamingo789@gmail.com','뜨거운열정',null,to_date('65/06/07','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('cherry012','ashJ32','최루완','서울특별시 서초구 방배로13길 40','594동 1522호','010-8250-1152','cherry012@naver.com','멋진인생','4102348756941237',to_date('01/01/26','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('plum345','birchS76','정동해','서울특별시 서초구 서운로 134','147동 810호','010-5452-9086','plum345@gmail.com','신나는여행',null,to_date('69/04/16','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('ginger678','elmF49','김소민','서울특별시 동대문구 망우로18길 33','341동 1993호','010-5663-1639','ginger678@naver.com','찬란한눈빛','4107465398218762',to_date('90/08/04','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('iris901','lindenP63','최시율','서울특별시 동대문구 망우로18가길 32','673동 1659호','010-3303-7855','iris901@gmail.com','너그러운마음','4108973428561239',to_date('73/12/24','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('quartz234','sequoiaT18','최성수','서울특별시 강남구 강남대로 238','888동 584호','010-5959-4952','quartz234@naver.com','부드러운속삭임',null,to_date('89/03/13','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('taffy567','beechO57','고원훈','서울특별시 강서구 곰달래로 245','625동 1020호','010-3876-5143','taffy567@gmail.com','가슴벅찬사랑','4108957462831904',to_date('78/06/01','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('hickory890','cypressX36','방래현','서울특별시 강서구 공항대로55길 5','738동 853호','010-4065-3131','hickory890@naver.com','달콤한향기',null,to_date('00/10/20','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('clover123','acaciaR84','최성율','서울특별시 강북구 솔샘로59길 6','182동 1249호','010-9702-2461','clover123@gmail.com','무한한희망','4101234875694237',to_date('85/01/08','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('olive456','oliveH21','최장호','서울특별시 관악구 조원로 5-6','1000동 877호','010-8888-1475','olive456@naver.com','꿈꾸는밤',null,to_date('76/04/27','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('peacock789','walnutK98','정장현','서울특별시 금천구 독산로72길 4','523동 1663호','010-2993-9573','peacock789@gmail.com','즐거운축제',null,to_date('92/09/14','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('umber012','pecanV45','조승진','서울특별시 중구 을지로12길 19','59동 1998호','010-2839-2931','umber012@naver.com','사랑스러운웃음','4107892345687912',to_date('63/12/04','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('lavender345','macadamiaN72','유성진','서울특별시 동대문구 약령중앙로 5','897동 873호','010-2523-9341','lavender345@gmail.com','깊은사랑','4103648291075642',to_date('02/02/21','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('ebony678','cashewC61','문대영','서울특별시 광진구 광나루로28길 6','772동 1285호','010-4395-1852','ebony678@naver.com','따뜻한봄날','4109852713640981',to_date('87/05/11','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('pistachio901','hazelnutL29','배이윤','서울특별시 서초구 강남대로101안길 12','438동 597호','010-4139-1866','pistachio901@gmail.com','여름의바람','4109328475698123',to_date('79/08/30','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('iris234','pistachioY86','최윤설','서울특별시 종로구 수표로18가길 4','381동 984호','010-8704-2774','iris234@naver.com','가을의향기','4109857462318794',to_date('96/12/19','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('chestnut567','almondB54','박은선','서울특별시 관악구 봉천로49다길 25','951동 788호','010-9435-1878','chestnut567@gmail.com','겨울의노래','4102398745623987',to_date('71/03/08','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('almond890','chestnutG37','신윤설','서울특별시 강동구 진황도로 145','1762호','010-4706-6729','almond890@naver.com','바다의그림자',null,to_date('86/07/26','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('walnut123','coconutP75','백이진','서울특별시 광진구 아차산로34길 5','613동 1913호','010-2974-1473','walnut123@gmail.com','하늘의노래','4109823746581239',to_date('68/11/14','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('pecan456','mangoJ92','지자연','서울특별시 강남구 역삼로 146','926동 1236호','010-5602-1107','pecan456@naver.com','봄비소리','4108973456287193',to_date('99/04/04','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('chestnut789','papayaZ14','박이지','서울특별시 구로구 구로동로7다길 7','511동 1189호','010-5084-3177','chestnut789@gmail.com','여름의태양',null,to_date('62/06/23','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('ebony012','bananaM68','최현정','서울특별시 마포구 포은로6길 25','213동 1372호','010-2192-4403','ebony012@naver.com','가을의운동회',null,to_date('03/01/12','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('pistachio345','kiwiF31','김은채','서울특별시 마포구 홍익로 4','324동 1203호','010-2034-3106','pistachio345@gmail.com','겨울의선물','4109283475621893',to_date('75/10/01','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('iris678','orangeQ59','박우헌','서울특별시 관악구 조원로 143','98동 1857호','010-2639-3634','iris678@naver.com','바람의향기',null,to_date('91/02/19','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('chestnut901','appleU27','조여솔','서울특별시 강북구 노해로26길 5','779동 654호','010-8029-6374','chestnut901@gmail.com','사랑하는우리','4102394875623918',to_date('80/05/10','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('almond234','grapeR45','김다린','서울특별시 관악구 문성로 120-5','167동 924호','010-7941-3642','almond234@naver.com','행복한가족',null,to_date('04/09/28','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('walnut567','cherryH89','김영솔','서울특별시 노원구 공릉로 144','379동 1445호','010-5967-4510','walnut567@gmail.com','웃음찾기','4108973452681937',to_date('77/12/17','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('pecan890','peachT12','최우원','서울특별시 강북구 도봉로10나길 4','806동 1024호','010-7869-1132','pecan890@naver.com','춤추는하늘',null,to_date('66/03/06','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('almond123','plumX76','박대영','서울특별시 광진구 긴고랑로13길 5','992동 1813호','010-5468-4637','almond123@gmail.com','꽃피는밤','4108973428561239',to_date('95/07/25','RR/MM/DD'),'animingle.png');
Insert into ADMIN.TBLUSER (USER_ID,USER_PW,USER_NAME,USER_ADDRESS,USER_ADDRESSDETAIL,USER_TEL,USER_EMAIL,USER_NICKNAME,USER_ANIMALNUM,USER_BIRTH,USER_PIC) values ('walnut456','apricotW38','현세빈','서울특별시 관악구 대학7길 3','279동 989호','010-1369-5824','walnut456@naver.com','눈물의별',null,to_date('70/10/13','RR/MM/DD'),'animingle.png');


-- tblWagle(와글와글 게시판) --

-- 1번 : 일상
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이 너무 예쁘죠~?', '우리 아이는 눈부시게 아름답고, 웃음소리는 전 세계를 밝게 만들고, 귀여운 모습은 모든 이들의 마음을 사로잡아요! 우리 아이는 순수하고 세상에 희망을 가져다 주는 소중한 존재에요~', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'pecan789', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이 저 닮았나요~?', '우리 아이 저랑 쏘옥 닮았죠~! 너무 귀여워요 ㅎㅎ', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'almond012', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이 귀엽죠~?', '짱 귀엽죠~! 갑자기 애교 부리길레 훅 찍었어요!', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'walnut345', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '사랑하는 우리 아이에게', '사랑하는 우리 아이에게 항상 응원의 마음을 전합니다. 당신은 특별하고 소중한 존재입니다. 자신감과 사랑으로 세상을 밝혀나가길 바랍니다. 항상 너를 사랑해요!', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'pecan678', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이의 꿈', '우리 아이의 꿈은 무엇일까요? 어떤 길을 선택하더라도 우리는 너를 응원할 거예요. 꿈을 향해 달려가는 모습은 빛나는 보석 같아요. 항상 당당하게 꿈을 펼치길 기도합니다.', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'almond901', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '행복한 우리 아이', '우리 아이의 행복을 위해 노력하고 있습니다. 너의 미소와 웃음은 저희에게 큰 힘이 됩니다. 네가 행복하면 우리도 행복합니다. 항상 사랑하는 마음으로 곁에 있을게요.', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'walnut234', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이의 성장', '우리 아이가 점점 커가는 모습을 보면 자랑스럽고 뿌듯해요. 세상을 탐험하며 새로운 경험을 하고 배움의 길을 걷는 네가 보기에 너무 멋져요. 더 큰 세계로 나아가길 응원합니다!', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'pecan567', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이의 장난감', '우리 아이와 함께 놀고 장난감으로 즐거운 시간을 보내는 건 정말 행복한 일이에요. 우리 아이의 웃음소리는 저에게 가장 큰 보물입니다. 너의 즐거움이 온 가정에 평화와 행복을 가져다 주길 바랍니다.', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'wain1719', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이와 함께한 추억', '우리 아이와 함께한 추억은 언제나 소중하고 특별해요. 너와 함께하는 모든 순간이 마음에 남아 영원한 보물로 남을 거예요. 네가 더 많이 자라면서 함께 만들어갈 추억들이 더 기다려져요.', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'happy012', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '매일 더 성장하는 우리 아이', '매일매일 우리 아이가 성장해가는 모습은 신기하고 놀라워요. 네가 배우고 성장하는 과정을 지켜보는 건 제게 큰 행복입니다. 앞으로도 계속해서 더 나은 모습으로 성장해 나가길 응원할게요!', TO_DATE('2023-06-01', 'YYYY-MM-DD'), 'pineappe4', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '사랑하는 우리 아이에게', '사랑하는 우리 아이에게 항상 응원의 마음을 전합니다. 당신은 특별하고 소중한 존재입니다. 자신감과 사랑으로 세상을 밝혀나가길 바랍니다. 항상 너를 사랑해요!', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'bean0456', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이의 꿈', '우리 아이의 꿈은 무엇일까요? 어떤 길을 선택하더라도 우리는 너를 응원할 거예요. 꿈을 향해 달려가는 모습은 빛나는 보석 같아요. 항상 당당하게 꿈을 펼치길 기도합니다.', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'leehan0608', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '행복한 우리 아이', '우리 아이의 행복을 위해 노력하고 있습니다. 너의 미소와 웃음은 저희에게 큰 힘이 됩니다. 네가 행복하면 우리도 행복합니다. 항상 사랑하는 마음으로 곁에 있을게요.', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'ryuan0127', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이의 성장', '우리 아이가 점점 커가는 모습을 보면 자랑스럽고 뿌듯해요. 세상을 탐험하며 새로운 경험을 하고 배움의 길을 걷는 네가 보기에 너무 멋져요. 더 큰 세계로 나아가길 응원합니다!', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'seonghun0404', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이의 장난', '우리 아이의 장난은 항상 우리 가정에 웃음을 안겨줍니다. 네가 만드는 장난은 참신하고 재미있어요. 너와 함께 놀며 즐거운 시간을 보내는 건 저에게 큰 행복입니다.', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'soi0732', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이와 함께한 추억', '우리 아이와 함께한 추억은 언제나 소중하고 특별해요. 너와 함께하는 모든 순간이 마음에 남아 영원한 보물로 남을 거예요. 네가 더 많이 자라면서 함께 만들어갈 추억들이 더 기다려져요.', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'seohyun05', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '매일 더 성장하는 우리 아이', '매일매일 우리 아이가 성장해가는 모습은 신기하고 놀라워요. 네가 배우고 성장하는 과정을 지켜보는 건 제게 큰 행복입니다. 앞으로도 계속해서 더 나은 모습으로 성장해 나가길 응원할게요!', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'yeoyeo0314', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이의 첫번째 발자국', '우리 아이의 첫번째 발자국은 특별하고 소중한 순간입니다. 세상을 탐험하는 너의 발걸음은 큰 의미를 가지고 있어요. 네가 가는 길에 항상 너의 행복과 안전이 함께하기를 기도합니다.', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'younseob0602', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '우리 아이와 함께 성장하는 순간들', '우리 아이와 함께 성장하는 순간들은 삶에 빛과 희망을 불어넣어줍니다. 너의 노력과 열정이 우리 가정에 행복을 안겨줍니다. 너와 함께하는 모든 순간을 감사하며 사랑합니다!', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'pearl012', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 1, '사랑하는 우리 아이에게', '사랑하는 우리 아이에게 항상 응원의 마음을 전합니다. 당신은 특별하고 소중한 존재입니다. 자신감과 사랑으로 세상을 밝혀나가길 바랍니다. 항상 너를 사랑해요!', TO_DATE('2023-06-02', 'YYYY-MM-DD'), 'coral345', 0);

-- 2번 : 정보 공유
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '페르시안 고양이 털 관리 어떻게 하세요?', '페르시안 고양이를 키우고 있는데 털이 너무 많이 빠져서 걱정이에요. 어떤 브러시를 사용하시는지, 털 관리 팁이 있으면 공유해주세요.', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'onyx678', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '강아지와 함께 놀 수 있는 안전한 장난감 추천 부탁드립니다!', '새로이 푸들을 입양했는데요, 활발하게 놀 수 있는 장난감이 필요해요. 가장 안전하면서 재미있는 장난감 추천 부탁드립니다.', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'lilac901', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '홈메이드 강아지 간식 레시피 있으신가요?', '강아지가 알러지가 있어서 간식을 직접 만들어주려고 합니다. 강아지가 좋아하고, 영양가도 있는 간식 레시피 있으면 알려주세요!', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'melon234', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '집에서 키우기 좋은 작은 반려동물 추천 부탁드려요', '아파트에서 같이 키울 수 있는 작은 반려동물 추천해주세요. 애완동물에 대한 경험이 별로 없으니, 키우기 쉬운 종류가 좋겠어요.', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'salmon567', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '반려동물 더위 피하는 방법 공유해주세요!', '이번 여름엔 폭염이 예상되는데 반려동물들 어떻게 케어해주는게 좋을까요? 더위를 피하는 팁이 있으시면 공유해주세요.', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'mulberry890', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '고양이 장난감 DIY 아이디어 있나요?', '요즘 고양이와 집에서 많이 놀아주고 싶은데, 집에 있는 재료로 만들 수 있는 장난감 아이디어가 있으면 공유해주세요', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'amber123', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '골든 리트리버 훈련 팁 있을까요?', '저희집에 골든 리트리버 강아지가 새로 왔어요. 기본적인 훈련은 어떻게 시작하는게 좋을까요? 경험 있으신 분들의 팁 부탁드립니다.', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'violet123', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '햄스터와 고양이 동시에 키우는 방법 알려주세요', '햄스터를 키우다가 최근에 고양이를 입양했어요. 두 동물이 안전하게 같이 지낼 수 있는 방법에 대한 조언이 필요해요.', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'indigo456', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '강아지 훈련을 위한 책 추천 부탁드립니다.', '강아지 훈련에 도움이 될만한 책을 찾고 있어요. 훈련에 관한 기본적인 지식을 배울 수 있는 책 추천해주세요!', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'azure789', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '깨끗한 반려동물 용품 쇼핑 사이트 추천해주세요', '반려동물 용품을 구매할 수 있는 깨끗하고 신뢰할 수 있는 온라인 쇼핑 사이트를 찾고 있습니다. 어디서 구매하시나요?', TO_DATE('2023-06-03', 'YYYY-MM-DD'), 'cerulean012', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '반려동물과 함께하는 실내 놀이 아이디어 공유합니다!', '놀이 간식 찾기: 간식을 숨겨놓고 반려동물에게 찾게 하거나, 놀이감 안에 간식을 넣어서 찾게 할 수 있습니다. 오락 영상 시청: 반려동물 전용 오락 영상을 틀어주면서 함께 시청하며 놀이를 즐길 수 있습니다. 퍼즐 장난감: 반려동물이 음식을 찾아내기 위해 퍼즐을 푸는 장난감을 활용해보세요. 실내 장애물 경주: 일반적인 놀이 장난감을 활용하여 반려동물과 함께 실내에서 장애물 경주를 즐길 수 있습니다. 학습 트릭: 반려동물과 함께 학습 트릭을 연습하면서 놀이를 즐길 수 있습니다.', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'cobalt345', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '강아지와 함께하는 산책 코스 추천합니다!', '도심 속 공원 산책: 지역에 있는 도심 속 공원은 강아지와 함께 산책하기에 안전하고 쾌적한 장소입니다. 해변 산책: 근처에 해변이 있다면 강아지와 함께 해변을 산책하는 것도 좋은 선택입니다. 강아지가 바닷물에서 놀 수 있다면 더욱 재미있을 거예요. 자연공원 산책로: 자연공원에는 다양한 산책로가 마련되어 있습니다. 강아지와 함께 자연을 느끼며 걷는 것은 상쾌하고 힐링되는 경험이 될 것입니다. 동네 주택가 산책: 강아지와 함께 동네 주택가를 산책하는 것도 좋은 선택입니다. 이렇게 하면 주변 풍경이 익숙해지고 강아지에게도 긍정적인 영향을 줄 수 있습니다.', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'sienna678', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '반려동물의 스트레스 관리 방법 알려드립니다.', '안전하고 편안한 환경 제공하기: 반려동물이 느끼는 안전감을 높일 수 있는 환경을 만들어주세요. 간단한 변화라도 스트레스를 줄일 수 있습니다. 일정한 일상 유지하기: 반려동물에게는 일정한 일상이 중요합니다. 식사, 산책, 놀이 등을 정해진 시간에 지켜주는 것이 좋습니다.', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'amber901', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '반려동물과 함께하는 가을 나들이 장소 추천해주세요!', '단풍이 아름다운 산책로: 가을에는 단풍이 아름다운 산책로를 찾아보세요. 반려동물과 함께 단풍 구경을 즐길 수 있습니다. 과수원이 있는 농촌 지역: 가을이면 수확 철이 되는 농촌 지역에서 과수원을 구경하면서 산책하는 것도 좋은 아이디어입니다. 호수 또는 연못 주변 산책로: 가을에는 호수 또는 연못 주변에서 신선한 공기를 마시며 산책하는 것이 좋습니다.', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'teal234', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '집에서 편하게 할 수 있는 반려동물 건강 체크리스트 알려드립니다.', '일일 건강 관찰: 반려동물의 음식 섭취량, 배변 여부, 활동성 등을 일일 기록하면서 건강 상태를 확인하세요. 털과 피부 관리: 털의 상태와 피부에 이상이 없는지 확인하고, 필요에 따라 브러싱이나 목욕을 시켜주세요. 입과 이빨 관리: 이빨에 이상이 없는지, 입술과 구강 주위에 이상이 없는지 확인하고 필요한 경우 이빨 청결을 유지해주세요. 발톱 관리: 발톱이 너무 길지 않은지 확인하고, 필요한 경우 발톱을 깍아주세요.', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'russet567', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '반려동물 사료 선택 시 고려해야 할 요소 알려드립니다.', '생식한 사료인지 확인해주세요. 생식한 사료는 반려동물의 영양 균형을 유지하는 데 도움을 줄 수 있습니다.반려동물의 연령에 맞는 사료를 선택하세요. 성장기, 성인기, 노령기에 따라 영양 요구가 다르므로 적절한 사료를 골라주세요.', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'crimson890', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '반려동물 훈련 시 효과적인 보상 방법 알려드립니다.', '간식 보상: 훈련 도중에 올바른 행동을 보인 경우, 애완동물에게 맛있는 간식을 줘서 보상해주세요. 칭찬과 애정 표현: 애완동물에게 칭찬의 말과 애정 어필을 통해 보상을 줄 수 있습니다. 목소리 톤과 긍정적인 태도로 보상을 표현하세요.', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'scarlet123', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '반려동물과 함께하는 가을 야외 활동 아이디어 공유합니다!', '가을 소풍: 가을 햇볕 아래에서 애완동물과 함께 소풍을 즐겨보세요. 간식과 물을 챙겨서 함께 시간을 보내는 것은 애완동물과의 특별한 경험이 될 것입니다. 단풍 구경 산책: 단풍이 아름다운 곳으로 산책을 떠나보세요. 애완동물과 함께 풍경을 구경하며 걷는 것은 즐거운 경험이 될 것입니다.', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'magenta456', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '반려동물과 함께하는 가을 꾸미기 아이디어 공유합니다!', '애완동물과 함께하는 가을 사진 촬영: 애완동물과 함께 가을 분위기를 담은 사진을 찍어보세요. 장소나 소품을 활용하여 특별한 사진을 만들어볼 수 있습니다. 애완동물용 가을 의상: 가을에 애완동물에게 귀여운 가을 의상을 입혀보세요. 단풍잎이나 동물 모티프가 있는 옷을 활용해보는 것도 좋습니다.', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'citrine789', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 2, '반려동물과 함께하는 가을 야외 이벤트 참여해보세요!.', '가을 축제: 지역에서 열리는 가을 축제에 애완동물과 함께 참여해보세요. 애완동물과 함께 다양한 이벤트와 축제 분위기를 즐길 수 있을 거예요. 애완동물 카페 행사: 애완동물 카페에서 열리는 가을 행사에 참여해보세요. 애완동물과 함께 다른 반려동물과의 만남을 즐기고 새로운 친구를 만날 수 있습니다.', TO_DATE('2023-06-04', 'YYYY-MM-DD'), 'aquamarine012', 0);

-- 3번 나눔 
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 3, '개껌 나눔해요!', '맛있는 개껌 나눔합니다. 선착순 3분!!', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'periwinkle345', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 3, '밥그릇 나눔해요!', '깔끔하고 실사용 1번 밥그릇 나눔합니다!!', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'fuchsia678', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 3, '장난감 나눔해요!', '한번도 안사용한 장난감 나눔합니다.', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'sage901', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 3, '사료 나눔해요!', '저희 아이가 잘 안먹어서 나눔합니다!', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'cornflower234', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 3, '캣타워 나눔해요!', '실사용 3번 캣타워 나눔합니다.', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'lavender567', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 3, '스크래처 나눔해요!', '재밌는 스크래처 나눔합니다.', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'canary890', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 3, '고양이 샴푸 나눔해요!', '냄새가 잘 안맞는거 같아 나눔합니다!', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'marigold123', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 3, '강아지 샴푸 나눔해요!', '갖고 싶으신분 선착순! 나눔합니다.', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'jade456', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 3, '강아지 장난감 나눔해요!', '강아지로 3행시 잘하시는분 나눔 드려요!', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'aqua789', 0);
INSERT INTO tblWagle VALUES (wg_seq.nextVal, 3, '도넛 방석 나눔해요!', '이미 있는 방석 받아서 나눔합니다!', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'tangerine012', 0);

-- tblWagleComment(와글와글 댓글) --

-- 일상
-- 1 ~ 10
insert into tblWagleComment values (wgc_seq.nextVal, 1, 'walnut456', TO_DATE('2023-06-01','YYYY-MM-DD'), '너무 귀여워요~~ 애기가 사랑스럽네요.');
insert into tblWagleComment values (wgc_seq.nextVal, 1, 'almond123', TO_DATE('2023-06-01','YYYY-MM-DD'), '아이고 애기가 주인을 닮아서 그런지 너무 귀엽네요');
insert into tblWagleComment values (wgc_seq.nextVal, 1, 'pecan890', TO_DATE('2023-06-02','YYYY-MM-DD'), '볼을 콱! 깨물어주고 싶어요!!');
insert into tblWagleComment values (wgc_seq.nextVal, 2, 'walnut567', TO_DATE('2023-06-01','YYYY-MM-DD'), '주인 닮아서 너무 사랑스러워요! ');
insert into tblWagleComment values (wgc_seq.nextVal, 2, 'almond234', TO_DATE('2023-06-02','YYYY-MM-DD'), '너무 부러워요. 우리 아이도 날 닮았으면 좋으련만');
insert into tblWagleComment values (wgc_seq.nextVal, 3, 'chestnut901', TO_DATE('2023-06-01','YYYY-MM-DD'), '미쳤다 저장해도 되나요???');
insert into tblWagleComment values (wgc_seq.nextVal, 3, 'iris678', TO_DATE('2023-06-02','YYYY-MM-DD'), '오마이갓 너무 사랑스러워요 보쌈해갈꺼에요');
insert into tblWagleComment values (wgc_seq.nextVal, 3, 'pistachio345', TO_DATE('2023-06-03','YYYY-MM-DD'), '우리 강아지랑 바꿉시다');
insert into tblWagleComment values (wgc_seq.nextVal, 4, 'ebony012', TO_DATE('2023-06-02','YYYY-MM-DD'), '제가 다 감동받았어요 당신은 진짜 멋있는 주인이에요');
insert into tblWagleComment values (wgc_seq.nextVal, 4, 'chestnut789', TO_DATE('2023-06-02','YYYY-MM-DD'), '우리 뽀삐에게도 그대로 말해줘야겠어요');
insert into tblWagleComment values (wgc_seq.nextVal, 4, 'pecan456', TO_DATE('2023-06-03','YYYY-MM-DD'), '우리 아이가 쪼금 아픈데 얼른 기운차리고 힘냈으면 좋겠어요');
insert into tblWagleComment values (wgc_seq.nextVal, 5, 'iris234', TO_DATE('2023-06-02','YYYY-MM-DD'), '우리 애기들은 보석처럼 눈이 반짝반짝 빛나요');
insert into tblWagleComment values (wgc_seq.nextVal, 5, 'pecan456', TO_DATE('2023-06-03','YYYY-MM-DD'), '우리 아이들이 말을 할 수 있다면 얼마나 좋을까요. 하고 싶은거 다 하게 해줬을 텐데');
insert into tblWagleComment values (wgc_seq.nextVal, 6, 'umber012', TO_DATE('2023-06-03','YYYY-MM-DD'), '애기들의 행복을 위해서라면 뭐든지 할 수 있어요');
insert into tblWagleComment values (wgc_seq.nextVal, 6, 'iris234', TO_DATE('2023-06-04','YYYY-MM-DD'), '다들 사랑으로 키웁시다.!');
insert into tblWagleComment values (wgc_seq.nextVal, 7, 'almond234', TO_DATE('2023-06-04','YYYY-MM-DD'), '그래서 전 항상 여행갈때 애기들도 데려가요');
insert into tblWagleComment values (wgc_seq.nextVal, 7, 'ebony012', TO_DATE('2023-06-04','YYYY-MM-DD'), '아이들이 더 넓은 세상을 봤으면 좋겠어요');
insert into tblWagleComment values (wgc_seq.nextVal, 7, 'almond123', TO_DATE('2023-06-05','YYYY-MM-DD'), '우리 애기들 정말 쑥쑥 크더라구요 대박이에요');
insert into tblWagleComment values (wgc_seq.nextVal, 8, 'walnut456', TO_DATE('2023-06-06','YYYY-MM-DD'), '보물이라는 말이 너무 인상깊네요');
insert into tblWagleComment values (wgc_seq.nextVal, 8, 'clover123', TO_DATE('2023-06-06','YYYY-MM-DD'), '사랑아 애기해~!!!!!!!!!!!');
insert into tblWagleComment values (wgc_seq.nextVal, 8, 'olive456', TO_DATE('2023-06-06','YYYY-MM-DD'), '우리 애기 웃는거 정말 귀여워요');
insert into tblWagleComment values (wgc_seq.nextVal, 9, 'peacock789', TO_DATE('2023-06-06','YYYY-MM-DD'), '애기랑 추억을 많이 쌓아야될 것 같아요');
insert into tblWagleComment values (wgc_seq.nextVal, 9, 'umber012', TO_DATE('2023-06-07','YYYY-MM-DD'), '추억이 방울방울');
insert into tblWagleComment values (wgc_seq.nextVal, 10, 'lavender345', TO_DATE('2023-06-02','YYYY-MM-DD'), '진짜 쑥쑥 자라지 않나요?? 너무 대단해요');
insert into tblWagleComment values (wgc_seq.nextVal, 10, 'ebony678', TO_DATE('2023-06-06','YYYY-MM-DD'), '일어날때마다 커있어요 무서워요');
insert into tblWagleComment values (wgc_seq.nextVal, 10, 'pistachio901', TO_DATE('2023-06-07','YYYY-MM-DD'), '우리 애기는 커서 요리사가 될 거에요. 강아지라 실제로 될 순 없겠지만 그래도 노력은 해봤으면 좋겠어요');

-- 11~20
insert into tblWagleComment values (wgc_seq.nextVal, 11, 'fern890', TO_DATE('2023-06-06','YYYY-MM-DD'), '사랑해 미야옹~~!!.');
insert into tblWagleComment values (wgc_seq.nextVal, 11, 'peridot123', TO_DATE('2023-06-06','YYYY-MM-DD'), '나도 우리 아지 사랑해');
insert into tblWagleComment values (wgc_seq.nextVal, 11, 'straw456', TO_DATE('2023-06-07','YYYY-MM-DD'), '항상 자신감 넘치게!! 우리 나비 파이팅');
insert into tblWagleComment values (wgc_seq.nextVal, 12, 'flamingo789', TO_DATE('2023-06-07','YYYY-MM-DD'), '우리 애기의 꿈이 무엇이든지 나는 응원할거에요');
insert into tblWagleComment values (wgc_seq.nextVal, 12, 'ginger678', TO_DATE('2023-06-07','YYYY-MM-DD'), '우리 강아지가 원하는 건 내 양말을 훔쳐가는 것.');
insert into tblWagleComment values (wgc_seq.nextVal, 12, 'iris901', TO_DATE('2023-06-08','YYYY-MM-DD'), '우리 멍멍이의 꿈은 멀지 궁금해');
insert into tblWagleComment values (wgc_seq.nextVal, 13, 'hickory890', TO_DATE('2023-06-08','YYYY-MM-DD'), '우리 아이의 행복은 내 양말을 훔쳐가는 것');
insert into tblWagleComment values (wgc_seq.nextVal, 13, 'olive456', TO_DATE('2023-06-09','YYYY-MM-DD'), '우리 아이의 행복은......... 뭘까..? 지금 아무 생각없어 보여요');
insert into tblWagleComment values (wgc_seq.nextVal, 14, 'peacock789', TO_DATE('2023-06-10','YYYY-MM-DD'), '나도 강아지와 함께 탐험하고 싶어요');
insert into tblWagleComment values (wgc_seq.nextVal, 14, 'lavender345', TO_DATE('2023-06-10','YYYY-MM-DD'), '나도 후각이 뛰어났으면 얼마나 좋을까');
insert into tblWagleComment values (wgc_seq.nextVal, 14, 'walnut123', TO_DATE('2023-06-11','YYYY-MM-DD'), '더 큰 세계로 나가자 우리 똘이');
insert into tblWagleComment values (wgc_seq.nextVal, 15, 'chestnut901', TO_DATE('2023-06-10','YYYY-MM-DD'), '하 근데 놀아주는거 너무 힘들지 않나요');
insert into tblWagleComment values (wgc_seq.nextVal, 15, 'pecan890', TO_DATE('2023-06-11','YYYY-MM-DD'), '우리 강아지는 귀찮아서 장난을 안쳐요 힝 심심해');
insert into tblWagleComment values (wgc_seq.nextVal, 16, 'almond123', TO_DATE('2023-06-06','YYYY-MM-DD'), '두근두근~');
insert into tblWagleComment values (wgc_seq.nextVal, 16, 'peridot123', TO_DATE('2023-06-07','YYYY-MM-DD'), '추억 많이 쌓을 수 있을 때 많이 쌓아야겠어요');
insert into tblWagleComment values (wgc_seq.nextVal, 16, 'fern890', TO_DATE('2023-06-07','YYYY-MM-DD'), '며칠전에 우리 강아지가 개구리를 보고 먹을뻔했어요 큰일날뻔했슈');
insert into tblWagleComment values (wgc_seq.nextVal, 17, 'azure567', TO_DATE('2023-06-10','YYYY-MM-DD'), '쑥쑥 자라는 우리 애기.... 무서워요');
insert into tblWagleComment values (wgc_seq.nextVal, 17, 'quartz234', TO_DATE('2023-06-11','YYYY-MM-DD'), '일어서면 저랑 키가 똑같아요.. 커도 너무 많이 컸다');
insert into tblWagleComment values (wgc_seq.nextVal, 18, 'hickory890', TO_DATE('2023-06-06','YYYY-MM-DD'), '세상에서 우리 애기 발자국이 제일 귀여울거에요');
insert into tblWagleComment values (wgc_seq.nextVal, 18, 'olive456', TO_DATE('2023-06-07','YYYY-MM-DD'), '처음으로 산책나갔을 때가 기억나네요');
insert into tblWagleComment values (wgc_seq.nextVal, 18, 'umber012', TO_DATE('2023-06-07','YYYY-MM-DD'), '발 완전 한입거리');
insert into tblWagleComment values (wgc_seq.nextVal, 19, 'chestnut789', TO_DATE('2023-06-11','YYYY-MM-DD'), '사랑해 우리 멍멍이!');
insert into tblWagleComment values (wgc_seq.nextVal, 20, 'almond123', TO_DATE('2023-06-06','YYYY-MM-DD'), '항상 나만 바라보는 땅콩아... 나도 너만 볼께 사랑해');
insert into tblWagleComment values (wgc_seq.nextVal, 20, 'almond234', TO_DATE('2023-06-07','YYYY-MM-DD'), '우리 오복이는 나한테 너무 특별한 존재야');


-- 정보 공유
-- 21 ~ 30
insert into tblWagleComment values (wgc_seq.nextVal, 21, 'quartz234', TO_DATE('2023-06-03','YYYY-MM-DD'), '페르시안은 원래 털이 많이 빠져요.. 빗질 많이 해주세요.');
insert into tblWagleComment values (wgc_seq.nextVal, 21, 'lavender345', TO_DATE('2023-06-04','YYYY-MM-DD'), '[바비온 반려동물 브러쉬 장갑] 이거 제가 쓰고있는데 괜찮더라구요');
insert into tblWagleComment values (wgc_seq.nextVal, 22, 'ebony678', TO_DATE('2023-06-03','YYYY-MM-DD'), '치킨 모양 인형 되게 좋아하더라구요');
insert into tblWagleComment values (wgc_seq.nextVal, 22, 'pistachio901', TO_DATE('2023-06-03','YYYY-MM-DD'), '강아지들에게 최고의 장난감은... 주인의 양말입니다.');
insert into tblWagleComment values (wgc_seq.nextVal, 22, 'peacock789', TO_DATE('2023-06-03','YYYY-MM-DD'), '푸들이면 엄청 귀엽겠는데요.... 당신이 기꺼이 장난감이 되어 주세요');
insert into tblWagleComment values (wgc_seq.nextVal, 23, 'hickory890', TO_DATE('2023-06-03','YYYY-MM-DD'), '어떤 알러지가 있죠??? 어떤 알러지가 있는지에 따라서 레시피가 달라질 것 같아요~');
insert into tblWagleComment values (wgc_seq.nextVal, 23, 'taffy567', TO_DATE('2023-06-05','YYYY-MM-DD'), '저희 강아지도 알러지 있는데 저는 칠면조 가슴살 레시피 쳐서 그거 해서 우리집 강쥐 줬더니 되게 좋아하더라고요');
insert into tblWagleComment values (wgc_seq.nextVal, 24, 'almond890', TO_DATE('2023-06-03','YYYY-MM-DD'), '치와와는 피하세요. 최고의 지랄견입니다.');
insert into tblWagleComment values (wgc_seq.nextVal, 24, 'clover123', TO_DATE('2023-06-04','YYYY-MM-DD'), '푸들이나 말티즈가 괜찮을 듯요. 요새 퍼그도 인기가 많더라구요');
insert into tblWagleComment values (wgc_seq.nextVal, 25, 'pistachio901', TO_DATE('2023-06-03','YYYY-MM-DD'), '대리석 조각 하나 사놓으면 애기들이 정말 좋아해요');
insert into tblWagleComment values (wgc_seq.nextVal, 25, 'emerald345', TO_DATE('2023-06-03','YYYY-MM-DD'), '그래서 저희집은 하루종일 에어컨 틀어놓습니다..');
insert into tblWagleComment values (wgc_seq.nextVal, 26, 'lavender567', TO_DATE('2023-06-05','YYYY-MM-DD'), '저는 뜨개질이 취미라서 항상 공을 만들어서 놀아주는데 좋아해요');
insert into tblWagleComment values (wgc_seq.nextVal, 26, 'aqua789', TO_DATE('2023-06-07','YYYY-MM-DD'), '고양이들은 레이저만 쏴줘도 환장합니다.');
insert into tblWagleComment values (wgc_seq.nextVal, 27, 'emerald345', TO_DATE('2023-06-10','YYYY-MM-DD'), '유튜브에 강형욱님 훈련영상있는데 그거 보면서 따라하면 좋아요');
insert into tblWagleComment values (wgc_seq.nextVal, 27, 'indigo234', TO_DATE('2023-06-07','YYYY-MM-DD'), '골든리트리버면 말은 잘 들을테니 간식 주면서 차근차근하게 훈련해보세요');
insert into tblWagleComment values (wgc_seq.nextVal, 27, 'sapphire567', TO_DATE('2023-06-08','YYYY-MM-DD'), '훈련의 시작은 간식입니다. 간식 많이 주세옹.');
insert into tblWagleComment values (wgc_seq.nextVal, 28, 'topaz789', TO_DATE('2023-06-05','YYYY-MM-DD'), '일단 햄스터는 높은데 두지 마세요 고양이가 밟고 올라가요');
insert into tblWagleComment values (wgc_seq.nextVal, 28, 'beryl456', TO_DATE('2023-06-05','YYYY-MM-DD'), '고양이 생각보다 햄스터에 관심없어요');
insert into tblWagleComment values (wgc_seq.nextVal, 28, 'cinnamon789', TO_DATE('2023-06-06','YYYY-MM-DD'), '톰과 제리 실사판이네요');
insert into tblWagleComment values (wgc_seq.nextVal, 29, 'slate345', TO_DATE('2023-06-06','YYYY-MM-DD'), '책은 아닌데 유튜브에 강형욱의 보듬TV 좋아요');
insert into tblWagleComment values (wgc_seq.nextVal, 29, 'ruby678', TO_DATE('2023-06-07','YYYY-MM-DD'), '[애견 훈련 바이브]라는 책이 있는데 저는 이거보고 했어요');
insert into tblWagleComment values (wgc_seq.nextVal, 29, 'lavender234', TO_DATE('2023-06-07','YYYY-MM-DD'), '[애견 교육의 정석]이거 되게 좋아요');
insert into tblWagleComment values (wgc_seq.nextVal, 30, 'quartz234', TO_DATE('2023-06-05','YYYY-MM-DD'), '저는 항상 펫프렌즈에서 구매해요');
insert into tblWagleComment values (wgc_seq.nextVal, 30, 'ebony678', TO_DATE('2023-06-05','YYYY-MM-DD'), '여기 나눔게시판도 되게 좋던데요??');


-- 31 ~ 40
insert into tblWagleComment values (wgc_seq.nextVal, 31, 'almond890', TO_DATE('2023-06-04','YYYY-MM-DD'), '오호라 좋은 정보 공유 감사합니다!');
insert into tblWagleComment values (wgc_seq.nextVal, 31, 'pistachio345', TO_DATE('2023-06-05','YYYY-MM-DD'), '퍼즐 장난감 한번 해봐야겠네요');
insert into tblWagleComment values (wgc_seq.nextVal, 32, 'chestnut901', TO_DATE('2023-06-05','YYYY-MM-DD'), '해변 산책 진짜 좋아요 강아지가 엄청 좋아해요');
insert into tblWagleComment values (wgc_seq.nextVal, 32, 'pecan890', TO_DATE('2023-06-05','YYYY-MM-DD'), '우리 해피는 해변 산책만 가면 바다에 뛰어들어서 너무 힘들어요');
insert into tblWagleComment values (wgc_seq.nextVal, 33, 'walnut123', TO_DATE('2023-06-04','YYYY-MM-DD'), '스트레스 푸는데엔 개껌이 최고에요');
insert into tblWagleComment values (wgc_seq.nextVal, 33, 'almond890', TO_DATE('2023-06-05','YYYY-MM-DD'), '편한 환경을 제공하는게 생각보다 중요하더라구요');
insert into tblWagleComment values (wgc_seq.nextVal, 33, 'iris678', TO_DATE('2023-06-08','YYYY-MM-DD'), '좋은 정보 감사합니당');
insert into tblWagleComment values (wgc_seq.nextVal, 34, 'ebony678', TO_DATE('2023-06-08','YYYY-MM-DD'), '가을 나들이면 무조건 공원이죠');
insert into tblWagleComment values (wgc_seq.nextVal, 34, 'ruby678', TO_DATE('2023-06-09','YYYY-MM-DD'), '단풍잎있는 산책로에서 산책하면 분위기도 좋고 사진찍기도 좋아요');
insert into tblWagleComment values (wgc_seq.nextVal, 35, 'chestnut567', TO_DATE('2023-06-04','YYYY-MM-DD'), '발톱 관리 참 중요하죠');
insert into tblWagleComment values (wgc_seq.nextVal, 35, 'almond890', TO_DATE('2023-06-05','YYYY-MM-DD'), '좋은 정보 감사합니당');
insert into tblWagleComment values (wgc_seq.nextVal, 36, 'pecan456', TO_DATE('2023-06-06','YYYY-MM-DD'), '우리 아이가 알러지가 있는지 꼭 확인하는것도 중요합니다. ');
insert into tblWagleComment values (wgc_seq.nextVal, 36, 'ruby678', TO_DATE('2023-06-06','YYYY-MM-DD'), '쿠팡에 사료 이상한거 많이 파니까 주의하세요 다들');
insert into tblWagleComment values (wgc_seq.nextVal, 37, 'ebony012', TO_DATE('2023-06-06','YYYY-MM-DD'), '애정 많이 주세요');
insert into tblWagleComment values (wgc_seq.nextVal, 37, 'iris901', TO_DATE('2023-06-06','YYYY-MM-DD'), '많이많이 쓰다듬어 주는게 중요해요');
insert into tblWagleComment values (wgc_seq.nextVal, 38, 'buttercup012', TO_DATE('2023-06-07','YYYY-MM-DD'), '가을 나들이면 무조건 공원이죠');
insert into tblWagleComment values (wgc_seq.nextVal, 38, 'azure567', TO_DATE('2023-06-08','YYYY-MM-DD'), '단풍 구경 최고에요!!!');
insert into tblWagleComment values (wgc_seq.nextVal, 39, 'flamingo789', TO_DATE('2023-06-09','YYYY-MM-DD'), '저는 우리애기 사진찍어주는게 취미입니다요');
insert into tblWagleComment values (wgc_seq.nextVal, 39, 'plum345', TO_DATE('2023-06-09','YYYY-MM-DD'), '애완동물용 가을 의상이 있나요? 너무 귀엽겠당');
insert into tblWagleComment values (wgc_seq.nextVal, 40, 'quartz234', TO_DATE('2023-06-08','YYYY-MM-DD'), '단풍잎 흩어져있는 거리에 강아지들이 모인거 봤는데 너무 귀여웠어요');
insert into tblWagleComment values (wgc_seq.nextVal, 40, 'ebony678', TO_DATE('2023-06-09','YYYY-MM-DD'), '애완동물 동반가능한 가을축제 있는데 그런데 정말 좋아요');
insert into tblWagleComment values (wgc_seq.nextVal, 40, 'iris234', TO_DATE('2023-06-09','YYYY-MM-DD'), '가을 축제는 애완동물도 좋아하죠.');


-- 나눔
-- 41 ~ 50
insert into tblWagleComment values (wgc_seq.nextVal, 41, 'ginger678', TO_DATE('2023-06-06','YYYY-MM-DD'), '저요!!!!!!');
insert into tblWagleComment values (wgc_seq.nextVal, 41, 'quartz234', TO_DATE('2023-06-07','YYYY-MM-DD'), '저 주세요');
insert into tblWagleComment values (wgc_seq.nextVal, 41, 'walnut456', TO_DATE('2023-06-07','YYYY-MM-DD'), '앗싸 마지막 저요');
insert into tblWagleComment values (wgc_seq.nextVal, 42, 'peridot123', TO_DATE('2023-06-08','YYYY-MM-DD'), '밥 그릇 예쁘네요 저 주세요');
insert into tblWagleComment values (wgc_seq.nextVal, 42, 'chestnut901', TO_DATE('2023-06-09','YYYY-MM-DD'), '1개만 나눔하나요??');
insert into tblWagleComment values (wgc_seq.nextVal, 43, 'sapphire567', TO_DATE('2023-06-08','YYYY-MM-DD'), '장난감 저 주세요');
insert into tblWagleComment values (wgc_seq.nextVal, 44, 'garnet890', TO_DATE('2023-06-08','YYYY-MM-DD'), '제가 찾고있는 사료였는데 저 주세요. 아 제가 먹을건 아니구요');
insert into tblWagleComment values (wgc_seq.nextVal, 45, 'vermilion123', TO_DATE('2023-06-08','YYYY-MM-DD'), '캣타워 저 주세요');
insert into tblWagleComment values (wgc_seq.nextVal, 45, 'beryl456', TO_DATE('2023-06-09','YYYY-MM-DD'), '캣타워 저거 튼튼한가요??');
insert into tblWagleComment values (wgc_seq.nextVal, 46, 'azure567', TO_DATE('2023-06-07','YYYY-MM-DD'), '우리애기 스크레처 필요해요 주세요');
insert into tblWagleComment values (wgc_seq.nextVal, 46, 'fern890', TO_DATE('2023-06-08','YYYY-MM-DD'), '사용감이 있나요?');
insert into tblWagleComment values (wgc_seq.nextVal, 47, 'straw456', TO_DATE('2023-06-09','YYYY-MM-DD'), '무슨 냄새에요??');
insert into tblWagleComment values (wgc_seq.nextVal, 47, 'plum345', TO_DATE('2023-06-10','YYYY-MM-DD'), '일단 저 주세요!!');
insert into tblWagleComment values (wgc_seq.nextVal, 48, 'azure567', TO_DATE('2023-06-07','YYYY-MM-DD'), '선착순 몇명이요?? 일단 저요');
insert into tblWagleComment values (wgc_seq.nextVal, 48, 'fern890', TO_DATE('2023-06-08','YYYY-MM-DD'), '머야머야 나도 줘요');
insert into tblWagleComment values (wgc_seq.nextVal, 49, 'straw456', TO_DATE('2023-06-09','YYYY-MM-DD'), '강: 강사합니다~ 아 : 아~ 고맙습니다 지 : 지금 저 주세요');
insert into tblWagleComment values (wgc_seq.nextVal, 49, 'plum345', TO_DATE('2023-06-10','YYYY-MM-DD'), '강 : 강아지 이놈자식아 아 : 아이고 지 : 지겹다지겨워');
insert into tblWagleComment values (wgc_seq.nextVal, 50, 'flamingo789', TO_DATE('2023-06-07','YYYY-MM-DD'), '사람껀 아니죠??');
insert into tblWagleComment values (wgc_seq.nextVal, 50, 'walnut456', TO_DATE('2023-06-07','YYYY-MM-DD'), '제가 가지고 싶어요 저 도넛방석 필요해요.');

-- tblVeterinarian(수의사 회원)
insert into tblVeterinarian (vet_seq, vet_clinic, vet_major, vet_address, vet_addressdetail) values ('chestnut789', '차지우동물병원', '강아지', '서울특별시 강서구 강서로62길 10', ' 한울빌딩 1층 (등촌동)');
insert into tblVeterinarian (vet_seq, vet_clinic, vet_major, vet_address, vet_addressdetail) values ('ebony012', '박동물병원', '고양이', '서울특별시 강서구 강서로 333', ' 104호 105호 (내발산동)');
insert into tblVeterinarian (vet_seq, vet_clinic, vet_major, vet_address, vet_addressdetail) values ('pistachio345', '페토피아종합동물병원', '고양이', '서울특별시 송파구 오금로 203', ' 남양빌딩 (방이동)');
insert into tblVeterinarian (vet_seq, vet_clinic, vet_major, vet_address, vet_addressdetail) values ('iris678', '24시 애니동물병원', '파충류', '서울특별시 성북구 보문로 99 (보문동5가)', '.');
insert into tblVeterinarian (vet_seq, vet_clinic, vet_major, vet_address, vet_addressdetail) values ('chestnut901', '피카소동물병원', '강아지', '서울특별시 강동구 고덕로83길 32', ' 2층 (고덕동)');
insert into tblVeterinarian (vet_seq, vet_clinic, vet_major, vet_address, vet_addressdetail) values ('almond234', '홍상희동물병원', '강아지', '서울특별시 중랑구 동일로 899', ' 1층 (묵동)');
insert into tblVeterinarian (vet_seq, vet_clinic, vet_major, vet_address, vet_addressdetail) values ('walnut567', '유케어종합동물병원', '고양이', '서울특별시 동작구 상도로 214', ' 성은빌딩 1층 (상도동)');
insert into tblVeterinarian (vet_seq, vet_clinic, vet_major, vet_address, vet_addressdetail) values ('pecan890', '에스동물병원', '고양이', '서울특별시 용산구 서빙고로 17', ' 헤링턴스퀘어 센트럴파크 몰동 1146, 1147호 (한강로3가)');
insert into tblVeterinarian (vet_seq, vet_clinic, vet_major, vet_address, vet_addressdetail) values ('almond123', '대성동물약품병원', '조류', '서울특별시 강남구 논현로28길 37', ' 보석빌딩 202호 (도곡동)');
insert into tblVeterinarian (vet_seq, vet_clinic, vet_major, vet_address, vet_addressdetail) values ('walnut456', '도담동물병원', '강아지', '서울특별시 도봉구 도봉로 875 (도봉동)', '.');


-- tblVetCareer(수의사경력)
insert into tblVetCareer (vc_seq, vet_seq, vc_content) values (vc_seq.nextVal, 'chestnut789', '서울대학교 수의과학연구소');
insert into tblVetCareer (vc_seq, vet_seq, vc_content) values (vc_seq.nextVal, 'ebony012', '서울대학교 수의과대학');
insert into tblVetCareer (vc_seq, vet_seq, vc_content) values (vc_seq.nextVal, 'pistachio345', '서울대학교 동물의료센터 진료수의사');
insert into tblVetCareer (vc_seq, vet_seq, vc_content) values (vc_seq.nextVal, 'iris678', '서울대 수의학과 대학원 석사');
insert into tblVetCareer (vc_seq, vet_seq, vc_content) values (vc_seq.nextVal, 'chestnut901', '서울대 수의학과 대학원 박사');
insert into tblVetCareer (vc_seq, vet_seq, vc_content) values (vc_seq.nextVal, 'almond234', '서울대학교 수의과학연구소');
insert into tblVetCareer (vc_seq, vet_seq, vc_content) values (vc_seq.nextVal, 'walnut567', '서울대학교 수의과대학');
insert into tblVetCareer (vc_seq, vet_seq, vc_content) values (vc_seq.nextVal, 'pecan890', '서울대학교 동물의료센터 진료수의사');
insert into tblVetCareer (vc_seq, vet_seq, vc_content) values (vc_seq.nextVal, 'almond123', '서울대 수의학과 대학원 석사');
insert into tblVetCareer (vc_seq, vet_seq, vc_content) values (vc_seq.nextVal, 'walnut456', '서울대 수의학과 대학원 박사');

-- tblVetQnA(수의사QnA)
insert into tblVetQnA (vq_seq, vq_writer, vq_subject, vq_prefix, vq_content, vq_regdate, vq_readcount) values (vq_seq.nextVal, 'walnut234', 'QnA Test', 1, 'QnA Test', '2023-02-14', 50);
insert into tblVetQnA (vq_seq, vq_writer, vq_subject, vq_prefix, vq_content, vq_regdate, vq_readcount) values (vq_seq.nextVal, 'pecan567', 'QnA Test', 2, 'QnA Test', '2023-03-15', 34);
insert into tblVetQnA (vq_seq, vq_writer, vq_subject, vq_prefix, vq_content, vq_regdate, vq_readcount) values (vq_seq.nextVal, 'wain1719', 'QnA Test', 1, 'QnA Test', '2023-04-15', 15);
insert into tblVetQnA (vq_seq, vq_writer, vq_subject, vq_prefix, vq_content, vq_regdate, vq_readcount) values (vq_seq.nextVal, 'happy012', 'QnA Test', 2, 'QnA Test', '2023-05-15', 12);
insert into tblVetQnA (vq_seq, vq_writer, vq_subject, vq_prefix, vq_content, vq_regdate, vq_readcount) values (vq_seq.nextVal, 'pineappe4', 'QnA Test', 3, 'QnA Test', '2023-06-15', 19);

-- tblVQReply(수의사 답글)
insert into tblVQReply (vqr_seq, vq_seq, vet_seq, vqr_regdate, vqr_content) values (vqr_seq.nextVal, 1, 'chestnut789', '2023-03-15', '수의사 QnA 답변입니다.');
insert into tblVQReply (vqr_seq, vq_seq, vet_seq, vqr_regdate, vqr_content) values (vqr_seq.nextVal, 2, 'ebony012', '2023-04-15', '수의사 QnA 답변입니다.');
insert into tblVQReply (vqr_seq, vq_seq, vet_seq, vqr_regdate, vqr_content) values (vqr_seq.nextVal, 3, 'pistachio345', '2023-05-15', '수의사 QnA 답변입니다.');
insert into tblVQReply (vqr_seq, vq_seq, vet_seq, vqr_regdate, vqr_content) values (vqr_seq.nextVal, 4, 'iris678', '2023-06-15', '수의사 QnA 답변입니다.');
insert into tblVQReply (vqr_seq, vq_seq, vet_seq, vqr_regdate, vqr_content) values (vqr_seq.nextVal, 5, 'chestnut901', '2023-07-16', '수의사 QnA 답변입니다.');

-- tblVQRComment(수의사 답글 댓글)
insert into tblVQRComment (vqrc_seq, vqr_seq, vqrc_writer, vqrc_content) values (vqrc_seq.nextVal, 6, 'walnut234', '수의사 답글 댓글');
insert into tblVQRComment (vqrc_seq, vqr_seq, vqrc_writer, vqrc_content) values (vqrc_seq.nextVal, 7, 'pecan567', '수의사 답글 댓글');
insert into tblVQRComment (vqrc_seq, vqr_seq, vqrc_writer, vqrc_content) values (vqrc_seq.nextVal, 8, 'wain1719', '수의사 답글 댓글');
insert into tblVQRComment (vqrc_seq, vqr_seq, vqrc_writer, vqrc_content) values (vqrc_seq.nextVal, 9, 'happy012', '수의사 답글 댓글');
insert into tblVQRComment (vqrc_seq, vqr_seq, vqrc_writer, vqrc_content) values (vqrc_seq.nextVal, 10, 'pineappe4', '수의사 답글 댓글');

-- tblBanner(배너)
insert into tblBanner values ('banner_01.png');
insert into tblBanner values ('banner_02.png');
insert into tblBanner values ('banner_03.png');
insert into tblBanner values ('banner_04.png');
insert into tblBanner values ('banner_05.png');
insert into tblBanner values ('logo_01.png');
insert into tblBanner values ('logo_02.png');
insert into tblBanner values ('logo_03.png');
insert into tblBanner values ('logo_04.png');

-- tblInquiry(고객센터문의내역)
Insert into ADMIN.TBLINQUIRY (IN_SEQ,IN_WRITER,IN_SUBJECT,IN_PREFIX,IN_CONTENT,IN_REGDATE) values (9,'pecan789','페이지가 로딩이 너무 느려요',2,'페이지 로딩이 너무 느려요 해결좀 해주세요',to_date('22/06/09','RR/MM/DD'));
Insert into ADMIN.TBLINQUIRY (IN_SEQ,IN_WRITER,IN_SUBJECT,IN_PREFIX,IN_CONTENT,IN_REGDATE) values (14,'almond012','관리자님 게시판 만들어주세요',2,'칩 등록 강아지 지도에 표시하는 게시판 만들어주세요',to_date('22/09/12','RR/MM/DD'));
Insert into ADMIN.TBLINQUIRY (IN_SEQ,IN_WRITER,IN_SUBJECT,IN_PREFIX,IN_CONTENT,IN_REGDATE) values (15,'walnut345','데이터 표시 오류',2,'조회한 데이터가 올바르게 표시되지 않습니다. 확인 부탁드립니다.',to_date('22/11/14','RR/MM/DD'));
Insert into ADMIN.TBLINQUIRY (IN_SEQ,IN_WRITER,IN_SUBJECT,IN_PREFIX,IN_CONTENT,IN_REGDATE) values (16,'walnut345','접속 문제',2,'접속 시도 시 오류가 발생하여 페이지에 접근할 수 없습니다. 확인해주세요.',to_date('23/01/05','RR/MM/DD'));
Insert into ADMIN.TBLINQUIRY (IN_SEQ,IN_WRITER,IN_SUBJECT,IN_PREFIX,IN_CONTENT,IN_REGDATE) values (17,'pecan567','데이터 누락 현상',2,'특정 데이터가 누락되어 표시되지 않고 있습니다. 복구 방법을 안내해주세요.',to_date('23/04/11','RR/MM/DD'));
Insert into ADMIN.TBLINQUIRY (IN_SEQ,IN_WRITER,IN_SUBJECT,IN_PREFIX,IN_CONTENT,IN_REGDATE) values (18,'wain1719','비밀번호 초기화 문의',2,'비밀번호를 잊어서 초기화를 요청하려고 합니다. 도움이 필요합니다.',to_date('23/05/18','RR/MM/DD'));
Insert into ADMIN.TBLINQUIRY (IN_SEQ,IN_WRITER,IN_SUBJECT,IN_PREFIX,IN_CONTENT,IN_REGDATE) values (19,'bean0456','문의 사항 확인 요청',2,'이전에 문의한 사항에 대한 답변이 없어서 확인 요청드립니다. 답변 부탁드립니다.',to_date('23/05/31','RR/MM/DD'));

-- tblINAnswer(문의 답변)
insert into tblINAnswer(ina_seq, in_seq, ina_content, ina_regdate, a_id) values(ina_seq.nextVal, 9, '안녕하세요 고객님. 애니밍글입니다.\n먼저 페이지 로딩이 느려서 불편함을 드려 죄송합니다.\n빠르게 조치하여 해결하였습니다.\n감사합니다.', TO_DATE('2022-06-12', 'YYYY-MM-DD'),'admin1');
insert into tblINAnswer(ina_seq, in_seq, ina_content, ina_regdate, a_id) values(ina_seq.nextVal, 14, '안녕하세요 고객님. 애니밍글입니다.\n칩 등록 강아지를 지도에 표시한다는 의미를 명확하게 이해하지 못했습니다.\n조금더 자세히 설명해주시면 반영하겠습니다.\n감사합니다.', TO_DATE('2022-09-17', 'YYYY-MM-DD'),'admin3');
insert into tblINAnswer(ina_seq, in_seq, ina_content, ina_regdate, a_id) values(ina_seq.nextVal, 15, '안녕하세요 고객님. 애니밍글입니다.\n현재 데이터가 정상적으로 표시되는 것으로 확인됩니다.\n감사합니다.', TO_DATE('2022-11-20', 'YYYY-MM-DD'),'admin2');
insert into tblINAnswer(ina_seq, in_seq, ina_content, ina_regdate, a_id) values(ina_seq.nextVal, 16, '안녕하세요 고객님. 애니밍글입니다.\n확인 결과 모든 페이지에 정상적으로 접근됩니다.\n여전히 접근이 어려우시다면 해당 화면을 캡쳐하여 다시 문의 부탁드립니다.\n감사합니다.', TO_DATE('2023-01-06', 'YYYY-MM-DD'),'admin5');
insert into tblINAnswer(ina_seq, in_seq, ina_content, ina_regdate, a_id) values(ina_seq.nextVal, 17, '안녕하세요 고객님. 애니밍글입니다.\n특정 데이터가 누락되어 표시되지 않는다고 하셨는데, 혹시 어떤 데이터가 누락되어 표시되지 않으실까요?\n다시 문의해주시면 복구 방법을 안내드리겠습니다.\n감사합니다.', TO_DATE('2023-04-14', 'YYYY-MM-DD'),'admin7');
insert into tblINAnswer(ina_seq, in_seq, ina_content, ina_regdate, a_id) values(ina_seq.nextVal, 18, '안녕하세요 고객님. 애니밍글입니다.\n개인정보 확인 후 초기화가 가능합니다.\n02-5412-4565로 연락주시면 확인 후 초기화해드리겠습니다.\n감사합니다.', TO_DATE('2023-05-23', 'YYYY-MM-DD'),'admin4');
insert into tblINAnswer(ina_seq, in_seq, ina_content, ina_regdate, a_id) values(ina_seq.nextVal, 19, '안녕하세요 고객님. 애니밍글입니다.\n이전에 문의주신 사항이 없는 것으로 확인됩니다.\n확인 후 다시 문의 부탁드립니다.\n감사합니다.\n', TO_DATE('2023-06-01', 'YYYY-MM-DD'),'admin6');

commit;