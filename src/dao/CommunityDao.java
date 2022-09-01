package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Community;
import mybatis.SqlSessionBean;

public class CommunityDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static CommunityDao dao = new CommunityDao();
	
	private CommunityDao() { }
	public static CommunityDao getInstance() {
		return dao;
	}

	public List<Community> getList(Map<String, Integer> map){   
		List<Community> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("getList",map);
		return list;
	}
	
	public Community getOne(int idx) {
		SqlSession mapper = factory.openSession();
		Community dto = mapper.selectOne("selectByIdx", idx);  
		mapper.close();
		return dto;
	}
	
	public int getCount() {
		SqlSession mapper = factory.openSession();
		int cnt = mapper.selectOne("getCount");  
		mapper.close();     
		return cnt;
	}
	
	public void insert(Community dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("community.insert",dto);
		mapper.commit();
		mapper.close();
	}
	
	public void update(Community dto) {
		SqlSession mapper = factory.openSession();
		mapper.update("update",dto);
		mapper.commit();
		mapper.close();
	}
	
	public int delete(Map<String,Object> map) {
		SqlSession mapper = factory.openSession();
		int n = mapper.delete("community.delete",map);
		mapper.commit();
		mapper.close();
		return n;
	}
	
	public Community passwordCheck(Map<String,Object> map) {
		SqlSession mapper = factory.openSession();
		Community dto = mapper.selectOne("passwordCheck", map);
		mapper.close();
		return dto;
	}
	
	public void readCount(int idx) {
		SqlSession mapper =factory.openSession();
		mapper.update("readCount", idx);
		mapper.commit();
		mapper.close();
	}
	
}