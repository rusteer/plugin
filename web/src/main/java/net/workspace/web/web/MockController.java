package net.workspace.web.web;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/mock")
public class MockController {
    @RequestMapping(value = "")
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String num = request.getParameter("page");
        if (StringUtils.isEmpty(num)) {
            num = String.valueOf((int) (Math.random() * 2) + 1);
        }
        return "mock/random" + num;
    }
}
