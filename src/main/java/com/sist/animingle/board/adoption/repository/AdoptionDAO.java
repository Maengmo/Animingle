package com.sist.animingle.board.adoption.repository;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.test.my.DBUtil;

public class AdoptionDAO {
	
	private static Connection conn;
	private static Statement stat;
	private static PreparedStatement pstat;
	private static ResultSet rs;
	
	public AdoptionDAO() {
		this.conn = DBUtil.open("3.38.234.229", "admin", "java1234");
	}

	public static List<AdoptionDTO> apiContent(int nowPage) {

		try {

			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088/744e436d7478686635354b63637645/json/TbAdpWaitAnimalView/" + nowPage +"/" + (nowPage + 11));
			// /*URL*/

			urlBuilder.append("/" + URLEncoder.encode("인증키", "UTF-8")); /* 인증키 (sample사용시에는 호출시 제한됩니다.) */
			urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8")); /* 요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode("CardSubwayStatsNew", "UTF-8")); /* 서비스명 (대소문자 구분 필수입니다.) */
			urlBuilder.append("/" + URLEncoder.encode("1", "UTF-8")); /* 요청시작위치 (sample인증키 사용시 5이내 숫자) */
			urlBuilder.append("/" + URLEncoder.encode("10", "UTF-8")); /* 요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨) */
			// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.

			// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에 자세히 나와 있습니다.
			urlBuilder.append("/" + URLEncoder.encode("20220301", "UTF-8")); /* 서비스별 추가 요청인자들 */

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			//System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다. */
			BufferedReader rd;

			// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();

			JSONParser parser = new JSONParser();
			// 2. 문자열을 JSON 형태로 JSONObject 객체에 저장.
			JSONObject obj = (JSONObject) parser.parse(sb.toString());
			JSONObject jsonMain = (JSONObject)obj.get("TbAdpWaitAnimalView");

			// 3. 필요한 리스트 데이터 부분만 가져와 JSONArray로 저장.
			JSONArray dataArr = (JSONArray)jsonMain.get("row");
			
			List<AdoptionDTO> list = new ArrayList<AdoptionDTO>();
			
			if (dataArr.size() > 0) { 
				
				for(int i=0; i<dataArr.size(); i++) { 
					JSONObject jsonObj = (JSONObject)dataArr.get(i);
		
					AdoptionDTO dto = new AdoptionDTO();
					
					dto.setNum(jsonObj.get("ANIMAL_NO").toString());
					String temp = ((String)jsonObj.get("NM")).replace("-임시보호가능", "");
					dto.setName(temp);
					dto.setSpecies((String)jsonObj.get("SPCS"));
					dto.setBreed((String)jsonObj.get("BREEDS"));
					
					String gender = genderChange((String)jsonObj.get("SEXDSTN"));
					
					dto.setGender(gender);
					
					dto.setImgurl(apiImg(jsonObj.get("ANIMAL_NO").toString()));
					
					list.add(dto);
				} 
				
				return list;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	private static String genderChange(String gender) {
		
		try {

			String sql = "select typevalue from tblType where code = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, gender);

			rs = pstat.executeQuery();

			if (rs.next()) {

				return rs.getString("typevalue");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public static String apiImg(String animalNo) {
		
		try {

			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088/744e436d7478686635354b63637645/json/TbAdpWaitAnimalPhotoView/1/237/");
			// /*URL*/

			urlBuilder.append("/" + URLEncoder.encode("인증키", "UTF-8")); /* 인증키 (sample사용시에는 호출시 제한됩니다.) */
			urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8")); /* 요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode("CardSubwayStatsNew", "UTF-8")); /* 서비스명 (대소문자 구분 필수입니다.) */
			urlBuilder.append("/" + URLEncoder.encode("1", "UTF-8")); /* 요청시작위치 (sample인증키 사용시 5이내 숫자) */
			urlBuilder.append("/" + URLEncoder.encode("10", "UTF-8")); /* 요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨) */
			// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.

			// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에 자세히 나와 있습니다.
			urlBuilder.append("/" + URLEncoder.encode("20220301", "UTF-8")); /* 서비스별 추가 요청인자들 */

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			//System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다. */
			BufferedReader rd;

			// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();

			JSONParser parser = new JSONParser();
			// 2. 문자열을 JSON 형태로 JSONObject 객체에 저장.
			JSONObject obj = (JSONObject) parser.parse(sb.toString());
			JSONObject jsonMain = (JSONObject)obj.get("TbAdpWaitAnimalPhotoView");

			
			// 3. 필요한 리스트 데이터 부분만 가져와 JSONArray로 저장.
			JSONArray dataArr = (JSONArray)jsonMain.get("row");
			
			//System.out.println(animalNo.equals("2924.0"));
			if (dataArr.size() > 0) { 
				
				for(int i=0; i<dataArr.size(); i++) { 
					
					JSONObject jsonObj = (JSONObject)dataArr.get(i);
					
					if (jsonObj.get("PHOTO_KND").equals("THUMB") && animalNo.equals(jsonObj.get("ANIMAL_NO").toString())) {
						
						return jsonObj.get("PHOTO_URL").toString();
					}
					
				} 
				

			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public AdoptionDTO getAnimalProfile(String num) {
		
		try {
			
			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088/744e436d7478686635354b63637645/json/TbAdpWaitAnimalView/1/100");
			// /*URL*/

			urlBuilder.append("/" + URLEncoder.encode("인증키", "UTF-8")); /* 인증키 (sample사용시에는 호출시 제한됩니다.) */
			urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8")); /* 요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode("CardSubwayStatsNew", "UTF-8")); /* 서비스명 (대소문자 구분 필수입니다.) */
			urlBuilder.append("/" + URLEncoder.encode("1", "UTF-8")); /* 요청시작위치 (sample인증키 사용시 5이내 숫자) */
			urlBuilder.append("/" + URLEncoder.encode("10", "UTF-8")); /* 요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨) */
			// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.

			// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에 자세히 나와 있습니다.
			urlBuilder.append("/" + URLEncoder.encode("20220301", "UTF-8")); /* 서비스별 추가 요청인자들 */

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			//System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다. */
			BufferedReader rd;

			// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();

			JSONParser parser = new JSONParser();
			// 2. 문자열을 JSON 형태로 JSONObject 객체에 저장.
			JSONObject obj = (JSONObject) parser.parse(sb.toString());
			JSONObject jsonMain = (JSONObject)obj.get("TbAdpWaitAnimalView");

			// 3. 필요한 리스트 데이터 부분만 가져와 JSONArray로 저장.
			JSONArray dataArr = (JSONArray)jsonMain.get("row");
			
			AdoptionDTO dto = new AdoptionDTO();
			
			if (dataArr.size() > 0) { 
				
				for(int i=0; i<dataArr.size(); i++) { 
					JSONObject jsonObj = (JSONObject)dataArr.get(i);
		
					if (num.equals(jsonObj.get("ANIMAL_NO").toString())) {
						
						
						dto.setNum(num.substring(0, 4));
						dto.setName(jsonObj.get("NM").toString());
						dto.setSpecies(jsonObj.get("SPCS").toString());
						dto.setBreed(jsonObj.get("BREEDS").toString());
						dto.setAge(jsonObj.get("AGE").toString());
						
						String gender = genderChange(jsonObj.get("SEXDSTN").toString());
						dto.setGender(gender);
						dto.setWeight(jsonObj.get("BDWGH").toString());
						dto.setProtectcontent(jsonObj.get("TMPR_PRTC_CN").toString());
						dto.setVideourl(jsonObj.get("INTRCN_MVP_URL").toString());
						dto.setAdmissiondate(jsonObj.get("ENTRNC_DATE").toString());
						dto.setIntro(jsonObj.get("INTRCN_CN").toString());
					
						return dto;
						
					}

				} 
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public AnimalCenterDTO getCenter(String center) {
		
		try {

			String sql = "select * from tblAnimalCenter where ac_gu like '%" + center + "%'";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
						
			if (rs.next()) {

				AnimalCenterDTO dto = new AnimalCenterDTO();
		
				dto.setName(rs.getString("ac_name"));
				dto.setRepresentative(rs.getString("ac_representative"));
				dto.setAddress(rs.getString("ac_address"));
				dto.setTel(rs.getString("ac_tel"));
				dto.setGu(rs.getString("ac_gu"));
				dto.setDepartment(rs.getString("ac_department"));
				dto.setDepartmenttel(rs.getString("ac_departmenttel"));
				dto.setSignificant(rs.getString("ac_significant"));

				return dto;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}

	public int getTotal() {

		try {

			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088/744e436d7478686635354b63637645/json/TbAdpWaitAnimalView/1/300");
			// /*URL*/

			urlBuilder.append("/" + URLEncoder.encode("인증키", "UTF-8")); /* 인증키 (sample사용시에는 호출시 제한됩니다.) */
			urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8")); /* 요청파일타입 (xml,xmlf,xls,json) */
			urlBuilder.append("/" + URLEncoder.encode("CardSubwayStatsNew", "UTF-8")); /* 서비스명 (대소문자 구분 필수입니다.) */
			urlBuilder.append("/" + URLEncoder.encode("1", "UTF-8")); /* 요청시작위치 (sample인증키 사용시 5이내 숫자) */
			urlBuilder.append("/" + URLEncoder.encode("10", "UTF-8")); /* 요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨) */
			// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.

			// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에 자세히 나와 있습니다.
			urlBuilder.append("/" + URLEncoder.encode("20220301", "UTF-8")); /* 서비스별 추가 요청인자들 */

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			//System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다. */
			BufferedReader rd;

			// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();

			JSONParser parser = new JSONParser();
			// 2. 문자열을 JSON 형태로 JSONObject 객체에 저장.
			JSONObject obj = (JSONObject) parser.parse(sb.toString());
			JSONObject jsonMain = (JSONObject)obj.get("TbAdpWaitAnimalView");

			// 3. 필요한 리스트 데이터 부분만 가져와 JSONArray로 저장.
			JSONArray dataArr = (JSONArray)jsonMain.get("row");

			return dataArr.size();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
}

