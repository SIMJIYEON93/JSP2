package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

/*import dto.Comment;
import dto.User;
import dto.Community;*/
import dto.SessionDto;
import mybatis.SqlSessionBean;

public class UserDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static UserDao dao = new UserDao();
	
	private UserDao() { }
	public static UserDao getInstance() {
		return dao;
	}

	public SessionDto login(Map<String,String> map) {
		SessionDto dto=null;
		SqlSession mapper = factory.openSession();
		dto = mapper.selectOne("loginCheck", map);	
		return dto;
	}
}