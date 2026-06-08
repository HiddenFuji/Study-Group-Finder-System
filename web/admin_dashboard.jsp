<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />

<div class="container-fluid py-4">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="fw-bold"><i class="bi bi-speedometer2 text-danger me-2"></i>Admin Dashboard</h2>
            <p class="text-muted">System Overview & Analytics</p>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-md-3">
            <div class="card bg-primary text-white shadow rounded-4 border-0 h-100">
                <div class="card-body p-4 d-flex flex-column justify-content-between">
                    <div>
                        <h6 class="text-uppercase fw-bold opacity-75">Total Students</h6>
                        <h1 class="display-4 fw-bold mb-0">${studentCount}</h1>
                    </div>
                    <div class="mt-3 text-end"><i class="bi bi-people-fill fs-1 opacity-50"></i></div>
                </div>
                <a href="${pageContext.request.contextPath}/admin?action=users" class="card-footer bg-white bg-opacity-10 text-white text-decoration-none text-center border-top-0 rounded-bottom-4">
                    Manage Users <i class="bi bi-arrow-right-circle ms-1"></i>
                </a>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card bg-success text-white shadow rounded-4 border-0 h-100">
                <div class="card-body p-4 d-flex flex-column justify-content-between">
                    <div>
                        <h6 class="text-uppercase fw-bold opacity-75">Active Groups</h6>
                        <h1 class="display-4 fw-bold mb-0">${groupCount}</h1>
                    </div>
                    <div class="mt-3 text-end"><i class="bi bi-collection-fill fs-1 opacity-50"></i></div>
                </div>
                <a href="${pageContext.request.contextPath}/admin?action=groups" class="card-footer bg-white bg-opacity-10 text-white text-decoration-none text-center border-top-0 rounded-bottom-4">
                    Manage Groups <i class="bi bi-arrow-right-circle ms-1"></i>
                </a>
            </div>
        </div>
    </div>

</div>

<jsp:include page="footer.jsp" />
