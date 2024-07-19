<%-- 
    Document   : UserHome
    Created on : 11 May, 2022, 12:00:17 AM
    Author     : Beast
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
        <section id="menu">
            <div class="container">
                <div class="menubar">
                    <nav class="navbar navbar-default">

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
                                <li class="active"><a href="UserHome.jsp">Home</a></li>
                                <li><a href="WardDetails.jsp">Ward Details</a></li>
                                <li><a href="ElectricityReq.jsp">Electricity Request</a></li>
                                <li><a href="WaterPipeReq.jsp">Water Pipe Request</a></li>
                                <li><a href="MyRequest.jsp">My Request</a></li>
                                <li><a href="raiseComplaint.jsp">Complaint</a></li>
                                <li><a href="UNotifications.jsp">Notifications</a></li>
                                <li><a href="Logout.jsp">Logout</a></li>
                            </ul><!-- / ul -->
                        </div><!-- /.navbar-collapse -->
                    </nav><!--/nav -->
                </div><!--/.menubar -->
            </div><!-- /.container -->

        </section><!--/#menu-->

        <!--we-do start -->
        <section  class="we-do">
            <div class="container">
                <div class="we-do-details" style="background-color: #a6a3f7">
                    <div class="section-header text-center">
                        <h2>New Electricity Connection Payment</h2>
                    </div><!--/.section-header-->

                    <%
                        String id = request.getParameter("id");
                        Connection con = SQLconnection.getconnection();
                        Statement st = con.createStatement();
                        try {
                            ResultSet rs = st.executeQuery("Select * from electricity_con where id='" + id + "'");
                            while (rs.next()) {
                    %>
                    <div class="contact-content"> 
                        <div class="row">
                            <div class="col-sm-offset-3 col-sm-6">
                                <div class="single-contact-box">
                                    <div class="contact-form">
                                        <form action="elecPayment" method="post" >
                                            <input type="hidden" value="<%=rs.getString("id")%>" name="id">
                                            <div class="row">
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Service Cost</label>
                                                        <input type="text" class="form-control" id="phone" placeholder="Service Cost" value="<%=rs.getString("price")%>" name="scost">
                                                    </div><!--/.form-group-->
                                                </div><!--/.col-->
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">

                                                    <div class="single-contact-btn">
                                                        <button  class="contact-btn" type="submit">Pay</button>
                                                    </div><!--/.single-single-contact-btn-->
                                                </div><!--/.col-->
                                            </div>
                                        </form>
                                        <!--/form-->
                                    </div><!--/.contact-form-->
                                </div><!--/.single-contact-box-->
                            </div>
                        </div>
                        <br><br><!--/.row-->
                    </div><!--/.contact-content-->
                    <%                                        }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
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
