<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
  <jsp:include page="inc/head.jsp"></jsp:include>
<jsp:include page="inc/header.jsp"></jsp:include>
    <div class="breadcrumb-area mb-50">
      <div class="container">
        <div class="row">
          <div class="col">
            <div class="breadcrumb-container">
              <ul>
                <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                <li class="active">Cancel Order Form</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

	<div class="page-content mb-50">

    <div class="container">
     <div class="row">

      <div class="col-lg-12 col-md-12 pl-100 pl-xs-15">

         <div class="contact-form-content">
          <h3 class="contact-page-title">Cancellation form</h3>

          <div class="contact-form">
           <form  id="contact-form" action="Cancelorder.jsp" method="POST">
            <div class="form-group">
             <label>Order ID <span class="required">*</span></label>
             <input type="text" value="<%=request.getParameter("Orderid")%>" readonly>
             <input type="Hidden" name="Orderid" id="OD_ID" value="<%=request.getParameter("Orderid")%>">
           </div>
           <div class="form-group">
             <button type="submit" value="submit" id="submit" class="contact-form-btn" name="submit">Cancel Order</button>
           </div>
         </form>
       </div>
       <p class="form-messege pt-10 pb-10 mt-10 mb-10"></p>
     </div>
   </div>
 </div>
</div>
</div>
<jsp:include page="inc/footer.jsp"></jsp:include>
</body>

