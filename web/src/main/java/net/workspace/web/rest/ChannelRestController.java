package net.workspace.web.rest;
import java.util.List;
import javax.validation.Validator;
import net.workspace.web.entity.channel.ChannelEntity;
import net.workspace.web.service.BuildService;
import net.workspace.web.service.Util;
import net.workspace.web.service.channel.ChannelService;
import org.apache.commons.lang3.StringUtils;
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
@RequestMapping(value = "/rest/channel")
public class ChannelRestController extends AbstractController {
    @Autowired
    private ChannelService service;
    @Autowired
    private BuildService buildService;
    @Autowired
    private Validator validator;
    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<?> create(@RequestBody ChannelEntity entity, UriComponentsBuilder uriBuilder) {
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
        ChannelEntity task = service.get(id);
        if (task == null) { return new ResponseEntity<ChannelEntity>(HttpStatus.NOT_FOUND); }
        return new ResponseEntity<ChannelEntity>(task, HttpStatus.OK);
    }
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<ChannelEntity> list() {
        return service.getList();
    }
    private void save(final ChannelEntity entity) {
        if (StringUtils.isBlank(entity.getUuid())) {
            entity.setUuid(Util.generateUUID());
        }
        service.save(entity);
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> update(@RequestBody ChannelEntity entity) {
        save(entity);
        return new ResponseEntity<Object>(HttpStatus.NO_CONTENT);
    }
}
