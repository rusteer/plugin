package net.workspace.web.rest;
import java.util.List;
import javax.validation.Validator;
import net.workspace.web.entity.PackageEntity;
import net.workspace.web.service.BuildService;
import net.workspace.web.service.PackageService;
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
@RequestMapping(value = "/rest/pakcage")
public class PackageRestController extends AbstractController {
    @Autowired
    private PackageService service;
    @Autowired
    private BuildService buildService;
    @Autowired
    private Validator validator;
    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<?> create(@RequestBody PackageEntity entity, UriComponentsBuilder uriBuilder) {
        save(entity);
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
        PackageEntity task = service.get(id);
        if (task == null) { return new ResponseEntity<PackageEntity>(HttpStatus.NOT_FOUND); }
        return new ResponseEntity<PackageEntity>(task, HttpStatus.OK);
    }
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<PackageEntity> list() {
        return service.getAll();
    }
    private void save(final PackageEntity entity) {
        if (!"E".equals(entity.getStatus())) entity.setStatus("D");
        entity.setNeedBuild("Y");
        entity.setBuildStatus("等待打包");
        service.save(entity);
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> update(@RequestBody PackageEntity entity) {
        save(entity);
        return new ResponseEntity<Object>(HttpStatus.NO_CONTENT);
    }
}
