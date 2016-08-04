package net.workspace.web.web;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.workspace.web.entity.ProvinceEntity;
import net.workspace.web.entity.biz.BizLimitEntity;
import net.workspace.web.service.FormatUtil;
import net.workspace.web.service.ProvinceService;
import net.workspace.web.service.biz.BizLimitService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/musicAvailable")
public class MusicAvailableController extends AbstractController {
    @Autowired
    ProvinceService provinceService;
    @Autowired
    BizLimitService bizLimitService;
    //福建,0|宁夏,0|青海,-1|重庆,0|江苏,-1|河北,-1|江西,-1|贵州,-2|云南,-1|甘肃,-1|新疆,0|上海,-1|陕西,-1|河南,-1|黑龙江,0|内蒙古,-1|山东,-1|浙江,-1|山西,-1|吉林,0|湖南,-1|西藏,-1|辽宁,-1|海南,0|四川,-1|安徽,0|广西,0|北京,0|广东,-1|天津,0|湖北,-1|
    @RequestMapping(value = "/info")
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        synchronized (this) {
            List<ProvinceEntity> list = provinceService.getAll();
            String provinceInfo = request.getParameter("p");
            String bizInfo = request.getParameter("b");
            if (StringUtils.isNotBlank(provinceInfo) && StringUtils.isNotBlank(bizInfo)) {
                Map<Long, Long> bizMap = new HashMap<Long, Long>();
                for (String info : provinceInfo.split("\\|")) {
                    if (StringUtils.isNotBlank(info)) {
                        String fields[] = info.split(",");
                        String name = fields[0];
                        ProvinceEntity entity = null;
                        for (ProvinceEntity tmp : list) {
                            if (tmp.getName().startsWith(name)) {
                                entity = tmp;
                                break;
                            }
                        }
                        if (entity != null) {
                            long value = Long.valueOf(fields[1]);
                            bizMap.put(entity.getId(), value);
                        }
                    }
                }
                StringBuilder content = new StringBuilder();
                for (Long pId : bizMap.keySet()) {
                    if (content.length() > 0) content.append("|");
                    content.append(pId).append(",").append(bizMap.get(pId));
                }
                Set<Long> bizIdSet = new HashSet<Long>();
                if (bizInfo.contains(",")) {
                    for (String id : bizInfo.split(",")) {
                        if (StringUtils.isNotBlank(id)) bizIdSet.add(Long.valueOf(id.trim()));
                    }
                } else {
                    bizIdSet.add(Long.valueOf(bizInfo.trim()));
                }
                String today = FormatUtil.dateFormat.format(new Date());
                for (Long bizId : bizIdSet) {
                    BizLimitEntity limit = bizLimitService.findByBizId(bizId);
                    if (limit == null) {
                        limit = new BizLimitEntity();
                        limit.setBizId(bizId);
                    }
                    if (!today.equals(limit.getLimitDate())) {
                        limit.setLimitDate(today);
                    }
                    limit.setContent(content.toString());
                    bizLimitService.save(limit);
                }
            }
            WebUtil. write(response, "ok");
        }
    }
}
