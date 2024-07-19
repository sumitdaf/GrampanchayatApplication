<%-- 
    Document   : ReportGeneration
    Created on : 12 May, 2022, 11:17:35 AM
    Author     : Beast
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="PanchayatUnion.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <!-- META DATA -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->



        <!--font-family-->
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">

        <!-- TITLE OF SITE -->
        <title>Panchayat Union</title>

        <!-- for title img -->
        <link rel="shortcut icon" type="image/icon" href="assets/images/logo/favicon.png"/>

        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!--linear icon css-->
        <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

        <!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css">

        <!--hover.css-->
        <link rel="stylesheet" href="assets/css/hover-min.css">

        <!--vedio player css-->
        <link rel="stylesheet" href="assets/css/magnific-popup.css">

        <!--owl.carousel.css-->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link href="assets/css/owl.theme.default.min.css" rel="stylesheet"/>


        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- bootsnav -->
        <link href="assets/css/bootsnav.css" rel="stylesheet"/>	

        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css">

        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css">
        <link rel="stylesheet" href="assets/css/table.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

        <!--[if lt IE 9]>
                        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <!--[if lte IE 9]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->

        <!--menu start-->
                <section style="background-color: #7370d8" class="navbar-fixed-top">
            <div class="container" >
                <div class="menubar">
                    <nav class="navbar navbar-default ">

                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div><!--/.navbar-header -->

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-center">
                                <li class="active"><a href="Admin_home.jsp">Home</a></li>
                                <li><a href="UserDetails.jsp">User Details</a></li>
                                <li><a href="NewWardEntry.jsp">New Ward Entry</a></li>
                                <li><a href="ViewWardDetails.jsp">View Ward Details</a></li>
                                <li><a href="NewElectricityEntry.jsp">New Electricity Entry</a></li>
                                <li><a href="ViewallConnections.jsp">View all Connections</a></li>
                                <li><a href="SetWaterPipe.jsp">Set Water Pipe</a></li>

                            </ul>
                            <ul class="nav navbar-nav navbar-center">
                                <li><a href="WaterConnections.jsp">Water Connections</a></li>
                                <li><a href="WardExpenses.jsp">Ward Expenses</a></li>
                                <li><a href="CheckExpenses.jsp">Check Expenses</a></li>
                                <li><a href="ViewComplaint.jsp">View Complaint</a></li>
                                <li><a href="Notification.jsp">Notification</a></li>
                                <li><a href="ReportGeneration.jsp">Report Generation</a></li>
                                <li><a href="Logout.jsp">Logout</a></li>
                            </ul><!-- / ul -->
                        </div><!-- /.navbar-collapse -->
                    </nav><!--/nav -->
                </div><!--/.menubar -->
            </div><!-- /.container -->

        </section><!--/#menu-->
   <%
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st3 = con.createStatement();
            Statement st4 = con.createStatement();
            Statement st5 = con.createStatement();
            
            ResultSet rs = st.executeQuery("Select count(id) as tuser from users");
            rs.next();
            String tuser=rs.getString("tuser");
            ResultSet rs1 = st1.executeQuery("Select count(id) as actuser from users where statuss='Active'");
            rs1.next();
            String actuser=rs1.getString("actuser");
            ResultSet rs2 = st2.executeQuery("Select count(id) as comp from complaints");
            rs2.next();
            String comp=rs2.getString("comp");
            ResultSet rs3 = st3.executeQuery("Select count(id) as elcon from electricity_con ");
            rs3.next();
            String elcon=rs3.getString("elcon");
            ResultSet rs4 = st4.executeQuery("Select count(id) as watercon from water_con ");
            rs4.next();
            String watercon=rs4.getString("watercon");
            ResultSet rs5 = st5.executeQuery("Select count(id) as noti from notification ");
            rs5.next();
            String not=rs5.getString("noti");
        %>
        <!--we-do start -->
        <br><br><br><br><br>
        <section  class="we-do">
            <div class="container">
                <div class="we-do-details">
                    <div class="section-header text-center">
                        <h2>Reports</h2>
                    </div><!--/.section-header-->
                    <br>
                            <br>
                            <h2>Overall Report</h2>
                            <br>
                            <br>
                            <table  id="customers">
                                <tr>
                                    <th style="width: 400px">Total Users</th>
                                    <td><%=tuser%></td>
                                </tr>
                                <tr>
                                    <th style="width: 400px">Active Users</th>
                                   <td><%=actuser%></td>
                                </tr>
                                <tr>
                                    <th style="width: 400px">Complaint Registered</th>
                                    <td><%=comp%></td>
                                </tr>
                                <tr>
                                    <th style="width: 400px">Electricity Connection</th>
                                    <td><%=elcon%></td>
                                </tr>
                                <tr>
                                    <th style="width: 400px">Water Connection</th>
                                    <td><%=watercon%></td>
                                </tr>
                                <tr>
                                    <th style="width: 400px">Notifications</th>
                                    <td><%=not%></td>
                                </tr>
                            </table>
                            <br>
                            <br>
                </div><!--/.we-do-details-->
            </div><!--/.container-->

        </section><!--/.we-do-->
        <!--we-do end-->

        <!-- footer-copyright start -->
        <footer class="footer-copyright">
            <div class="container">
                <div class="row">
                    <div class="col-sm-7">
                        <div class="foot-copyright pull-left">
                            <p>
                                &copy; All Rights Reserved.
                            </p>
                        </div><!--/.foot-copyright-->
                    </div><!--/.col-->
                </div><!--/.row-->
                <div id="scroll-Top">
                    <i class="fa fa-angle-double-up return-to-top" id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
                </div><!--/.scroll-Top-->
            </div><!-- /.container-->

        </footer><!-- /.footer-copyright-->
        <!-- footer-copyright end -->



        <!-- jaquery link -->

        <script src="assets/js/jquery.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->

        <!--modernizr.min.js-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>


        <!--bootstrap.min.js-->
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

        <!-- bootsnav js -->
        <script src="assets/js/bootsnav.js"></script>

        <!-- for manu -->
        <script src="assets/js/jquery.hc-sticky.min.js" type="text/javascript"></script>


        <!-- vedio player js -->
        <script src="assets/js/jquery.magnific-popup.min.js"></script>


        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

        <!--owl.carousel.js-->
        <script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>

        <!-- counter js -->
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>

        <!--Custom JS-->
        <script type="text/javascript" src="assets/js/jak-menusearch.js"></script>
        <script type="text/javascript" src="assets/js/custom.js"></script>


    </body>

</html>
