package web.com.rstr.cjw.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.com.rstr.A01_hkh.Dao;
import web.com.rstr.common.dto.MemberVO;

@Service
public class LoginService {
	 @Autowired
	    private Dao dao;
	    
	    public MemberVO login(String userId, String password) {
	        MemberVO member = dao.selectByUserIdAndPassword(userId, password);
	        
	        // 보안을 위해 비밀번호는 null 처리
	        if (member != null) {
	            member.setPassword(null);
	        }
	        
	        return member;
	    }
	    
	    public boolean isUserIdExists(String userId) {
	        return dao.countByUserId(userId) > 0;
	    }
	    
	    public MemberVO getMemberById(Long id) {
	        return dao.selectById(id);
	    }
	
}
