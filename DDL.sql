----------------------- 테이블 생성 ----------------------------------------

-- 관리자
CREATE TABLE tblAdmin (
	a_id varchar2(30) PRIMARY KEY,
	a_pw varchar2(30) NOT NULL,
	a_name varchar2(30) NOT NULL,
	a_tel varchar2(15) NOT NULL,
	a_nickname varchar2(50) NOT NULL
);

-- 회원
CREATE TABLE tblUser (
   user_id VARCHAR2(30) PRIMARY KEY,
   user_pw VARCHAR2(30) NOT NULL,
   user_name VARCHAR2(30) NOT NULL,
   user_address VARCHAR2(500) NOT NULL,
   user_addressdetail varchar2(500) NOT NULL,
   user_tel varchar2(15) NOT NULL,
   user_email varchar2(100) NOT NULL,
   user_nickname varchar2(50) NOT NULL,
   user_animalnum varchar2(50) NULL,
   user_birth DATE NOT NULL,
   user_pic varchar2(300) NOT NULL
);

-- 펫시터 회원
CREATE TABLE tblPetsitter (
	ps_id VARCHAR2(30) PRIMARY KEY,
	ps_pic varchar2(300) NOT NULL,
	ps_intro varchar2(3000) NOT NULL,
	ps_authdate date NOT NULL,
	ps_idcard varchar2(300) NOT NULL,
	ps_crime varchar2(300) NOT NULL
);

-- 펫시터모집게시글
CREATE TABLE tblPSRecruitment (
	psr_seq number PRIMARY KEY,
    psr_writer VARCHAR2(30) REFERENCES tblUser(user_id),
	psr_subject varchar2(100) NOT NULL,
	psr_content varchar2(3000) NOT NULL,
	psr_fromdate date NOT NULL,
	psr_todate date NOT NULL,
	psr_region varchar2(50) NOT NULL,
	psr_state varchar2(20) NOT NULL,
	psr_regdate date NOT NULL,
	psr_readcount number NOT NULL
);

-- 펫시터신청/모집내역
CREATE TABLE tblPSApply (
	psa_seq number PRIMARY KEY,
	ps_id VARCHAR2(30) REFERENCES tblPetsitter(ps_id),
	psr_seq number REFERENCES tblPSRecruitment(psr_seq),
	psa_applydate date NOT NULL,
	psa_adoptdate date NULL
);

-- 펫시터로그
CREATE TABLE tblPSLog (
	pslog_seq number PRIMARY KEY,
	pslog_rate number NOT NULL,
	psa_seq number REFERENCES tblPSApply(psa_seq)
);

-- 채팅
CREATE TABLE tblChat (
   chat_seq NUMBER NOT NULL,
   message varchar2(1000) NOT NULL,
   timestamp date NOT NULL,
   sender_id VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   receiver_id VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id)
);


-- 고객센터문의내역
CREATE TABLE tblInquiry (
   in_seq number PRIMARY KEY,
   in_writer VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   in_subject varchar2(100) NOT NULL,
   in_prefix number NOT NULL,
   in_content varchar2(3000) NOT NULL,
   in_regdate date NOT NULL
);


-- 문의 답변
CREATE TABLE tbINAnswer (
   ina_seq NUMBER NOT NULL PRIMARY KEY,
   in_seq number NOT NULL REFERENCES tblInquiry(in_seq),
   ina_content varchar2(3000) NOT NULL,
   ina_regdate date NOT NULL,
    a_id VARCHAR2(30) NOT NULL REFERENCES tblAdmin(a_id)
);

-- 약국 리뷰
CREATE TABLE tblPReview (
   pr_seq NUMBER PRIMARY KEY,
   pr_writer VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   pr_num number NOT NULL,
   pr_rate number NOT NULL,
   pr_content varchar2(300) NOT NULL,
   pr_tag1 varchar2(1) NULL,
   pr_tag2 varchar2(1) NULL,
   pr_tag3 varchar2(1) NULL,
   pr_tag4 varchar2(1) NULL,
   pr_tag5 varchar2(1) NULL,
   pr_regdate date NOT NULL,
   pr_receipt varchar2(300) NOT NULL
);

-- 병원 리뷰
CREATE TABLE tblHReview (
   hr_seq NUMBER PRIMARY KEY,
   hr_writer VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   hr_num number NOT NULL,
   hr_rate number NOT NULL,
   hr_content varchar2(300) NOT NULL,
   hr_tag1 varchar2(1) NULL,
   hr_tag2 varchar2(1) NULL,
   hr_tag3 varchar2(1) NULL,
   hr_tag4 varchar2(1) NULL,
   hr_tag5 varchar2(1) NULL,
   hr_regdate date NOT NULL,
   hr_receipt varchar2(300) NOT NULL
);


-- 와글와글 게시글
CREATE TABLE tblWagle (
   wg_seq number PRIMARY KEY,
   wg_prefix number NOT NULL,
   wg_subject varchar2(100) NOT NULL,
   wg_content varchar2(3000) NOT NULL,
   wg_regdate date NOT NULL,
   wg_writer VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   wg_readcount number NOT NULL
);



