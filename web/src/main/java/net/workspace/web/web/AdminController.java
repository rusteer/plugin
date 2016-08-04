package net.workspace.web.web;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.service.SettingService;
import net.workspace.web.service.SuperSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "")
public class AdminController extends AbstractController {
    @Autowired
    private SettingService settingService;
    @Autowired
    private SuperSettingService superSettingService;
    @RequestMapping(value = "/admin/update")
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        StringBuilder sb = new StringBuilder();
        try {
            Process process = Runtime.getRuntime().exec("/home/hike/plugin/update.sh");
            InputStreamReader ir = new InputStreamReader(process.getInputStream());
            LineNumberReader input = new LineNumberReader(ir);
            String line;
            while ((line = input.readLine()) != null) {
                sb.append(line).append("\n");
            }
        } catch (java.io.IOException e) {
            sb.append(e.toString());
        }
        WebUtil.zipWrite(response, sb);
    }
    @RequestMapping(value = "/admin")
    public String index(@RequestParam(value = "isSuper", required = false, defaultValue = "N") String isSuper, ServletRequest request) {
        request.setAttribute("isSuper", "Y".equalsIgnoreCase(isSuper));
        request.setAttribute("setting", settingService.get());
        request.setAttribute("superSetting", superSettingService.get());
        return "admin/index";
    }
}
