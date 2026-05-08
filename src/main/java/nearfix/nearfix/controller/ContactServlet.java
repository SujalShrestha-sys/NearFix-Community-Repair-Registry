package nearfix.nearfix.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import nearfix.nearfix.service.impl.RepairService;
import nearfix.nearfix.service.iservice.IRepairService;

import java.io.IOException;

/**
 * ContactServlet - Handles the Contact Us page and message submission.
 */
@WebServlet("/contact")
public class ContactServlet extends HttpServlet {

    private static final String CONTACT_VIEW = "/WEB-INF/views/contact/contact.jsp";
    private final IRepairService repairService = new RepairService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        loadStats(request);
        // Forward to the Contact JSP
        request.getRequestDispatcher(CONTACT_VIEW).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Extract form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Use the variables to avoid warnings and log the submission
        System.out.println("--- Contact Submission Received ---");
        System.out.println("Name: " + firstName + " " + lastName);
        System.out.println("Email: " + email);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);

        // Set success attribute to show the success message in UI
        request.setAttribute("formSubmitted", true);

        loadStats(request);
        // Re-forward to the contact page to show success message
        request.getRequestDispatcher(CONTACT_VIEW).forward(request, response);
    }

    private void loadStats(HttpServletRequest request) {
        try {
            int itemsSaved = repairService.getTotalCompletedRepairs();
            request.setAttribute("itemsSaved", itemsSaved);
        } catch (Exception e) {
            request.setAttribute("itemsSaved", 0);
        }
    }
}
