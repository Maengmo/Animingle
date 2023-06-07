package com.sist.animingle.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class UserDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserDAO() {
		this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
	}
	
	//로그인 - 1)일반 회원 로그인
	public UserDTO login(UserDTO dto) {
		try {

			String sql = "select * from tblUser where user_id = ? and user_pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getUser_id());
			pstat.setString(2, dto.getUser_pw());

			rs = pstat.executeQuery();

			if (rs.next()) {
				UserDTO result = new UserDTO();
				result.setUser_id(rs.getString("user_id"));
				result.setUser_nickname(rs.getString("user_nickname"));

				
				
				return result;
				
			}
			
			pstat.close();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	//로그인 - 2)관리자 로그인
	public UserDTO login_admin(UserDTO dto) {
		try {

			String sql = "select * from tblAdmin where a_id = ? and a_pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getUser_id());
			pstat.setString(2, dto.getUser_pw());

			rs = pstat.executeQuery();

			if (rs.next()) {
				UserDTO result = new UserDTO();
				result.setUser_id(rs.getString("a_id"));
				result.setUser_nickname(rs.getString("a_nickname"));
				result.setIsAdmin("Y");
				
				return result;
			}
			
			pstat.close();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	//로그인 - 3)펫시터 체크
	public int checkPetsitter(String id) {
		
		try {
		
			String sql = "select count(*) as petsitter from tblUser u inner join tblpetsitter pet on u.user_id = pet.ps_id where u.user_id = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getInt("petsitter");
			}
			
			pstat.close();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}
	
	
	//로그인 - 4)수의사 체크
		public int checkVet(String id) {
			
			try {
			
				String sql = "select count(*) as vet from tblUser u inner join tblveterinarian vet on u.user_id = vet.vet_seq where u.user_id = ?";

				pstat = conn.prepareStatement(sql);

				pstat.setString(1, id);

				rs = pstat.executeQuery();

				if (rs.next()) {
					return rs.getInt("vet");
				}
				
				pstat.close();
				rs.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return 0;
			
		}
	
	
	//소셜 로그인 - 카카오 : user 있는지 확인
	public int kakaoUserCheck(UserDTO dto) {
		try {

			String sql = "select count(*) as kakaoUser from tblUser where user_id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getUser_id());
			pstat.setString(2, dto.getUser_nickname());

			rs = pstat.executeQuery();

			if (rs.next()) {
				return rs.getInt("kakaoUser");
			}
			
			
			pstat.close();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;

	}
	
	
	//소셜 로그인 - 카카오 : user로 로그인
	public UserDTO kakaoUserLogin(UserDTO dto) {
		
		try {

			String sql = "select * from tblUser where user_id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getUser_id());

			rs = pstat.executeQuery();

			if (rs.next()) {
				UserDTO result = new UserDTO();
				result.setUser_id(rs.getString("user_id"));
				result.setUser_nickname(rs.getString("user_nickname"));

				return result;
				
			}
			
			pstat.close();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	//소셜 로그인 - 카카오 : user 테이블에 user 등록
	public int kakaoUserJoin(UserDTO dto) {
		
		try {

			String sql = "insert into tblUser (user_id, user_pw, user_name, user_address, user_addressdetail, user_tel, user_email, user_nickname, user_birth, user_animal, user_pic) values (?, ?, ?, '.', '.', '.', ?, ?,  '.',  'n', ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getUser_id());
		
			//비밀번호 숫자 랜덤
			String randomPw = String.valueOf((int)Math.random()*1000);
			pstat.setString(2, randomPw);
			pstat.setString(3, dto.getUser_nickname()); //name도 nickname으로 기본 설정
			pstat.setString(4, dto.getUser_email());
			pstat.setString(5, dto.getUser_nickname());
			pstat.setString(6, dto.getUser_pic());
			

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;

		
	}

		
	
	//회원가입 - 1. 아이디 중복 체크(User)
	public int checkId(String id) {
		
			
		try {

			String sql = "select count(*) as idCnt from tblUser where user_id = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {

				return rs.getInt("idCnt");
			}
			
			pstat.close();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	
	//회원가입 - 1. 아이디 중복 체크(admin)
	public int checkId_admin(String id) {
		
			
		try {

			String sql = "select count(*) as idCnt from tbladmin where a_id = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {

				return rs.getInt("idCnt");
			}
			
			pstat.close();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}

	
	//회원가입 - 2. 가입하기
	public int userJoin(UserDTO dto) {
		
		try {

			String sql = "insert into tblUser (user_id, user_pw, user_name, user_address, user_addressdetail, user_tel, user_email, user_nickname, user_birth, user_animal, user_pic) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getUser_id());
			pstat.setString(2, dto.getUser_pw());
			pstat.setString(3, dto.getUser_name());
			pstat.setString(4, dto.getUser_address());
			pstat.setString(5, dto.getUser_addressdetail());
			pstat.setString(6, dto.getUser_tel());
			pstat.setString(7, dto.getUser_email());
			pstat.setString(8, dto.getUser_nickname());
			pstat.setString(9, dto.getUser_birth());
			pstat.setString(10, dto.getUser_animal());
			pstat.setString(11, dto.getUser_pic());
			

			return pstat.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	}
	
	
	//user_profile
	public UserDTO getUserInfo(String id) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "select * from tblUser where user_id = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {
				UserDTO dto = new UserDTO();

				dto.setUser_pw(rs.getString("user_pw"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_address(rs.getString("user_address"));
				dto.setUser_addressdetail(rs.getString("user_addressdetail"));
				dto.setUser_tel(rs.getString("user_tel"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setUser_animalnum(rs.getString("user_animalnum"));
				dto.setUser_birth(rs.getString("user_birth"));
				dto.setUser_pic(rs.getString("user_pic"));
				
				rs.close();
				pstat.close();
				conn.close();

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return null;
	}

	public int editUserPic(UserDTO dto) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "update tblUser set user_pic = ? where user_id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getUser_pic());
			pstat.setString(2, dto.getUser_id());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();

			return result;

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}

	public VeterinarianDTO getVetInfo(String id) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "select v.*, u.user_name as vet_name, u.user_pic as vet_pic from tblVeterinarian v\r\n"
					+ "    inner join tblUser u\r\n"
					+ "        on u.user_id = v.vet_seq\r\n"
					+ "            where v.vet_seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {
				VeterinarianDTO dto = new VeterinarianDTO();

				dto.setVet_seq(rs.getString("vet_seq"));
				dto.setVet_clinic(rs.getString("vet_clinic"));
				dto.setVet_major(rs.getString("vet_major"));
				dto.setVet_address(rs.getString("vet_address"));
				dto.setVet_addressdetail(rs.getString("vet_addressdetail"));
				dto.setVet_name(rs.getString("vet_name"));
				dto.setVet_pic(rs.getString("vet_pic"));
				
				rs.close();
				pstat.close();
				conn.close();

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return null;
	}

	public List<String> getVClist(String id) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "select vc_content from tblVetCareer where vet_seq = ? order by vc_seq asc";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			List<String> list = new ArrayList<String>();

			while (rs.next()) {

				String career = rs.getString("vc_content");

				list.add(career);
			}
			
			rs.close();
			pstat.close();
			conn.close();

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return null;
	}

	public int editPetsitterPic(PetsitterDTO dto) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "update tblPetsitter set ps_pic = ? where ps_id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getPs_pic());
			pstat.setString(2, dto.getPs_id());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();

			return result;

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}

	public PetsitterDTO getPetsitterInfo(String id) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "select ps_id, ps_pic, ps_intro, to_char(ps_authdate, 'yyyy-mm-dd') as ps_authdate, ps_idcard, ps_crime from tblPetsitter where ps_id = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {
				PetsitterDTO dto = new PetsitterDTO();

				dto.setPs_id(rs.getString("ps_id"));
				dto.setPs_pic(rs.getString("ps_pic"));
				dto.setPs_intro(rs.getString("ps_intro"));
				dto.setPs_authdate(rs.getString("ps_authdate"));
				dto.setPs_idcard(rs.getString("ps_idcard"));
				dto.setPs_crime(rs.getString("ps_crime"));
				
				rs.close();
				pstat.close();
				conn.close();

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return null;
	}

	public String getPsRate(String id) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "select round(nvl(avg(psl.pslog_rate), 0), 1) as ps_rate from tblPetsitter ps\r\n"
					+ "    inner join tblPSApply psa\r\n"
					+ "        on ps.ps_id = psa.ps_id\r\n"
					+ "    inner join tblPSLog psl\r\n"
					+ "        on psa.psa_seq = psl.psa_seq\r\n"
					+ "            where ps.ps_id = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {
				
				String ps_rate = rs.getString("ps_rate");
				
				rs.close();
				pstat.close();
				conn.close();

				return ps_rate;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public String getPsMatchcount(String id) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "select count(*) as ps_matchcount from tblPetsitter ps\r\n"
					+ "    inner join tblPSApply psa\r\n"
					+ "        on ps.ps_id = psa.ps_id\r\n"
					+ "    inner join tblPSLog psl\r\n"
					+ "        on psa.psa_seq = psl.psa_seq\r\n"
					+ "            where ps.ps_id = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			if (rs.next()) {
				
				String ps_matchcount = rs.getString("ps_matchcount");
				
				rs.close();
				pstat.close();
				conn.close();

				return ps_matchcount;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return null;
	}

	public List<PSApplyDTO> getPSAlist(String id) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "select psr.psr_seq as psr_seq,\r\n"
					+ "psr.psr_subject as psr_subject,\r\n"
					+ "case\r\n"
					+ "when psa.psa_adoptdate is not null then '수락'\r\n"
					+ "when psa.psa_adoptdate is null and psr.psr_state = '모집완료' then '거절'\r\n"
					+ "when psa.psa_adoptdate is null and psr.psr_state = '모집중' then '모집중'\r\n"
					+ "else '모집취소'\r\n"
					+ "end as psa_state\r\n"
					+ "from tblPSApply psa\r\n"
					+ "    inner join tblPSRecruitment psr\r\n"
					+ "        on psa.psr_seq = psr.psr_seq\r\n"
					+ "            where psa.ps_id = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			List<PSApplyDTO> list = new ArrayList<PSApplyDTO>();

			while (rs.next()) {

				PSApplyDTO dto = new PSApplyDTO();

				dto.setPsr_seq(rs.getString("psr_seq"));
				dto.setPsr_subject(rs.getString("psr_subject"));
				dto.setPsa_state(rs.getString("psa_state"));

				list.add(dto);
			}
			
			rs.close();
			pstat.close();
			conn.close();

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return null;
	}

	public List<VetQnADTO> getVQlist(String id) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "select vq.vq_seq as vq_seq,\r\n"
					+ "(select vq_subject from tblVetQnA where vq_seq = vq.vq_seq) as vq_subject,\r\n"
					+ "to_char((select vq_regdate from tblVetQnA where vq_seq = vq.vq_seq),'yyyy-mm-dd') as vq_regdate\r\n"
					+ "from tblVetQnA vq\r\n"
					+ "inner join tblVQReply vqr\r\n"
					+ "on vq.vq_seq = vqr.vq_seq\r\n"
					+ "where vqr.vet_seq = ?\r\n"
					+ "group by vq.vq_seq";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);

			rs = pstat.executeQuery();

			List<VetQnADTO> list = new ArrayList<VetQnADTO>();

			while (rs.next()) {

				VetQnADTO dto = new VetQnADTO();

				dto.setVq_seq(rs.getString("vq_seq"));
				dto.setVq_subject(rs.getString("vq_subject"));
				dto.setVq_regdate(rs.getString("vq_regdate"));

				list.add(dto);
			}
			
			rs.close();
			pstat.close();
			conn.close();

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return null;
	}
	

	public int editPs_intro(PetsitterDTO dto) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "update tblPetsitter set ps_intro = ? where ps_id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getPs_intro());
			pstat.setString(2, dto.getPs_id());

			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}

	public int editUserInfo(UserDTO dto) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "update tblUser set user_nickname = ? , user_address = ? , user_addressdetail = ? , user_tel = ? where user_id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getUser_nickname());
			pstat.setString(2, dto.getUser_address());
			pstat.setString(3, dto.getUser_addressdetail());
			pstat.setString(4, dto.getUser_tel());
			pstat.setString(5, dto.getUser_id());

			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}

	public int editUserPw(UserDTO dto) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "update tblUser set user_pw = ? where user_id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getUser_pw());
			pstat.setString(2, dto.getUser_id());

			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result; 

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}

	public int getBoardcnt(String id) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
			
			String sql = "select\r\n"
					+ "(select count(psr_seq) as cnt from tblpsrecruitment where psr_writer = ?) +\r\n"
					+ "(select count(ff_seq) as cnt from tblfindfamily where ff_writer = ?) +\r\n"
					+ "(select count(wg_seq) as cnt from tblWagle where wg_writer = ?) +\r\n"
					+ "(select count(wt_seq) as cnt from tblWalkTogether where wt_writer = ?) +\r\n"
					+ "(select count(vq_seq) as cnt from tblVetQnA where vq_writer = ?) +\r\n"
					+ "(select count(yf_seq) as cnt from tblYourFamily where yf_writer = ?)\r\n"
					+ "as cnt\r\n"
					+ "from dual";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);
			pstat.setString(2, id);
			pstat.setString(3, id);
			pstat.setString(4, id);
			pstat.setString(5, id);
			pstat.setString(6, id);

			rs = pstat.executeQuery();

			if (rs.next()) {

				int cnt = rs.getInt("cnt");
				
				rs.close();
				pstat.close();
				conn.close();
				
				return cnt;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}

	public int getCommentcnt(String id) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
			
			String sql = "select\r\n"
					+ "(select count(ffc_seq) as cnt from tblFFComment where ffc_writer = ?) +\r\n"
					+ "(select count(wgc_seq) as cnt from tblWagleComment where wgc_writer = ?) +\r\n"
					+ "(select count(vqrc_seq) as cnt from tblVQRComment where vqrc_writer = ?)\r\n"
					+ "as cnt\r\n"
					+ "from dual";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);
			pstat.setString(2, id);
			pstat.setString(3, id);

			rs = pstat.executeQuery();

			if (rs.next()) {

				int cnt = rs.getInt("cnt");
				
				rs.close();
				pstat.close();
				conn.close();
				
				return cnt;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return 0;
	}

	public int editVetInfo(VeterinarianDTO dto) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "update tblVeterinarian set vet_clinic = ?, vet_address = ?, vet_addressdetail = ?, vet_major = ? where vet_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getVet_clinic());
			pstat.setString(2, dto.getVet_address());
			pstat.setString(3, dto.getVet_addressdetail());
			pstat.setString(4, dto.getVet_major());
			pstat.setString(5, dto.getVet_seq());

			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}

	public int delVClist(String id) {
		
		try {
			
			this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");

			String sql = "delete tblVetCareer where vet_seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return -1;
	}

	public int addVClist(String id, String vet_career) {
		
		try {

			String sql = "insert into tblVetCareer(vc_seq, vet_seq, vc_content) values(vc_seq.nextVal, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, vet_career);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}


	
}

	
}