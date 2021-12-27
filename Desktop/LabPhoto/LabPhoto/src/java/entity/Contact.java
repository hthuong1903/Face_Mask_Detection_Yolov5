package entity;

public class Contact {

    private String telephone;
    private String email;
    private String about;
    private String address;
    private String city;
    private String country;
    private String map;
    private String image;
    private String description;

    public Contact() {
    }

    public Contact(String telephone, String email, String about, String address, String city, String country, String map, String image, String description) {
        this.telephone = telephone;
        this.email = email;
        this.about = about;
        this.address = address;
        this.city = city;
        this.country = country;
        this.map = map;
        this.image = image;
        this.description = description;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getMap() {
        return map;
    }

    public void setMap(String map) {
        this.map = map;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Contact{" + "telephone=" + telephone + ", email=" + email + ", about=" + about + ", address=" + address + ", city=" + city + ", country=" + country + ", map=" + map + ", image=" + image + ", description=" + description + '}';
    }
}
