package br.com.professores.business;

import br.com.professores.dao.TeacherDao;
import br.com.professores.model.Teacher;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author well
 */
@Component
public class TeacherBusiness {

    @Autowired
    private TeacherDao teacherDao;

    @Transactional
    public List<Teacher> listAllTeacher() {
        return teacherDao.list();
    }

}
