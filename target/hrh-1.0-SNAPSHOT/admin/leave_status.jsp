<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Leave Status</title>

   
<link rel="stylesheet" href="../assets/css/bootstrap.css">
<link rel="stylesheet" href="../assets/vendor/DataTables/datatables.css">
<script defer src="../assets/fontawesome/js/all.min.js"></script>

<link rel="stylesheet" href="../assets/css/app.css">
<link rel="shortcut icon" href="../assets/images/favicon.svg"
	type="image/x-icon">
</head>
<body>
	<%
	String _id = (String) session.getAttribute("userid");
	if (_id != null) {
	%>
	 <input type="hidden" name="__STAFFID" id="__STAFFID"	value="<% out.println(_id);%>" />
      <%@include file="/_includes/header.jsp"%>
				<button class="sidebar-toggler btn x">
					<i data-feather="x"></i>
				</button>
			</div>
		</div>
		<div id="main">
			<nav class="navbar navbar-header navbar-expand navbar-light">
				<a class="sidebar-toggler" href="#"><span
					class="navbar-toggler-icon"></span></a>
				<button class="btn navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul
						class="navbar-nav d-flex align-items-center navbar-light ms-auto">

						<li class="dropdown"><a href="#" data-bs-toggle="dropdown"
							class="nav-link dropdown-toggle nav-link-lg nav-link-user">
								<div class="avatar me-1">
									<img src="../assets/images/admin.png" alt="" srcset="">
								</div>
								<div class="d-none d-md-block d-lg-inline-block">
									Hi,
									<%
								if (session.getAttribute("userid") != null) {
									out.println(session.getAttribute("fullname").toString());
								}
								%>
								</div>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="update.html"><i
									data-feather="user"></i> Account</a> <a class="dropdown-item"
									href="update_password.jsp"><i data-feather="settings"></i>
									Settings</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="./Logout"><i
									data-feather="log-out"></i> Logout</a>
							</div></li>
					</ul>
				</div>
			</nav>

			<div class="main-content container-fluid">
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>Manage Leave Status</h3>
						</div>
						<div class="col-12 col-md-6 order-md-2 order-first">
							<nav aria-label="breadcrumb" class='breadcrumb-header'>
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html"
										class="text-success">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Manage
										Leave Status</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				<section class="section">
					<div class="card">
						<div class="card-body">
							<table class='table' id="leave_table">
								<thead>
									<tr>
										<th>Leave Type</th>
										<th>From</th>
										<th>To</th>
										<th>Posting Date</th>
										<th>Remark</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody id="leave_table_data">
									<tr>
										<td>Casual Leave</td>
										<td>2021-11-02</td>
										<td>2021-11-05</td>
										<td>2021-11-01</td>
										<td>waiting for approval</td>
										<td><span class="badge bg-info">Pending</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</section>
			</div>
		</div>
	</div>
	<!-- JavaScript files-->
	
	<script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/DataTables/datatables.js"></script>
	<script src="../assets/vendor/popper.js/umd/popper.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="../assets/vendor/chart.js/Chart.min.js"></script>
	<script src="../assets/vendor/jquery-validation/jquery.validate.min.js"></script>

		<script src="../assets/vendor/additional/additional.js"></script>
	<script src="../assets/js/feather-icons/feather.min.js"></script>
	<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="../assets/js/app.js"></script>

        <script src="../assets/js/pages/applications_leave.js"></script>
	<script src="../assets/js/main.js"></script>
 <%@include file="/_includes/include_footer.jsp"%>
</body>

</html>