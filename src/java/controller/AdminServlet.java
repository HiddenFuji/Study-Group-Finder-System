package controller;

import dao.StudyGroupDAO;
import dao.StudySessionDAO;
import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();
    private StudyGroupDAO groupDAO = new StudyGroupDAO();
    private StudySessionDAO sessionDAO = new StudySessionDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user is logged in and is admin
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/auth?action=login");
            return;
        }

        User user = (User) session.getAttribute("loggedUser");
        if (!user.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            action = "dashboard";
        }

        try {
            if (action.equals("users")) {
                request.setAttribute("users", userDAO.getAllUsers());
                request.getRequestDispatcher("/admin_users.jsp").forward(request, response);
            } else if (action.equals("groups")) {
                request.setAttribute("groups", groupDAO.getAllForAdmin());
                request.getRequestDispatcher("/admin_groups.jsp").forward(request, response);
            } else {
                // Default is dashboard
                request.setAttribute("totalStudents", userDAO.countStudents());
                request.setAttribute("totalGroups", groupDAO.countAll());
                request.setAttribute("totalSessions", sessionDAO.countAll());
                request.setAttribute("recentUsers", userDAO.getAllUsers());
                request.getRequestDispatcher("/admin_dashboard.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/admin_dashboard.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user is logged in and is admin
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/auth?action=login");
            return;
        }

        User user = (User) session.getAttribute("loggedUser");
        if (!user.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            if (action.equals("deleteUser")) {
                String userIdStr = request.getParameter("user_id");
                int userId = 0;
                if (userIdStr != null && !userIdStr.isEmpty()) {
                    userId = Integer.parseInt(userIdStr);
                }
                userDAO.deleteUser(userId);
                response.sendRedirect(request.getContextPath() + "/admin?action=users&msg=deleted");
            } else if (action.equals("changeRole")) {
                String userIdStr = request.getParameter("user_id");
                int userId = 0;
                if (userIdStr != null && !userIdStr.isEmpty()) {
                    userId = Integer.parseInt(userIdStr);
                }
                String newRole = request.getParameter("role");
                if (newRole != null && (newRole.equals("admin") || newRole.equals("student"))) {
                    userDAO.changeRole(userId, newRole);
                }
                response.sendRedirect(request.getContextPath() + "/admin?action=users&msg=roleChanged");
            } else if (action.equals("deleteGroup")) {
                String groupIdStr = request.getParameter("group_id");
                int groupId = 0;
                if (groupIdStr != null && !groupIdStr.isEmpty()) {
                    groupId = Integer.parseInt(groupIdStr);
                }
                groupDAO.delete(groupId);
                response.sendRedirect(request.getContextPath() + "/admin?action=groups&msg=deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin");
            }
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/admin");
        }
    }
}
