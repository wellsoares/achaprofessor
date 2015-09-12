package br.com.professores.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author well
 */
@Entity
@Table(name = "tb_adress")
public class Adress implements Serializable {

    @Id
    @Column(nullable = false)
    @SequenceGenerator(name = "id", sequenceName = "seq_adress", allocationSize = 20)
    @GeneratedValue(generator = "id", strategy = GenerationType.SEQUENCE)
    private Integer id;
    @Column(nullable = false, length = 20)
    private String city;
    @Column(nullable = false, length = 2)
    private String state;
    @Column(nullable = false, length = 30)
    private String street;
    @Column(nullable = true)
    private String number;
    @Column(nullable = true, length = 20)
    private String neighborhood;
    @Column(name = "zip_code", nullable = true, length = 8)
    private String zipcode;
    @Column(name = "lat", nullable = false, length = 40)
    private String latitude;
    @Column(name = "lng", nullable = false, length = 40)
    private String longitude;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getNeighborhood() {
        return neighborhood;
    }

    public void setNeighborhood(String neighborhood) {
        this.neighborhood = neighborhood;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }
}
