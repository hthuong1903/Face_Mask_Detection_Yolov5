
package entity;

public class Share {
    private String icon;
     private String social;
     private String url;

    public Share() {
    }

    public Share(String icon, String social, String url) {
        this.icon = icon;
        this.social = social;
        this.url = url;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getSocial() {
        return social;
    }

    public void setSocial(String social) {
        this.social = social;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Share{" + "icon=" + icon + ", social=" + social + ", url=" + url + '}';
    }
}
