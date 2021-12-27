
package entity;

public class Image {
     private int id;
    private int gallery_id;
    private String url;

    public Image() {
    }

    public Image(int id, int gallery_id, String url) {
        this.id = id;
        this.gallery_id = gallery_id;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGallery_id() {
        return gallery_id;
    }

    public void setGallery_id(int gallery_id) {
        this.gallery_id = gallery_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Image{" + "id=" + id + ", gallery_id=" + gallery_id + ", url=" + url + '}';
    }
}
