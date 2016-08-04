package net.workspace.web.service;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

public abstract class AbstractService<T> {
    protected final Logger LOGGER = LoggerFactory.getLogger(getClass());
    @Transactional(readOnly = false)
    public void delete(Long id) {
        getDao().delete(id);
    }
    public T get(Long id) {
        return getDao().findOne(id);
    }
    public List<T> getAll() {
        return (List<T>) getDao().findAll();
    }
    protected abstract CrudRepository<T, Long> getDao();
    @Transactional(readOnly = false)
    public T save(T entity) {
        T t = getDao().save(entity);
        return t;
    }
}
