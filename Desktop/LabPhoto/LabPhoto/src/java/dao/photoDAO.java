package dao;

import context.DBContext;
import entity.Contact;
import entity.Gallery;
import entity.Image;
import entity.Share;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class photoDAO {

    Connection cnn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Image> getAllImageById(int galleryId) {
        String query = "select * from [image] where galery_id = ? ";
        List<Image> listI = new ArrayList<>();
        try {
            cnn = new DBContext().getConnection();
            ps = cnn.prepareStatement(query);
            ps.setInt(1, galleryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                listI.add(new Image(rs.getInt(1),
                        rs.getInt(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return listI;
    }

    public List<Gallery> getTop3() {
        List<Gallery> lg = new ArrayList<>();
        String query = "select top 3* from galery ";
        try {
            cnn = new DBContext().getConnection();
            ps = cnn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                lg.add(new Gallery(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        new photoDAO().getAllImageById(rs.getInt(1))));
            }
        } catch (Exception e) {
        }
        return lg;
    }

    public List<Gallery> getAllGalleryByPagging(int index, int size) {
        List<Gallery> lg = new ArrayList<>();
        String query = "select * from ( select Row_number() over (order by id)\n"
                + "as rownum, * from galery)[table]\n"
                + "where rownum between ? and ?";
        try {
            cnn = new DBContext().getConnection();
            ps = cnn.prepareStatement(query);
            ps.setInt(1, index * size - (size-1));
            ps.setInt(2, index * size);
            rs = ps.executeQuery();
            while (rs.next()) {
                lg.add(new Gallery(rs.getInt("ID"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("name"),
                        new photoDAO().getAllImageById(rs.getInt("ID"))));
            }
        } catch (Exception e) {
        }
        return lg;
    }

    public int count() {
        String query = "Select count(*) from Galery";
        try {
            cnn = new DBContext().getConnection();
            ps = cnn.prepareCall(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Share> getShare() {
        String query = "select * from share";
        List<Share> ls = new ArrayList<>();
        try {
            cnn = new DBContext().getConnection();
            ps = cnn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ls.add(new Share(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3)));

            }
        } catch (Exception e) {
        }
        return ls;
    }

    public Contact getContact() {
        String query = "select * from Contact";
        try {
            cnn = new DBContext().getConnection();
            ps = cnn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Contact(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9));
            }
        } catch (Exception e) {
        }
        return null;

    }

    public Gallery getGalleryByID(int id) {
        String query = "select * from galery where id = ?";
        try {
            cnn = new DBContext().getConnection();
            ps = cnn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Gallery(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        new photoDAO().getAllImageById(rs.getInt(1)));
            }
        } catch (Exception e) {

        }
        return null;
    }
}
