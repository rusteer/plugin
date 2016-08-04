package net.workspace.web.web;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.entity.PackageEntity;
import net.workspace.web.service.BuildService;
import net.workspace.web.service.PackageService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/package")
public class PackageController extends AbstractController {
    @Autowired
    private PackageService service;
    @Autowired
    private BuildService buildService;
    @RequestMapping(value = "/list")
    public void list(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<PackageEntity> list = service.getAll();
        JSONArray array = new JSONArray();
        for (PackageEntity entity : list) {
            array.put(new JSONObject(mapper.writeValueAsString(entity)));
        }
        WebUtil.zipWrite(response, array);
    }
}
