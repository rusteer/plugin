package net.workspace.web.rest;
import java.util.List;
import javax.validation.Validator;
import net.workspace.web.entity.sync.ManuSyncEntity;
import net.workspace.web.service.ManuSyncService;
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
@RequestMapping(value = "/rest/ordersync")
public class OrderSyncRestController extends AbstractController {
    @Autowired
    private ManuSyncService service;
    @Autowired
    private Validator validator;
    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<?> create(@RequestBody ManuSyncEntity entity, UriComponentsBuilder uriBuilder) {
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
        ManuSyncEntity task = service.get(id);
        if (task == null) { return new ResponseEntity<ManuSyncEntity>(HttpStatus.NOT_FOUND); }
        return new ResponseEntity<ManuSyncEntity>(task, HttpStatus.OK);
    }
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<ManuSyncEntity> list() {
        return service.getAll();
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> update(@RequestBody ManuSyncEntity entity) {
        service.save(entity);
        return new ResponseEntity<Object>(HttpStatus.NO_CONTENT);
    }
}
