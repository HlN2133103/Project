<body>
	<jsp:include page="inc/head.jsp"></jsp:include>
	<jsp:include page="inc/header.jsp"></jsp:include>

	<div class="breadcrumb-area mb-50">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="breadcrumb-container">
						<ul>
							<li><a
								href="index.jsp><i class="fa fa-home"></i> Home</a></li>
                            <li class="active">Contact</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<div class="page-content mb-50">

		
		<div class="google-map-container mb-70">
            <iframe src="" tabindex="0"></iframe>
            <!-- <div id="google-map"></div> -->
        </div>

        <!--=====  End of google map container  ======-->

        <div class="container">
           <div class="row">
            <div class="col-lg-3 col-md-4 mb-xs-35">
             <!--=======  contact page side content  =======-->

             <div class="contact-page-side-content">
              <h3 class="contact-page-title">Contact Us</h3>

              <!--=======  single contact block  =======-->

              <div class="single-contact-block">
               <h4><img src="assets/images/icons/contact-icon1.png" alt=""> Address</h4>
               <p>Shop Number 6, Shanti Nagar, A/15, Shanti Vihar, Mira Road, Mira Bhayandar, Maharashtra 401107</p>
           </div>

           <!--=======  End of single contact block  =======-->

           <!--=======  single contact block  =======-->

           <div class="single-contact-block">
               <h4><img src="assets/images/icons/contact-icon2.png" alt=""> Phone</h4>
               <p>Mobile1: (+91)9322927241</p>
               <p>Mobile2: (+91)7498258166</p>
               <p>Mobile2: (+91)9323846307</p>
           </div>

           <!--=======  End of single contact block  =======-->

           <!--=======  single contact block  =======-->

           <div class="single-contact-block">
               <h4><img src="assets/images/icons/contact-icon3.png" alt=""> Email</h4>
               <p>madhuramhelpdesk@madhuramsweets.in</p>
               <!-- <p>support@hastech.company</p> -->
           </div>

           <!--=======  End of single contact block  =======-->
       </div>

       <!--=======  End of contact page side content  =======-->

   </div>
   <div class="col-lg-9 col-md-8 pl-100 pl-xs-15">
     <!--=======  contact form content  =======-->

     <div class="contact-form-content">
      <h3 class="contact-page-title">Tell Us Your Message</h3>
      <?php echo $error; ?>

      <div class="contact-form">
       <form  id="contact-form" action="" method="POST">
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
         <button type="submit" value="submit" id="submit" class="contact-form-btn" name="submit">send</button>
     </div>
 </form>
</div>
<p class="form-messege pt-10 pb-10 mt-10 mb-10"></p>
</div>

<!--=======  End of contact form content =======-->
</div>
</div>
</div>
</div>
<jsp:include page="inc/footer.jsp"></jsp:include>

></a></li></ul></div></div></div></div></div></body>