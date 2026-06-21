<%@ page contentType="text/html;charset=UTF-8" import="model.*, java.util.List" %>
<%
    User user = (User) session.getAttribute("loggedUser");
    if (user == null) { response.sendRedirect(request.getContextPath() + "/auth?action=login"); return; }
    
    List<StudyGroup> createdGroups = (List<StudyGroup>) request.getAttribute("createdGroups");
    List<StudyGroup> joinedGroups = (List<StudyGroup>) request.getAttribute("joinedGroups");
    int totalGroups = (createdGroups != null ? createdGroups.size() : 0) + (joinedGroups != null ? joinedGroups.size() : 0);
%>
<%@ include file="header.jsp" %>

<div class="container py-4">
    
<%
    List<StudySession> upcomingSessions = (List<StudySession>) request.getAttribute("upcomingSessions");
    List<Notification> notifications = (List<Notification>) request.getAttribute("notifications");
%>

    <!-- Welcome Banner -->
    <div class="bg-primary text-white rounded-4 p-4 p-md-5 mb-4" style="box-shadow: 0 4px 6px -1px rgba(37,99,235,0.2);">
        <h2 class="fw-bold mb-2">Welcome, <%= loggedUser.getFullName() %>!</h2>
        <div class="opacity-75" style="font-size: 0.95rem;">
            <%= user.getMajor() != null ? user.getMajor() : "Computer Science" %> • 
            <%= user.getAcademicYear() != null ? user.getAcademicYear() : "3rd Year" %> • 
            <%= user.getUniversity() != null ? user.getUniversity() : "State University" %>
        </div>
    </div>

    <!-- 3 Stat Cards -->
    <div class="row g-3 mb-4">
        <!-- Active Groups -->
        <div class="col-md-4">
            <div class="simple-card p-4 d-flex align-items-center h-100">
                <div class="rounded p-3 me-4 icon-container-blue">
                    <i class="bi bi-people-fill fs-4"></i>
                </div>
                <div>
                    <div class="text-muted small fw-medium mb-1">Active Groups</div>
                    <h4 class="fw-bold mb-0 text-dark"><%= totalGroups %></h4>
                </div>
            </div>
        </div>
        
        <!-- Upcoming Sessions -->
        <div class="col-md-4">
            <div class="simple-card p-4 d-flex align-items-center h-100">
                <div class="rounded p-3 me-4 icon-container-green">
                    <i class="bi bi-calendar-event fs-4"></i>
                </div>
                <div>
                    <div class="text-muted small fw-medium mb-1">Upcoming Sessions</div>
                    <h4 class="fw-bold mb-0 text-dark"><%= upcomingSessions != null ? upcomingSessions.size() : 0 %></h4>
                </div>
            </div>
        </div>
        
        <!-- Groups Led -->
        <div class="col-md-4">
            <div class="simple-card p-4 d-flex align-items-center h-100">
                <div class="rounded p-3 me-4 icon-container-purple">
                    <i class="bi bi-star-fill fs-4"></i>
                </div>
                <div>
                    <div class="text-muted small fw-medium mb-1">Groups Led</div>
                    <h4 class="fw-bold mb-0 text-dark"><%= createdGroups != null ? createdGroups.size() : 0 %></h4>
                </div>
            </div>
        </div>
    </div>

    <!-- Upcoming Sessions Schedule -->
    <div class="simple-card p-4 mt-2">
        <h5 class="fw-bold text-dark mb-4 d-flex align-items-center">
            <i class="bi bi-calendar-check text-primary me-2"></i> Your Schedule
        </h5>
        
        <% if (upcomingSessions != null && !upcomingSessions.isEmpty()) { %>
            <div class="list-group list-group-flush">
            <% for (StudySession s : upcomingSessions) { 
                boolean isVirtual = s.getMeetingLink() != null && !s.getMeetingLink().trim().isEmpty();
            %>
                <a href="<%= ctx %>/groups?action=detail&id=<%= s.getGroupId() %>&tab=sessions" class="list-group-item list-group-item-action py-3 px-0 border-bottom border-light d-flex align-items-center gap-3 bg-transparent" style="transition: all 0.2s;">
                    <div class="rounded-4 bg-success bg-opacity-10 text-success d-flex align-items-center justify-content-center flex-shrink-0" style="width: 50px; height: 50px;">
                        <i class="bi bi-calendar-event fs-4"></i>
                    </div>
                    <div class="flex-grow-1">
                        <h6 class="fw-bold text-dark mb-1"><%= s.getSessionTitle() %></h6>
                        <div class="d-flex flex-wrap gap-3 text-muted" style="font-size: 0.85rem;">
                            <span><i class="bi bi-clock me-1"></i><%= s.getSessionDate() %> at <%= s.getSessionTime() %></span>
                            <span class="text-primary"><i class="bi <%= isVirtual ? "bi-camera-video" : "bi-geo-alt" %> me-1"></i><%= isVirtual ? "Virtual" : s.getLocation() %></span>
                        </div>
                    </div>
                    <i class="bi bi-chevron-right text-muted opacity-50 pe-2"></i>
                </a>
            <% } %>
            </div>
        <% } else { %>
            <div class="text-center py-5 text-muted bg-light rounded-4">
                <i class="bi bi-calendar-x display-6 opacity-25 d-block mb-3"></i>
                <p class="mb-0 fw-medium">No upcoming sessions scheduled.</p>
                <a href="<%= ctx %>/groups?action=find" class="btn btn-sm btn-outline-primary mt-3 px-4 rounded-pill">Explore Groups</a>
            </div>
        <% } %>
    </div>

<%@ include file="footer.jsp" %>
