package br.com.professores.model;

import java.io.Serializable;
import javax.persistence.Column;
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
@Table(name = "tb_teacher")
@Inheritance(strategy = InheritanceType.JOINED)
@PrimaryKeyJoinColumn(name = "id")
public class Teacher extends User implements Serializable {

    @Column(nullable = false, length = 30)
    private String graduation;
    @Column(nullable = false, length = 20)
    private String phone;

    public String getGraduation() {
        return graduation;
    }

    public void setGraduation(String graduation) {
        this.graduation = graduation;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return super.convertFieldsToString() + " Teacher{" + "graduation=" + graduation + ", phone=" + phone + '}';
    }
}
