package Entities;

import java.sql.Timestamp;

public class Foods {
    private Long id;
    private User user;
    private String name;
    private String photo;
    private String description;
    private Long price;
    private Timestamp paste_date;

    public Foods() {
    }

    public Foods(Long id, User user, String name, String photo, String description, Long price, Timestamp paste_date) {
        this.id = id;
        this.user = user;
        this.name = name;
        this.photo = photo;
        this.description = description;
        this.price = price;
        this.paste_date = paste_date;
    }

    public Timestamp getPaste_date() {
        return paste_date;
    }

    public void setPaste_date(Timestamp paste_date) {
        this.paste_date = paste_date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }
}
