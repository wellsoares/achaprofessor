package br.com.professores.controller;

import br.com.professores.business.TeacherBusiness;
import br.com.professores.model.Teacher;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author well
 */
@Controller()
@RequestMapping(value = "/cadastro")
public class TeacherController {
    
    private static final Logger logger = LogManager.getLogger(TeacherController.class);
    
    @Autowired
    private TeacherBusiness teacherBusiness;
    
    @RequestMapping(value = "/cadastro-professor", method = RequestMethod.GET)
    public String cadastroPro() {
        logger.info("Running teacher register.");
        return "teacher-register";
    }
    
    @RequestMapping(value = "/cadastro-professor", name = "saveTeacher", method = RequestMethod.POST)
    public ModelAndView saveTeacher(Teacher teacherRegistred) {
        
        logger.info(teacherRegistred.toString());
        
        ModelAndView m = new ModelAndView();
        return m;
    }
    
}
