package br.com.professores.modeljson;

/**
 *
 * @author well
 */
public class Marker {

    private String title;
    private String lat;
    private String lng;
    private String description;

    public Marker() {
    }

    public Marker(String title, String lat, String lng, String description) {
        this.title = title;
        this.lat = lat;
        this.lng = lng;
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
