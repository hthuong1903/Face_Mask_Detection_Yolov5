
package entity;

import java.util.List;

public class Gallery {
    private int id;
    private String title;
    private String description;
    private String name;
    private List<Image> listImage;
    public Gallery() {
    }

    public Gallery(int id, String title, String description, String name, List<Image> listImage) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.name = name;
        this.listImage = listImage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Image> getListImage() {
        return listImage;
    }

    public void setListImage(List<Image> listImage) {
        this.listImage = listImage;
    }

    @Override
    public String toString() {
        return "Gallery{" + "id=" + id + ", title=" + title + ", description=" + description + ", name=" + name + ", listImage=" + listImage + '}';
    }
}
