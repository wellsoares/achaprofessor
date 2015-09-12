package br.com.professores.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author well
 */
@Entity
@Table(name = "tb_user")
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class User implements Serializable {

    @Id
    @Column(nullable = false)
    @SequenceGenerator(name = "id", sequenceName = "seq_user", allocationSize = 20)
    @GeneratedValue(generator = "id", strategy = GenerationType.SEQUENCE)
    private Integer id;
    @Column(nullable = false, length = 50)
    private String name;
    @Column(nullable = false)
    private Integer age;
    @Column(nullable = false, length = 1)
    private char genre;
    @Column(nullable = true, length = 30)
    private String email;
    @Column(nullable = false, length = 15)
    private String password;
    @OneToOne
    @JoinColumn(name = "id_adress", foreignKey = @ForeignKey(name = "FK_ADRESS"))
    private Adress adress;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public char getGenre() {
        return genre;
    }

    public void setGenre(char genre) {
        this.genre = genre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Adress getAdress() {
        return adress;
    }

    public void setAdress(Adress adress) {
        this.adress = adress;
    }

    public String convertFieldsToString() {
        return "User{" + "id=" + id + ", name=" + name + ", age=" + age + ", genre=" + genre + ", email=" + email + ", password=" + password + ", adress=" + adress + '}';
    }

}
