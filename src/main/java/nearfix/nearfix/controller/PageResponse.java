package nearfix.nearfix.controller;

import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public final class PageResponse {

    private PageResponse() {
    }

    public static void showMessage(HttpServletResponse response, String title, String message) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        String safeTitle = escapeHtml(title);
        String safeMessage = escapeHtml(message);

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("    <title>" + safeTitle + "</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("    <h1>" + safeTitle + "</h1>");
        out.println("    <p>" + safeMessage + "</p>");
        out.println("</body>");
        out.println("</html>");
    }

    private static String escapeHtml(String value) {
        if (value == null) {
            return "";
        }

        return value
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
}
