/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.ConnectionData;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hlong232
 */
public class Sanphamnu implements Serializable {

    private int id;
    private String tenSanPham;
    private String giaGoc;
    private String giaKhuyenMai;
    private String image;
    private String chietKhau;
    private String phanLoai;
    private String moTa;
    private String kieuDang;
    private String mauSac;
    private String chatLieu;
    private String xuatXu;
    private Connection conn;
    private int quantity;

    public Sanphamnu(int id, String tenSanPham, String giaGoc, String giaKhuyenMai, String chietKhau) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.giaGoc = giaGoc;
        this.giaKhuyenMai = giaKhuyenMai;
        this.chietKhau = chietKhau;
    }

    public Sanphamnu() {
    }

    public Sanphamnu(String tenSanPham, String giaKhuyenMai, String image) {
        this.tenSanPham = tenSanPham;
        this.giaKhuyenMai = giaKhuyenMai;
        this.image = image;
        quantity = 1;
    }

    public Sanphamnu(int id, String tenSanPham, String giaGoc, String giaKhuyenMai, String image, String chietKhau, String phanLoai, String moTa, String kieuDang, String mauSac, String chatLieu, String xuatXu) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.giaGoc = giaGoc;
        this.giaKhuyenMai = giaKhuyenMai;
        this.image = image;
        this.chietKhau = chietKhau;
        this.phanLoai = phanLoai;
        this.moTa = moTa;
        this.kieuDang = kieuDang;
        this.mauSac = mauSac;
        this.chatLieu = chatLieu;
        this.xuatXu = xuatXu;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getGiaGoc() {
        return giaGoc;
    }

    public void setGiaGoc(String giaGoc) {
        this.giaGoc = giaGoc;
    }

    public String getGiaKhuyenMai() {
        return giaKhuyenMai;
    }

    public void setGiaKhuyenMai(String giaKhuyenMai) {
        this.giaKhuyenMai = giaKhuyenMai;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getChietKhau() {
        return chietKhau;
    }

    public void setChietKhau(String chietKhau) {
        this.chietKhau = chietKhau;
    }

    public String getPhanLoai() {
        return phanLoai;
    }

    public void setPhanLoai(String phanLoai) {
        this.phanLoai = phanLoai;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getKieuDang() {
        return kieuDang;
    }

    public void setKieuDang(String kieuDang) {
        this.kieuDang = kieuDang;
    }

    public String getMauSac() {
        return mauSac;
    }

    public void setMauSac(String mauSac) {
        this.mauSac = mauSac;
    }

    public String getChatLieu() {
        return chatLieu;
    }

    public void setChatLieu(String chatLieu) {
        this.chatLieu = chatLieu;
    }

    public String getXuatXu() {
        return xuatXu;
    }

    public void setXuatXu(String xuatXu) {
        this.xuatXu = xuatXu;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Sanphamnu[] getConnectSPNU(String s) {
        ConnectionData c = new ConnectionData();
        conn = c.connectData("PS05198_Assignment");
        ArrayList list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(s);

            while (rs.next()) {
                Sanphamnu spnu = new Sanphamnu();
                spnu.setId(rs.getInt(1));
                spnu.setTenSanPham(rs.getString(2));
                spnu.setGiaGoc(rs.getString(3));
                spnu.setGiaKhuyenMai(rs.getString(4));
                spnu.setChietKhau(rs.getString(5));
                spnu.setImage(rs.getString(6));
                spnu.setPhanLoai(rs.getString(7));
                spnu.setMoTa(rs.getString(8));
                spnu.setKieuDang(rs.getString(11));
                spnu.setMauSac(rs.getString(12));
                spnu.setChatLieu(rs.getString(13));
                spnu.setXuatXu(rs.getString(14));
                list.add(spnu);
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException e) {

        }
        Sanphamnu[] spnu = new Sanphamnu[list.size()];
        list.toArray(spnu);
        return spnu;
    }

    public Sanphamnu[] getConnectSPNU1(String s) {
        ConnectionData c = new ConnectionData();
        conn = c.connectData("PS05198_Assignment");
        ArrayList list = new ArrayList();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(s);

            while (rs.next()) {
                Sanphamnu spnu = new Sanphamnu();
                spnu.setId(rs.getInt(1));
                spnu.setTenSanPham(rs.getString(2));
                spnu.setGiaGoc(rs.getString(3));
                spnu.setGiaKhuyenMai(rs.getString(4));
                spnu.setChietKhau(rs.getString(5));
                spnu.setImage(rs.getString(6));
                list.add(spnu);
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException e) {

        }
        Sanphamnu[] spnu = new Sanphamnu[list.size()];
        list.toArray(spnu);
        return spnu;
    }

    public boolean deleteRecord(int ID) {
        conn = new ConnectionData().connectData("PS05198_Assignment");
        String sql = "exec spDeleteData ?";
        PreparedStatement ps;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, ID);
            int result = ps.executeUpdate();
            ps.close();
            conn.close();
            if (result > 0) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateRecord() {
        conn = new ConnectionData().connectData("PS05198_Assignment");
        try {
            String sql = "exec spUpdateData ?,?,?,?,?,?,?,?,?,?,?,?,?";
            int result;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, tenSanPham);
            ps.setString(3, giaGoc);
            ps.setString(4, giaKhuyenMai);
            ps.setString(5, chietKhau);
            ps.setString(6, image);
            ps.setString(7, phanLoai);
            ps.setString(8, moTa);
            ps.setString(9, kieuDang);
            ps.setString(10, mauSac);
            ps.setString(11, chatLieu);
            ps.setString(12, xuatXu);
            ps.setString(13, "Nữ");
            result = ps.executeUpdate();
            ps.close();

            conn.close();
            if (result > 0) {
                return true;
            }
        } catch (SQLException e) {

        }
        return false;
    }
    public boolean insertRecord(){
        conn = new ConnectionData().connectData("PS05198_Assignment");
        try {
            String sql = "exec spInsertData ?,?,?,?,?,?,?,?,?,?,?,?";
            int result;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tenSanPham);
            ps.setString(2, giaGoc);
            ps.setString(3, giaKhuyenMai);
            ps.setString(4, chietKhau);
            ps.setString(5, image);
            ps.setString(6, phanLoai);
            ps.setString(7, moTa);
            ps.setString(8, kieuDang);
            ps.setString(9, mauSac);
            ps.setString(10, chatLieu);
            ps.setString(11, xuatXu);
            ps.setString(12, "Nữ");
            result = ps.executeUpdate();
            ps.close();

            conn.close();
            if (result > 0) {
                return true;
            }
        } catch (SQLException e) {

        }
        return false;
    }
}
