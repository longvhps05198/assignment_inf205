/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.CartBean;
import Model.Sanpham;
import Model.Sanphamnam;
import Model.Sanphamnu;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hlong232
 */
@WebServlet(name = "Controller_Manage", urlPatterns = {"/Controller_Manage"})
public class Controller_Manage extends HttpServlet {

    private final String homePage = "index.jsp";
    private final String showPage = "gio-hang.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String action = request.getParameter("btnAction");
            switch (action) {
                case "Show": {
                    HttpSession session = request.getSession(true);
                    Sanpham sp = new Sanpham();
                    Sanpham[] list = sp.getConnectSP("select * from SANPHAM join CHITIETSP on SANPHAM.ID = CHITIETSP.ID "
                      + "where Phanloai like N'%Áo nữ%' or "
                      + "Phanloai like N'%Set đồ%' or "
                      + "Phanloai like N'%Đầm & Váy nữ%'");
                    session.setAttribute("DATA", list);
                    RequestDispatcher rd = request.getRequestDispatcher("Admin/SanPhamNuView.jsp");
                    rd.forward(request, response);

                    break;
                }
                case "Showspnam": {
                    HttpSession session = request.getSession(true);
                    Sanpham sp = new Sanpham();
                    Sanpham[] list = sp.getConnectSP("select * from SANPHAM join CHITIETSP on SANPHAM.ID = CHITIETSP.ID "
                      + "where Phanloai like N'%Áo nam%' or "
                      + "Phanloai like N'%Quần nam%'");
                    session.setAttribute("DATA1", list);
                    RequestDispatcher rd = request.getRequestDispatcher("Admin/SanPhamNamView.jsp");
                    rd.forward(request, response);
                    break;
                }
                case "Delete": {
                    String ID = request.getParameter("ID");
                    Sanpham spnu = new Sanpham();
                    boolean result = spnu.deleteRecord(Integer.parseInt(ID));
                    String url = "Controller_Manage?btnAction=Show";
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                    break;
                }
                case "Deletespnam": {
                    String ID = request.getParameter("ID");
                    Sanpham spnam = new Sanpham();
                    boolean result = spnam.deleteRecord(Integer.parseInt(ID));
                    String url = "Controller_Manage?btnAction=Showspnam";
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                    break;
                }
                case "Show_update": {
                    HttpSession session = request.getSession(true);
                    String ID = request.getParameter("ID");
                    String sex = request.getParameter("sex");
                    if (sex.equals("women")) {
                        Sanpham spnu = new Sanpham();
                        Sanpham[] list = spnu.getConnectSP("select * from SANPHAM join CHITIETSP on SANPHAM.ID = CHITIETSP.ID where SANPHAM.ID=" + ID);
                        session.setAttribute("INFO", list);
                        String gt = "women";
                        session.setAttribute("SEX", gt);
                        RequestDispatcher rd = request.getRequestDispatcher("Admin/SanPhamUpdate.jsp");
                        rd.forward(request, response);
                    }
                    if (sex.equals("men")) {
                        Sanpham spnam = new Sanpham();
                        Sanpham[] list = spnam.getConnectSP("select * from SANPHAM join CHITIETSP on SANPHAM.ID = CHITIETSP.ID where SANPHAM.ID=" + ID);
                        session.setAttribute("INFO", list);
                        String gt = "men";
                        session.setAttribute("SEX", gt);
                        RequestDispatcher rd = request.getRequestDispatcher("Admin/SanPhamUpdate.jsp");
                        rd.forward(request, response);
                    }
                    break;
                }
                case "Back": {
                    RequestDispatcher rd = request.getRequestDispatcher("Admin/SanPhamNuView.jsp");
                    rd.forward(request, response);
                    break;
                }
                case "Save": {
                    String ID = request.getParameter("txtID");
                    String TenSP = request.getParameter("txtTensanpham");
                    String GiaGoc = request.getParameter("txtGiagoc");
                    String GiaKM = request.getParameter("txtGiakhuyenmai");
                    String CK = request.getParameter("txtChietkhau");
                    String Image = request.getParameter("txtImage");
                    String PL = request.getParameter("txtPhanloai");
                    String MT = request.getParameter("txtMota");
                    String KD = request.getParameter("txtKieudang");
                    String MS = request.getParameter("txtMausac");
                    String CL = request.getParameter("txtChatlieu");
                    String XX = request.getParameter("txtXuatxu");

                    String sex = request.getParameter("gt");
                    if (sex.equals("women")) {
                        Sanpham spnu = new Sanpham(Integer.parseInt(ID), TenSP, GiaGoc, GiaKM, Image, CK, PL, MT, KD, MS, CL, XX);
                        boolean result = spnu.updateRecord();
                        String url = "Controller_Manage?btnAction=Show";
                        //Ở dưới đây nếu ta đi thẳng tới trang SanPhamNuView thì nó tuy đã cập nhật nhưng ko show ra
                        //Phải connect data rồi load lại 1 lần nữa mới được
                        RequestDispatcher rd = request.getRequestDispatcher(url);
                        rd.forward(request, response);
                    }
                    if (sex.equals("men")) {
                        Sanpham spnam = new Sanpham(Integer.parseInt(ID), TenSP, GiaGoc, GiaKM, Image, CK, PL, MT, KD, MS, CL, XX);
                        boolean result = spnam.updateRecord();
                        String url = "Controller_Manage?btnAction=Showspnam";
                        RequestDispatcher rd = request.getRequestDispatcher(url);
                        rd.forward(request, response);
                    }
                    break;
                }
                case "Add to cart": {
                    HttpSession session = request.getSession(true);
                    CartBean shop = (CartBean) session.getAttribute("SHOP");
                    if (shop == null) {
                        shop = new CartBean();
                    }
                    String tensp = request.getParameter("tensp");
                    String dongia = request.getParameter("dongia");
                    String hinhanh = request.getParameter("hinhanh");

                    Sanpham sp = new Sanpham(tensp, dongia, hinhanh);
                    shop.plusSP(sp);
                    session.setAttribute("SHOP", shop);

                    String pagename = (String) session.getAttribute("currentpage");
                    if (pagename == null) {
                        pagename = "index.jsp";
                    }
                    response.sendRedirect(pagename);

                    break;
                    //Important
                    //RequestDispatcher doesn't work with doPost()
                }
                case "Minus to cart": {
                    HttpSession session = request.getSession(true);
                    CartBean shop = (CartBean) session.getAttribute("SHOP");
                    if (shop == null) {
                        shop = new CartBean();
                    }
                    String tensp = request.getParameter("tensp");
                    String dongia = request.getParameter("dongia");
                    String hinhanh = request.getParameter("hinhanh");

                    Sanpham sp = new Sanpham(tensp, dongia, hinhanh);
                    boolean ck = shop.minusSP(sp);
                    session.setAttribute("SHOP", shop);

                    response.sendRedirect("gio-hang.jsp");
                    break;
                }
                case "View cart": {
                    RequestDispatcher rd = request.getRequestDispatcher(showPage);
                    rd.forward(request, response);
                    break;
                }
                case "Add more": {
                    RequestDispatcher rd = request.getRequestDispatcher(homePage);
                    rd.forward(request, response);
                    break;
                }
                case "Remove": {
                    String[] list = request.getParameterValues("rmv");
                    if (list != null) {
                        HttpSession session = request.getSession();
                        if (session != null) {
                            CartBean shop = (CartBean) session.getAttribute("SHOP");
                            if (shop != null) {
                                for (int i = 0; i < list.length; i++) {
                                    shop.removeSPNU(list[i]);
                                }
                                session.setAttribute("SHOP", shop);
                            }
                        }
                    }
                    String url = "Controller_Manage?btnAction=View cart";
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                    break;
                }
                case "Del": {
                    String sp = request.getParameter("sp");
                    HttpSession session = request.getSession();
                    CartBean shop = (CartBean) session.getAttribute("SHOP");
                    shop.removeSPNU(sp);
                    session.setAttribute("SHOP", shop);
                    String url = "Controller_Manage?btnAction=View cart";
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                    break;
                }
                case "Insert": {
                    String TenSP = request.getParameter("txtTensanpham");
                    String GiaGoc = request.getParameter("txtGiagoc");
                    String GiaKM = request.getParameter("txtGiakhuyenmai");
                    String CK = request.getParameter("txtChietkhau");
                    String Image = request.getParameter("txtImage");
                    String PL = request.getParameter("txtPhanloai");
                    String MT = request.getParameter("txtMota");
                    String KD = request.getParameter("txtKieudang");
                    String MS = request.getParameter("txtMausac");
                    String CL = request.getParameter("txtChatlieu");
                    String XX = request.getParameter("txtXuatxu");

                    String GT = request.getParameter("txtGioitinh");
                    if (GT.equals("Nam")) {
                        Sanpham spnam = new Sanpham(0, TenSP, GiaGoc, GiaKM, Image, CK, PL, MT, KD, MS, CL, XX);
                        boolean result = spnam.insertRecord();
                        String url = "Controller_Manage?btnAction=Showspnam";
                        //Ở dưới đây nếu ta đi thẳng tới trang SanPhamNuView thì nó tuy đã cập nhật nhưng ko show ra
                        //Phải connect data rồi load lại 1 lần nữa mới được
                        RequestDispatcher rd = request.getRequestDispatcher(url);
                        rd.forward(request, response);
                    }
                    if (GT.equals("Nữ")) {
                        Sanpham spnu = new Sanpham(0, TenSP, GiaGoc, GiaKM, Image, CK, PL, MT, KD, MS, CL, XX);
                        boolean result = spnu.insertRecord();
                        String url = "Controller_Manage?btnAction=Show";
                        //Ở dưới đây nếu ta đi thẳng tới trang SanPhamNuView thì nó tuy đã cập nhật nhưng ko show ra
                        //Phải connect data rồi load lại 1 lần nữa mới được
                        RequestDispatcher rd = request.getRequestDispatcher(url);
                        rd.forward(request, response);
                    }

                    break;
                }
                case "Showinsert": {
                    RequestDispatcher rd = request.getRequestDispatcher("Admin/SanPhamInsert.jsp");
                    rd.forward(request, response);
                    break;
                }
                case "Search": {
                    HttpSession session = request.getSession(true);
                    String text = request.getParameter("txtSearch");
                    Sanpham sp = new Sanpham();
                    
                    Sanpham[] listsp = sp.getConnectSP("select * from SANPHAM where Tensanpham like N'%" + text + "%'");
                    session.setAttribute("LIST", listsp);
                    RequestDispatcher rd = request.getRequestDispatcher("tim-kiem.jsp");
                    rd.forward(request, response);
                    break;
                }
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
