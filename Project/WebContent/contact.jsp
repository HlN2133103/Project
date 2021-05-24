<body>
	<jsp:include page="inc/head.jsp"></jsp:include>
	<jsp:include page="inc/header.jsp"></jsp:include>

	<div class="breadcrumb-area mb-50">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb-container">
						<ul>
							<li>
							<a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                            <li class="active">Contact</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<div class="page-content mb-50">
        <div class="container">
           <div class="row">
            <div class="col-lg-3 col-md-4 mb-xs-35">
           

             <div class="contact-page-side-content">
              <h3 class="contact-page-title">Contact Us</h3>

          

              <div class="single-contact-block">
               <h4><img src="assets/images/icons/contact-icon1.png" alt=""> Address</h4>
               <p></p>
           </div>


           <div class="single-contact-block">
               <h4><img src="assets/images/icons/contact-icon2.png" alt=""> Phone</h4>
               <p>Mobile: (+91)9987447527</p>
           </div>

           <div class="single-contact-block">
               <h4><img src="assets/images/icons/contact-icon3.png" alt=""> Email</h4>
               <p>programmingarmy2020@gmail.com</p>
              
           </div>
       </div>

   </div>
   <div class="col-lg-9 col-md-8 pl-100 pl-xs-15">

     <div class="contact-form-content">
      <h3 class="contact-page-title">Tell Us Your Message</h3>

      <div class="contact-form">
       <form  id="contact-form" action="contactUs" method="post">
        <div class="form-group">
         <label>Your Name <span class="required">*</span></label>
         <input type="text" name="customerName" id="customername" required>
     </div>
     <div class="form-group">
         <label>Your Email <span class="required">*</span></label>
         <input type="email" name="customerEmail" id="customerEmail" required>
     </div>
     <div class="form-group">
         <label>Subject</label>
         <input type="text" name="contactSubject" id="contactSubject">
     </div>
     <div class="form-group">
         <label>Comments</label>
         <textarea name="contactMessage" id="contactMessage" ></textarea>
     </div>
     <div class="form-group">
         <input type="submit" value="Send" class="contact-form-btn" >
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