-- 와글와글 댓글
CREATE TABLE tblWagleComment (
   wgc_seq NUMBER PRIMARY KEY,
   wg_seq number NOT NULL REFERENCES tblWagle(wg_seq),
   wgc_writer VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   wgc_regdate date NOT NULL,
   wgc_content varchar2(500) NOT NULL
);


-- 우리가족을 찾아주세요 게시글
CREATE TABLE tblFindFamily (
   ff_seq number PRIMARY KEY,
   ff_wrtier VARCHAR2(30) NOT NULL  REFERENCES tblUser(user_id),
   ff_prefix number NOT NULL,
   ff_subject varchar2(100) NOT NULL,
   ff_content varchar2(3000) NOT NULL,
   ff_lat number NOT NULL,
   ff_lng number NOT NULL,
   ff_regdate date NOT NULL
);


-- 우리 가족을 찾아주세요 댓글
CREATE TABLE tblFFComment (
   ffc_seq NUMBER PRIMARY KEY,
   ff_seq number NOT NULL  REFERENCES tblFindFamily(ff_seq),
   ffc_writer VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   ffc_content varchar2(500) NOT NULL,
   ffc_regdate date NOT NULL
);


-- 너네 가족 여기서 봤어요
CREATE TABLE tblYourFamily (
   yf_seq NUMBER PRIMARY KEY,
   ff_seq number NOT NULL REFERENCES tblFindFamily(ff_seq),
   yf_lat number NOT NULL,
   yf_lng number NOT NULL,
   yf_content varchar2(3000) NOT NULL,
   yf_writer VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id)
);


-- 산책 친구 구하기 게시글
CREATE TABLE tblWalkTogether (
   wt_seq NUMBER PRIMARY KEY,
   wt_wrtier VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   wt_subject varchar(100) NOT NULL,
   wt_petkind varchar2(50) NOT NULL,
   wt_time varchar2(100) NOT NULL,
   wt_content varchar2(3000) NOT NULL,
   wt_regdate date NOT NULL
);


-- 산책친구 경로 정보
CREATE TABLE tblWTPath (
   wtp_seq NUMBER PRIMARY KEY,
   wt_seq number NOT NULL  REFERENCES tblWalkTogether(wt_seq),
   wtp_lat number NOT NULL,
   wtp_lng number NOT NULL,
   wtp_order number NOT NULL
);



-- 수의사회원
CREATE TABLE tblVeterinarian (
   vet_seq VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   vet_clinic varchar2(100) NOT NULL,
   vet_major varchar2(100) NOT NULL,
   vet_address varchar2(500) NOT NULL,
   vet_addressdetail varchar2(500) NOT NULL
);


-- 수의사 Q&A 게시글
CREATE TABLE tblVetQnA (
   vq_seq number PRIMARY KEY,
   vq_writer VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   vq_subject varchar2(100) NOT NULL,
   vq_prefix number NOT NULL,
   vq_content varchar2(3000) NOT NULL,
   vq_regdate date NOT NULL,
   vq_readcount number NOT NULL
);

-- 수의사 경력
CREATE TABLE tblVetCareer (
   vc_seq NUMBER PRIMARY KEY,
   vet_seq VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   vc_content varchar2(1000) NULL
);


-- 수의사 Q&A 답글
CREATE TABLE tblVQReply (
   vqr_seq number PRIMARY KEY,
   vq_seq number NOT NULL REFERENCES tbVetQnA(vq_seq),
   vet_seq VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   vqr_regdate date NOT NULL,
   vqr_content varchar2(3000) NOT NULL
);


-- 수의사 Q&A 답글의 댓글
CREATE TABLE tblVQRComment (
   vqrc_seq NUMBER PRIMARY KEY,
   vqr_seq number NOT NULL REFERENCES tblVQReply(vqr_seq),
   vqrc_writer VARCHAR2(30) NOT NULL REFERENCES tblUser(user_id),
   vqrc_content varchar2(500) NOT NULL
);
    
-- 배너
CREATE TABLE tblBanner (
   filename VARCHAR2(200) PRIMARY KEY
);

drop table tblBanner;

------------------------------------- Sequence 문 ----------------------------------------

--채팅, 문의내역
CREATE SEQUENCE chat_seq;
CREATE SEQUENCE in_seq;
CREATE SEQUENCE ina_seq;

--병원, 약국
CREATE SEQUENCE pr_seq;
CREATE SEQUENCE hr_seq;

-- 와글
CREATE SEQUENCE wg_seq;
CREATE SEQUENCE wgc_seq;

-- 우리가족
CREATE SEQUENCE ff_seq;
CREATE SEQUENCE ffc_seq;
CREATE SEQUENCE yf_seq;

-- 산책 친구
CREATE SEQUENCE wt_seq;
CREATE SEQUENCE wtp_seq;

-- 수의사
CREATE SEQUENCE vet_seq;
CREATE SEQUENCE vq_seq;
CREATE SEQUENCE vqr_seq;
CREATE SEQUENCE vqrc_seq;
CREATE SEQUENCE vc_seq;

-- 펫시터
CREATE SEQUENCE psa_seq;
CREATE SEQUENCE psr_seq;
CREATE SEQUENCE pslog_seq;
