package net.workspace.web.bean;
import net.workspace.web.entity.biz.BizEntity;

public class GetBizResult {
    public static GetBizResult setReason(EmptyReason reason, String description) {
        GetBizResult g = new GetBizResult();
        g.reason = reason;
        g.emptyDescription = description;
        g.failure = true;
        return g;
    }
    public static GetBizResult setResult(BizEntity biz) {
        GetBizResult g = new GetBizResult();
        g.biz = biz;
        return g;
    }
    public BizEntity biz;
    public String emptyDescription;
    public EmptyReason reason;
    public boolean failure;
}
