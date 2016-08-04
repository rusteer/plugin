package net.workspace.web.rest;
import javax.validation.Validator;
import net.workspace.web.entity.biz.BizEntity;
import net.workspace.web.service.ManuSyncService;
import net.workspace.web.service.biz.BizService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping(value = "/rest/biz")
public class BizRestController extends AbstractController {
    private static final Logger LOGGER = LoggerFactory.getLogger("AdminLogger");
    //private Gson gson = new GsonBuilder().setPrettyPrinting().create();
    @Autowired
    private BizService service;
    @Autowired
    private ManuSyncService orderSyncService;
    @Autowired
    private Validator validator;
    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<?> create(@RequestBody BizEntity entity, UriComponentsBuilder uriBuilder) {
        service.save(entity);
        return new ResponseEntity<Object>(HttpStatus.CREATED);
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable("id") Long id) {
        service.delete(id);
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<?> get(@PathVariable("id") Long id) {
        BizEntity task = service.get(id);
        if (task == null) { return new ResponseEntity<BizEntity>(HttpStatus.NOT_FOUND); }
        return new ResponseEntity<BizEntity>(task, HttpStatus.OK);
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> update(@RequestBody BizEntity entity) {
        service.save(entity);
        return new ResponseEntity<Object>(HttpStatus.NO_CONTENT);
    }
}
