package net.workspace.web.repository;
@MyBatisRepository
public interface OrderMyBatisDao {
    void revertOrder(Long orderId);
}
