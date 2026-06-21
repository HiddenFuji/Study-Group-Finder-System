package controller;

import dao.*;
import model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.StudyGroup;
import model.StudySession;
import model.Notification;

/**
 * DashboardServlet — Controller Layer
 * Shows: active groups, upcoming sessions, notifications, recent activity.
 */
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private final StudyGroupDAO   groupDAO   = new StudyGroupDAO();
    private final StudySessionDAO sessionDAO = new StudySessionDAO();
    private final NotificationDAO notifDAO   = new NotificationDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Auth guard
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("loggedUser") : null;
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/auth?action=login");
            return;
        }

        try {
            int uid = user.getUserId();

            // My groups (created + joined)
            List<StudyGroup> createdGroups = groupDAO.getByCreator(uid);
            List<StudyGroup> joinedGroups  = groupDAO.getJoinedByUser(uid);

            // Upcoming sessions (max 5)
            List<StudySession> upcomingSessions = sessionDAO.getUpcomingForUser(uid, 5);

            // Notifications (unread count + list)
            List<Notification> notifications = notifDAO.getForUser(uid);
            int unreadCount = notifDAO.countUnread(uid);

            req.setAttribute("createdGroups",    createdGroups);
            req.setAttribute("joinedGroups",     joinedGroups);
            req.setAttribute("upcomingSessions", upcomingSessions);
            req.setAttribute("notifications",    notifications);
            req.setAttribute("unreadCount",      unreadCount);

            req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);

        } catch (Exception e) {
            req.setAttribute("error", "Failed to load dashboard: " + e.getMessage());
            req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
        }
    }
}
