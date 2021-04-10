<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.swing.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />

    <title>Admin Panel</title>
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <link href="../builds/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-home"></i> <span>Admin Panel</span></a>
              
            </div>

            <div class="clearfix"></div>

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-dashboard"></i> Dashboard </a></li>
                  <li><a href="UserRegistered.jsp"><i class="fa fa-user"></i> User Registered </a></li>
                  <li><a href=""><i class="fa fa-plus sign"></i>Add Products</a> </li>
                  <li><a href=""><i class="fa fa-database"></i>Backup</a> </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
              <nav class="nav navbar-nav">
              <ul class=" navbar-right">
                <li class="nav-item dropdown open" style="padding-left: 15px;">
                  <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                    <img src="production/images/img.jpg" alt="">John Doe
                  </a>
                  <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item"  href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                  </div>
                </li>

              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">

                <div class="clearfix"></div>
                <div class="col-md-12 col-sm-12  ">
                   
          <br />


          </div>

                </div>
              </div>
            </div>
        <!-- /page content -->
			 <div class="right_col" role="main">

            <div class="clearfix"></div>
            <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Backup</h2>
                    <div class="clearfix"></div>
                  </div>
                  <% 
                  JFileChooser chooser = new JFileChooser();
                  chooser.setCurrentDirectory(new java.io.File("."));
                  chooser.setDialogTitle("select folder");
                  chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
                  chooser.setAcceptAllFileFilterUsed(false);
                  %>
                </div>
            </div>
             </div>
        <!-- footer content -->
        <footer>
          
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../builds/js/custom.min.js"></script>
	
  </body>
</html>
