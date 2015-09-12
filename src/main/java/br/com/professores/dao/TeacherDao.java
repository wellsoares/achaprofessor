package br.com.professores.dao;

import br.com.professores.model.Teacher;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

/**
 *
 * @author well
 */
@Repository
public class TeacherDao {

    @PersistenceContext
    private EntityManager manager;

    public List<Teacher> list() {
        return manager.createQuery("FROM Teacher", Teacher.class).getResultList();
    }

}
