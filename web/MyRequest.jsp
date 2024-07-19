<%-- 
    Document   : MyRequest
    Created on : 11 May, 2022, 5:00:39 PM
    Author     : Beast
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="PanchayatUnion.SQLconnection"%>
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
        <%
                    if (request.getParameter("not") != null) {%>
        <script>alert('Your Request Not Processed');</script>  
        <%}
        %>
        <%
                    if (request.getParameter("PaymentDone") != null) {%>
        <script>alert('Payment already Done');</script>  
        <%}
        %>
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
        <style>

        </style>

        <!--we-do start -->
        <section  class="we-do">
            <div class="container">
                <div class="we-do-details">
                    <div class="section-header text-center">
                        <h2>Request Details</h2>
                        <br>
                        <br>
                        <table id="customers">
                            <h2>Electricity Request</h2>
                             <br>
                            <br>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Electricity Type</th>
                                    <th>Address</th>
                                    <th>Status</th>
                                    <th>Price</th>
                                    <th>Bill Status</th>
                                    <th>Unique ID</th>
                                    <th>Time</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String uid = session.getAttribute("uid").toString();
                                    Connection con = SQLconnection.getconnection();
                                    Statement st = con.createStatement();
                                    try {
                                        ResultSet rs = st.executeQuery("Select * from electricity_con where uid='" + uid + "'");
                                        while (rs.next()) {
                                %>
                                <tr>
                                    <td ><%=rs.getString("id")%></td>
                                    <td  ><%=rs.getString("name")%></td>
                                    <td  ><%=rs.getString("etype")%></td>
                                    <td ><%=rs.getString("address")%></td>
                                    <td ><%=rs.getString("statuss")%></td>
                                    <td ><%=rs.getString("price")%></td>
                                    <td ><%=rs.getString("billstatus")%></td>
                                     <td ><%=rs.getString("elcuniqueid")%></td>
                                    <td ><%=rs.getString("time")%></td>
                                    <td ><a class="btn-success" href="elecpaycheck?id=<%=rs.getString("id")%>">Payment</a></td>
                                    <%                                        }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }

                                    %>
                                </tr>
                            </tbody>
                        </table>
                                <br>
                                <table id="customers">
                            <h2>Water Pipe Request</h2>
                            <br>
                            <br>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Status</th>
                                    <th>Price</th>
                                    <th>Bill Status</th>
                                    <th>Unique ID</th>
                                    <th>Time</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    
                                    
                                    Statement st1 = con.createStatement();
                                    try {
                                        ResultSet rs1 = st1.executeQuery("Select * from water_con where uid='" + uid + "'");
                                        while (rs1.next()) {
                                %>
                                <tr>
                                    <td ><%=rs1.getString("id")%></td>
                                    <td  ><%=rs1.getString("name")%></td>
                                    <td ><%=rs1.getString("address")%></td>
                                    <td ><%=rs1.getString("statuss")%></td>
                                    <td ><%=rs1.getString("price")%></td>
                                    <td ><%=rs1.getString("billstatus")%></td>
                                     <td ><%=rs1.getString("watuniqueid")%></td>
                                    <td ><%=rs1.getString("time")%></td>
                                    <td ><a class="btn-success" href="waterpaycheck?id=<%=rs1.getString("id")%>">Payment</a></td>
                                    <%                                        }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }

                                    %>
                                </tr>
                            </tbody>
                        </table>

                    </div><!--/.section-header-->

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




