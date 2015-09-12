package br.com.professores.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 *
 * @author well
 */
@Entity
@Table(name = "tb_student")
@Inheritance(strategy = InheritanceType.JOINED)
@PrimaryKeyJoinColumn(name = "id")
public class Student extends User implements Serializable {

    @Override
    public String toString() {
        return super.convertFieldsToString();
    }

}
