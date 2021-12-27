
package entity;

public class User {
    private int id;
    private String user_name;
    private String password;
    private int role;
    private String createdDate;
    private String email;

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

   

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public User(int id, String user_name, String password, int role, String createdDate, String email) {
        this.id = id;
        this.user_name = user_name;
        this.password = password;
        this.role = role;
        this.createdDate = createdDate;
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", user_name=" + user_name + ", password=" + password + ", role=" + role + ", createdDate=" + createdDate + ", email=" + email + '}';
    }

    
    
    
}
