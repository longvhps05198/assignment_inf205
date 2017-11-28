/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Sanpham;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author hlong232
 */
@WebServlet("/uploadFile")
public class UploadFileController extends HttpServlet {
// location to store file uploaded

    private static final String UPLOAD_DIRECTORY = "images";

    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

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
        // checks if the request actually contains upload file

        //Nếu ở đây ta ghi if(request.getParameter("btnAction").equals("Insert")) sẽ bị lỗi
        //Do form có enctype="multipart/form-data" nên ko thể dùng request.getParameter được 
        
        PrintWriter out = response.getWriter();
        String Image = null;

        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }

        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk 
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        upload.setHeaderEncoding("UTF-8");

        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;

        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);

            Iterator iter = formItems.iterator();
            Hashtable params = new Hashtable();

            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadPath + File.separator + fileName;
                    File storeFile = new File(filePath);

                    // saves the file on disk
                    item.write(storeFile);
                    Image = "images/" + fileName;

                } else {
                    //Nếu chỉ ghi item.getString() sẽ bị lỗi font chữ
                    params.put(item.getFieldName(), item.getString("UTF-8"));
                }
            }
            String TenSP = (String) params.get("txtTensanpham");
            String GiaGoc = (String) params.get("txtGiagoc");
            String GiaKM = (String) params.get("txtGiakhuyenmai");
            String CK = (String) params.get("txtChietkhau");

            String PL = (String) params.get("txtPhanloai");
            String MT = (String) params.get("txtMota");
            String KD = (String) params.get("txtKieudang");
            String MS = (String) params.get("txtMausac");
            String CL = (String) params.get("txtChatlieu");
            String XX = (String) params.get("txtXuatxu");

            String GT = (String) params.get("txtGioitinh");
            System.out.println(TenSP);
            System.out.println(GiaGoc);
            System.out.println(GiaKM);
            System.out.println(CK);
            System.out.println(MT);
            System.out.println(KD);
            System.out.println(MS);
            System.out.println(PL);
            System.out.println(CL);
            System.out.println(XX);

            System.out.println(Image);

            Sanpham spnu = new Sanpham(0, TenSP, GiaGoc, GiaKM, Image, CK, PL, MT, KD, MS, CL, XX);
            boolean result = spnu.insertRecord();
            HttpSession session = request.getSession(true);
            Sanpham sp = new Sanpham();
            Sanpham[] list = sp.getConnectSP("select * from SANPHAM join CHITIETSP on SANPHAM.ID = CHITIETSP.ID "
                    + "where Phanloai like N'%Áo nữ%' or "
                    + "Phanloai like N'%Set đồ%' or "
                    + "Phanloai like N'%Đầm & Váy nữ%'");
            session.setAttribute("DATA", list);
            getServletContext().getRequestDispatcher("/Admin/SanPhamNuView.jsp").forward(request, response);
        } catch (Exception ex) {

        }
        out.close();
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
