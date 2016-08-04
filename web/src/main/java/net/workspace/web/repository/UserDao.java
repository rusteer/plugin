package net.workspace.web.repository;
import net.workspace.web.entity.UserEntity;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface UserDao extends PagingAndSortingRepository<UserEntity, Long> {
    UserEntity findByLoginName(String loginName);
}
