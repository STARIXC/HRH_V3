package org.usaidtujengejamii.hrh.controller;

import utils.DocumentDAO;
import utils.IdGen;
import utils.JSONConverter;
import com.google.gson.Gson;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import models.Document;
import org.json.simple.JSONObject;

/**
 *
 * @author CBwahyi
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
//        location            = "D:/Uploads"
)
public class documentUploads extends HttpServlet {

    private final DocumentDAO dao;
    private final Gson gson;
    private final JSONConverter json;
//    private final Document doc;
    private PrintWriter out;
    private String myDrive = "";

    public documentUploads() {
        dao = new DocumentDAO();
        gson = new Gson();
        json = new JSONConverter();

//        doc= new Document();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            out = response.getWriter();
            String action = request.getParameter("action");

            IdGen IG = new IdGen();

            if (action != null && action.equals("get_all_docs")) {

                String empno = request.getParameter("emp_no");
                String empNo = IG.Decode(empno);
                List<Document> documents = dao.getAllDocumentsForEmployee(empNo);
                String docs = JSONConverter.convert(documents);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.println(docs);
            } else if ("download".equals(action)) {
                // Retrieve the file name and employee ID from the request parameters
                String fileName = request.getParameter("filename");
                String employeeId = request.getParameter("emp_no");
                int id = Integer.parseInt(request.getParameter("id"));
                // Decode the employee ID
                String empNo_ = IG.Decode(employeeId);
                // Get the directory path for the uploaded file using the decoded employee ID
                String uploadDirPath = getUploadDirectoryPath(empNo_);
                // If the file name is not null and not empty
                if (fileName != null && !fileName.isEmpty()) {
                    // Create a Path object for the file
                    Path filePath = Paths.get(uploadDirPath, fileName);
                    // If the file exists
                    if (Files.exists(filePath)) {

                        try {
                            // Set the content type to octet-stream and set the file name in the response header
                            response.setContentType("application/octet-stream");
                            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                            // Open an input stream for the file and an output stream for the response
                            InputStream inputStream = new FileInputStream(filePath.toFile());
                            OutputStream outputStream = response.getOutputStream();
                            // Set up a buffer and read bytes from the input stream into the buffer, then write the buffer to the output stream
                            byte[] buffer = new byte[1024];
                            int bytesRead;
                            while ((bytesRead = inputStream.read(buffer)) != -1) {
                                outputStream.write(buffer, 0, bytesRead);
                            }
                        } catch (IOException e) {
                            // Log any exceptions
                            Logger.getLogger(documentUploads.class.getName()).log(Level.SEVERE, null, e);
                            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                            response.getWriter().println("Error sending response");
                        }
                    } else {
                        // If the file doesn't exist, send a 404 error with a message
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found: " + fileName);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid filename: " + fileName);
                }

            } else if ("get_document".equals(action)) {
                int docID = Integer.parseInt(request.getParameter("id"));
                String fileName = request.getParameter("filename");
                String employeeId = request.getParameter("empno");
                String empNo_ = IG.Decode(employeeId);

                // Retrieve document data from the database
                Document document = null;
                try {
                    document = dao.getDocument(empNo_, docID);
                } catch (SQLException e) {
                    Logger.getLogger(documentUploads.class.getName()).log(Level.SEVERE, "Error retrieving document with ID " + docID + " for employee with ID " + employeeId, e);
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    return;
                }

                if (document == null) {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }

                String uploadDirPath = getUploadDirectoryPath(empNo_);
                JSONObject documentData = new JSONObject();
                if (fileName != null && !fileName.isEmpty()) {
                    Path filePath = Paths.get(uploadDirPath, fileName);
                    if (Files.exists(filePath)) {
                        try {
                            byte[] fileContent = Files.readAllBytes(filePath);
                            
                            
                            String encodedData = Base64.getEncoder().encodeToString(fileContent);
                             String decoded_data = IG.Decode(encodedData);
//                             System.out.println(decoded_data);
                            documentData.put("id", document.getId());
                            documentData.put("docIdentifier", document.getDocID());
                            documentData.put("emp_no", document.getEmployeeId());
                            documentData.put("dtid", document.getDocumentId());
                            documentData.put("creator", document.getCreatedBy());
                            documentData.put("filename", fileName);
                            documentData.put("content", encodedData);
                            // Send JSON object as response
                            response.setContentType("application/json");
                            response.setCharacterEncoding("UTF-8");
//                            PrintWriter out = response.getWriter();
                            out.print(documentData.toString());
                            out.flush();

                        } catch (IOException e) {
                            Logger.getLogger(documentUploads.class.getName()).log(Level.SEVERE, null, e);
                            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                            return;
                        }
                    } else {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found: " + fileName);
                        return;
                    }

                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    return;
                }

            } else {
                response.getWriter().println("Invalid action: " + action);
            }

        } catch (SQLException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            JSONObject obj = new JSONObject();
            // gets values of text fields
            String employeeId = request.getParameter("emp_no");
            String createdBy = request.getParameter("created_by");
            String docId = request.getParameter("ddlDocType");
            String documentValue = docId + employeeId;

            InputStream inputStream = null; // input stream of the upload file
            System.out.println(employeeId + createdBy + docId);
            // obtains the upload file part in this multipart request
            Part filePart = request.getPart("documentFile");

            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();

            }
            URL location = documentUploads.class.getProtectionDomain().getCodeSource().getLocation();
            myDrive = location.getFile().substring(1, 2);
            String uploadDirPath = "";
            if (utils.OSValidator.isWindows()) {
                uploadDirPath = myDrive + ":/HRH/DO_NOT_DELETE/_/_/Documents/employee_" + employeeId;
            } else if (utils.OSValidator.isUnix()) {
                uploadDirPath = "HRH/DO_NOT_DELETE/_/_/Documents/employee_" + employeeId;
            }
            // creates the save directory if it does not exists
            File fileSaveDir = new File(uploadDirPath);
            if (!fileSaveDir.exists()) {
                if (!fileSaveDir.mkdirs()) { // Try to create directory
                    obj.put("status", "error");
                    obj.put("message", "Failed to create directory"); // Handle directory creation error
                    return;
                }
            }
            String fileName = extractFileName(filePart);
            String fileSaveDir_ = "/HRH/DO_NOT_DELETE/_/_/Documents/employee_" + employeeId + "/";
            String destination = fileSaveDir_ + fileName;

            fileName = new File(fileName).getName();
            Path filePath = Paths.get(uploadDirPath, fileName);
            try {
                Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException ex) {
                obj.put("status", "error");
                obj.put("message", "Failed to save file"); // Handle file save error
                return;
            }

            // Save the document details to the database
            int dTid = Integer.parseInt(docId);
            DocumentDAO documentDAO = new DocumentDAO();
            Document document = new Document();
            document.setDocID(documentValue);
            document.setEmployeeId(employeeId);
            document.setDocumentId(dTid);
            document.setDocumentValue(fileName);
            document.setCreatedBy(createdBy);
            boolean uploadDoc = documentDAO.createDocument(document);
            if (uploadDoc != true) {
                obj.put("status", "error");
                obj.put("message", "Unable to add the Record....");   //create json object "status","message" and apply custome messages for "unable to delete data"

            } else {
                obj.put("status", "success");
                obj.put("message", "Saved Successfully....");

            }
        } catch (SQLException ex) {
            Logger.getLogger(documentUploads.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] contentDispositionSplit = contentDisposition.split(";");

        for (String contentDispositionPart : contentDispositionSplit) {
            if (contentDispositionPart.trim().startsWith("filename")) {
                String fileName = contentDispositionPart.substring(contentDispositionPart.indexOf("=") + 2,
                        contentDispositionPart.length() - 1);
                // Fix for Internet Explorer file path
                fileName = fileName.substring(fileName.lastIndexOf("\\") + 1, fileName.length());
                return fileName;
            }
        }
        return null;
    }

    private String getUploadDirectoryPath(String employeeId) {
        URL location = documentUploads.class.getProtectionDomain().getCodeSource().getLocation();
        String myDrive = location.getFile().substring(1, 2);
        String uploadDirPath = "";
        if (utils.OSValidator.isWindows()) {
            uploadDirPath = myDrive + ":/HRH/DO_NOT_DELETE/_/_/Documents/employee_" + employeeId;
        } else if (utils.OSValidator.isUnix()) {
            uploadDirPath = "HRH/DO_NOT_DELETE/_/_/Documents/employee_" + employeeId;
        }
        return uploadDirPath;
    }
}
