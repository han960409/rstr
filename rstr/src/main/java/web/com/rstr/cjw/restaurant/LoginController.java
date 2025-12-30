package web.com.rstr.cjw.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import web.com.rstr.A01_hkh.Dao;
import web.com.rstr.common.dto.MemberVO;

@Controller
public class LoginController {

    @Autowired
    private Dao dao;

    // 로그인 페이지
    @GetMapping("/login")
    public String login(Model a) {
        return "hambook/LoginDetail";
    }

    // 로그인 처리
	@PostMapping("/login")
	public String login(
	        @RequestParam String userId,
	        @RequestParam String password,
	        HttpSession session,
	        Model model) {

	    if (userId == null || userId.isBlank() ||
	        password == null || password.isBlank()) {

	        model.addAttribute("error", "아이디와 비밀번호를 입력해주세요.");
	        model.addAttribute("userId", userId);
	        return "hambook/LoginDetail";
	    }

	    MemberVO member = dao.selectByUserIdAndPassword(userId.trim(), password);

	    if (member == null) {
	        model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        model.addAttribute("userId", userId);
	        return "hambook/LoginDetail";
	    }

	    session.setAttribute("user", member);
	    return "redirect:/home";
	}

	// 로그아웃 처리
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/home";
	}
}