package web.com.rstr.cjw.restaurant;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import web.com.rstr.common.dto.MemberVO;

@Controller
public class LoginController {
	
    // http://localhost:6805/login
    @GetMapping("/login")
    public String login(Model a) {
        return "hambook/LoginDetail";
    }
	
	@PostMapping("/login")
	public String login(
	        @RequestParam String userId,
	        @RequestParam String password,
	        HttpSession session,
	        Model model) {

	    if (userId == null || userId.isBlank() ||
	        password == null || password.isBlank()) {

	        model.addAttribute("error", "아이디와 비밀번호를 입력해주세요.");
	        return "hambook/LoginDetail";
	    }

	    MemberVO member = service.login(userId, password);

	    if (member == null) {
	        model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        return "hambook/LoginDetail";
	    }

	    session.setAttribute("loginUser", member);
	    return "redirect:/home";
	}

}
