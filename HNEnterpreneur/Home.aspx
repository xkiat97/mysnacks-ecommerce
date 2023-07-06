<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HNEnterpreneur.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">

    <!-- Font awesome -->
    <link href="assets/css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!-- Slick slider -->
    <link rel="stylesheet" type="text/css" href="assets/css/slick.css">
    <!-- Date Picker -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datepicker.css">
    <!-- Gallery Lightbox -->
    <link href="assets/css/magnific-popup.css" rel="stylesheet">
    <!-- Theme color -->
    <link id="switcher" href="assets/css/theme-color/default-theme.css" rel="stylesheet">

    <!-- Main style sheet -->
    <link href="style.css" rel="stylesheet">

    <!-- Google Fonts -->

    <!-- Prata for body  -->
    <link href='https://fonts.googleapis.com/css?family=Prata' rel='stylesheet' type='text/css'>
    <!-- Tangerine for small title -->
    <link href='https://fonts.googleapis.com/css?family=Tangerine' rel='stylesheet' type='text/css'>
    <!-- Open Sans for title -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- Start slider  -->
    <section id="mu-slider">
        <div class="mu-slider-area">

            <!-- Top slider -->
            <div class="mu-top-slider">

                <!-- Top slider single slide -->
                <div class="mu-top-slider-single">
                    <img src="assets/img/slider/1.jpeg" alt="img">
                    <!-- Top slider content -->
                    <div class="mu-top-slider-content">
                        <span class="mu-slider-small-title">Welcome</span>
                        <h2 class="mu-slider-title">To H&N Enterprise</h2>
                        <p>We are ready to provide a variety of delicious snacks and high quality service for you.</p>
                        <a href="Products.aspx" onclick="location='Products.aspx'" class="mu-readmore-btn mu-reservation-btn">BUY SNACKS</a>
                    </div>
                    <!-- / Top slider content -->
                </div>
                <!-- / Top slider single slide -->

                <!-- Top slider single slide -->
                <div class="mu-top-slider-single">
                    <img src="assets/img/slider/2.jpeg" alt="img">
                    <!-- Top slider content -->
                    <div class="mu-top-slider-content">
                        <span class="mu-slider-small-title">The Capaciousness</span>
                        <h2 class="mu-slider-title">In-Store Purchase</h2>
                        <p>H&N Enterprise provides beautiful and spacious atmosphere to you when you walk in and purchase.</p>
                        <a href="Products.aspx" onclick="location='Products.aspx'" class="mu-readmore-btn mu-reservation-btn">BUY SNACKS</a>
                    </div>
                    <!-- / Top slider content -->
                </div>
                <!-- / Top slider single slide -->

                <!-- Top slider single slide -->
                <div class="mu-top-slider-single">
                    <img src="assets/img/slider/3.jpeg" alt="img">
                    <!-- Top slider content -->
                    <div class="mu-top-slider-content">
                        <span class="mu-slider-small-title">Delicious</span>
                        <h2 class="mu-slider-title">Variety of Snacks</h2>
                        <p>We provides a variety of snacks with different tastes that perfectly match with you.</p>
                        <a href="Products.aspx" onclick="location='Products.aspx'" class="mu-readmore-btn mu-reservation-btn">BUY SNACKS</a>
                    </div>
                    <!-- / Top slider content -->
                </div>
                <!-- / Top slider single slide -->

            </div>
        </div>
    </section>
    <!-- End slider  -->

    <!-- Start About us -->
    <section id="mu-about-us" style="background-color:white;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="mu-about-us-area">

                        <div class="mu-title">
                            <span class="mu-subtitle">Discover</span>
                            <h2>ABOUT US</h2>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mu-about-us-left">
                                    <img src="assets/img/about-us.png" alt="img">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mu-about-us-right">
                                    <p style="text-align:justify;">H&N Enterprise was founded by Tan Hong Kiat and Ng Ke Ning as a snacks-delivery company in 2017. 
                                        H&N Enterprise primarily focuses on sales and company products. The company products are mainly 
                                        focusing on snacks, which provide customers a variety of different kind of snacks, in order for them 
                                        to purchase the one they like. Our business operation hour starts from 9am to 6pm daily.</p>
                                    <ul style="text-align:justify;">
                                        <li>We provide delivery services to all customers.</li>
                                        <li>We are serious about issues like food safety, our own standard of service delivery, and changing consumer tastes.</li>
                                        <li>Our vision is to rank among the most popular and sought-after snacks-delivery company among competitors in Malaysia and slowly expand to the international market.</li>
                                        <li>Our goal is to advocate all sorts of snacks of various races in Malaysia not only for local people but also for tourists that came to visit Malaysia.</li>
                                        <li>Our key objective – 'To make the Finest Quality snack products and snacks available to consumer'</li>
                                        <li>We pledge to preserve the highest level of quality in our products and provide excellent value-for-money to valued customers.</li>
                                    </ul>
                                    <p>You are in the right place for purchasing snacks from us.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End About us -->

    <!-- Start Counter Section -->
    <section id="mu-counter">
        <div class="mu-counter-overlay">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-counter-area">

                            <ul class="mu-counter-nav">

                                <li class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="mu-single-counter">
                                        <span>Fresh</span>
                                        <h3><span class="counter-value" data-count="50">0</span><sup>+</sup></h3>
                                        <p>Chinese Snacks</p>
                                    </div>
                                </li>

                                <li class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="mu-single-counter">
                                        <span>Delicious</span>
                                        <h3><span class="counter-value" data-count="60">0</span><sup>+</sup></h3>
                                        <p>Malay Snacks</p>
                                    </div>
                                </li>

                                <li class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="mu-single-counter">
                                        <span>Crispy</span>
                                        <h3><span class="counter-value" data-count="45">0</span><sup>+</sup></h3>
                                        <p>Indian Snacks</p>
                                    </div>
                                </li>

                                <li class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="mu-single-counter">
                                        <span>Satisfied</span>
                                        <h3><span class="counter-value" data-count="6560">0</span><sup>+</sup></h3>
                                        <p>Customers</p>
                                    </div>
                                </li>

                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Counter Section -->

    <!-- Start Gallery -->
    <section id="mu-gallery" style="background-color:white;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="mu-gallery-area">

                        <div class="mu-title">
                            <span class="mu-subtitle">Discover</span>
                            <h2>Our Gallery</h2>
                        </div>

                        <div class="mu-gallery-content">

                            <!-- Start gallery image -->
                            <div class="mu-gallery-body">
                                <!-- start single gallery image -->
                                <div class="mu-single-gallery col-md-4">
                                    <div class="mu-single-gallery-item">
                                        <figure class="mu-single-gallery-img">
                                            <a class="mu-imglink" href="assets/img/gallery/1.jpg">
                                                <img alt="img" src="assets/img/gallery/1.jpg">
                                                <div class="mu-single-gallery-info">
                                                    <img class="mu-view-btn" src="assets/img/plus.png" alt="plus icon img">
                                                </div>
                                            </a>
                                        </figure>
                                    </div>
                                </div>
                                <!-- End single gallery image -->

                                <!-- start single gallery image -->
                                <div class="mu-single-gallery col-md-4">
                                    <div class="mu-single-gallery-item">
                                        <figure class="mu-single-gallery-img">
                                            <a class="mu-imglink" href="assets/img/gallery/2.jpg">
                                                <img alt="img" src="assets/img/gallery/2.jpg">
                                                <div class="mu-single-gallery-info">
                                                    <img class="mu-view-btn" src="assets/img/plus.png" alt="plus icon img">
                                                </div>
                                            </a>
                                        </figure>
                                    </div>
                                </div>
                                <!-- End single gallery image -->

                                <!-- start single gallery image -->
                                <div class="mu-single-gallery col-md-4">
                                    <div class="mu-single-gallery-item">
                                        <figure class="mu-single-gallery-img">
                                            <a class="mu-imglink" href="assets/img/gallery/3.jpg">
                                                <img alt="img" src="assets/img/gallery/3.jpg">
                                                <div class="mu-single-gallery-info">
                                                    <img class="mu-view-btn" src="assets/img/plus.png" alt="plus icon img">
                                                </div>
                                            </a>
                                        </figure>
                                    </div>
                                </div>
                                <!-- End single gallery image -->

                                <!-- start single gallery image -->
                                <div class="mu-single-gallery col-md-4">
                                    <div class="mu-single-gallery-item">
                                        <figure class="mu-single-gallery-img">
                                            <a class="mu-imglink" href="assets/img/gallery/4.jpg">
                                                <img alt="img" src="assets/img/gallery/4.jpg">
                                                <div class="mu-single-gallery-info">
                                                    <img class="mu-view-btn" src="assets/img/plus.png" alt="plus icon img">
                                                </div>
                                            </a>
                                        </figure>
                                    </div>
                                </div>
                                <!-- End single gallery image -->

                                <!-- start single gallery image -->
                                <div class="mu-single-gallery col-md-4">
                                    <div class="mu-single-gallery-item">
                                        <figure class="mu-single-gallery-img">
                                            <a class="mu-imglink" href="assets/img/gallery/5.jpg">
                                                <img alt="img" src="assets/img/gallery/5.jpg">
                                                <div class="mu-single-gallery-info">
                                                    <img class="mu-view-btn" src="assets/img/plus.png" alt="plus icon img">
                                                </div>
                                            </a>
                                        </figure>
                                    </div>
                                </div>
                                <!-- End single gallery image -->

                                <!-- start single gallery image -->
                                <div class="mu-single-gallery col-md-4">
                                    <div class="mu-single-gallery-item">
                                        <figure class="mu-single-gallery-img">
                                            <a class="mu-imglink" href="assets/img/gallery/6.jpg">
                                                <img alt="img" src="assets/img/gallery/6.jpg">
                                                <div class="mu-single-gallery-info">
                                                    <img class="mu-view-btn" src="assets/img/plus.png" alt="plus icon img">
                                                </div>
                                            </a>
                                        </figure>
                                    </div>
                                </div>
                                <!-- End single gallery image -->

                                <!-- start single gallery image -->
                                <div class="mu-single-gallery col-md-4">
                                    <div class="mu-single-gallery-item">
                                        <figure class="mu-single-gallery-img">
                                            <a class="mu-imglink" href="assets/img/gallery/7.jpg">
                                                <img alt="img" src="assets/img/gallery/7.jpg">
                                                <div class="mu-single-gallery-info">
                                                    <img class="mu-view-btn" src="assets/img/plus.png" alt="plus icon img">
                                                </div>
                                            </a>
                                        </figure>
                                    </div>
                                </div>
                                <!-- End single gallery image -->

                                <!-- start single gallery image -->
                                <div class="mu-single-gallery col-md-4">
                                    <div class="mu-single-gallery-item">
                                        <figure class="mu-single-gallery-img">
                                            <a class="mu-imglink" href="assets/img/gallery/8.jpg">
                                                <img alt="img" src="assets/img/gallery/8.jpg">
                                                <div class="mu-single-gallery-info">
                                                    <img class="mu-view-btn" src="assets/img/plus.png" alt="plus icon img">
                                                </div>
                                            </a>
                                        </figure>
                                    </div>
                                </div>
                                <!-- End single gallery image -->

                                <!-- start single gallery image -->
                                <div class="mu-single-gallery col-md-4">
                                    <div class="mu-single-gallery-item">
                                        <figure class="mu-single-gallery-img">
                                            <a class="mu-imglink" href="assets/img/gallery/9.jpg">
                                                <img alt="img" src="assets/img/gallery/9.jpg">
                                                <div class="mu-single-gallery-info">
                                                    <img class="mu-view-btn" src="assets/img/plus.png" alt="plus icon img">
                                                </div>
                                            </a>
                                        </figure>
                                    </div>
                                </div>
                                <!-- End single gallery image -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Gallery -->

    <!-- Start Client Testimonial section -->
    <section id="mu-client-testimonial">
        <div class="mu-overlay">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-client-testimonial-area">

                            <div class="mu-title">
                                <span class="mu-subtitle">Testimonials</span>
                                <h2>What Customers Say</h2>
                            </div>

                            <!-- testimonial content -->
                            <div class="mu-testimonial-content">
                                <!-- testimonial slider -->
                                <ul class="mu-testimonial-slider">
                                    <li>
                                        <div class="mu-testimonial-single">
                                            <div class="mu-testimonial-info">
                                                <p>This is the best website to purchase snacks. I absolutely love it when it comes to the indian snacks. Indian snacks are crispy and hot. Best ever. </p>
                                            </div>
                                            <div class="mu-testimonial-bio">
                                                <p>- David Muller</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="mu-testimonial-single">
                                            <div class="mu-testimonial-info">
                                                <p>I've tried out the Chinese snacks. Surprisingly, it tastes delicious than I expected. I would love to buy more for my kids and as well as share with my beloved family.</p>
                                            </div>
                                            <div class="mu-testimonial-bio">
                                                <p>- Hannah</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="mu-testimonial-single">
                                            <div class="mu-testimonial-info">
                                                <p>This is amazing. I've never tried anything like this before. This is truly amazing as I had the opportunity to try out different kind of snacks with reasonable prices provided in this website.</p>
                                            </div>
                                            <div class="mu-testimonial-bio">
                                                <p>- Johnson Daniel</p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Client Testimonial section -->

    <!-- Start Chef Section -->
    <section id="mu-chef" style="background-color:white;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="mu-chef-area">

                        <div class="mu-title">
                            <span class="mu-subtitle">Our Professionals</span>
                            <h2>TEAM</h2>
                        </div>

                        <div class="mu-chef-content">
                            <ul class="mu-chef-nav">
                                <li>
                                    <div class="mu-single-chef">
                                        <figure class="mu-single-chef-img">
                                            <img src="assets/img/chef/founder1.jpg" alt="chef img">
                                        </figure>
                                        <div class="mu-single-chef-info">
                                            <h4>Tan Hong Kiat</h4>
                                            <span>Co-Founder</span>
                                        </div>
                                        <div class="mu-single-chef-social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="mu-single-chef">
                                        <figure class="mu-single-chef-img">
                                            <img src="assets/img/chef/founder2.jpg" alt="chef img">
                                        </figure>
                                        <div class="mu-single-chef-info">
                                            <h4>Ng Ke Ning</h4>
                                            <span>Co-Founder</span>
                                        </div>
                                        <div class="mu-single-chef-social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="mu-single-chef">
                                        <figure class="mu-single-chef-img">
                                            <img src="assets/img/chef/chef-3.jpg" alt="chef img">
                                        </figure>
                                        <div class="mu-single-chef-info">
                                            <h4>Greg Hong</h4>
                                            <span>Cooking Staff</span>
                                        </div>
                                        <div class="mu-single-chef-social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="mu-single-chef">
                                        <figure class="mu-single-chef-img">
                                            <img src="assets/img/chef/chef-4.jpg" alt="chef img">
                                        </figure>
                                        <div class="mu-single-chef-info">
                                            <h4>Marty Fukuda</h4>
                                            <span>Cooking Staff</span>
                                        </div>
                                        <div class="mu-single-chef-social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="mu-single-chef">
                                        <figure class="mu-single-chef-img">
                                            <img src="assets/img/chef/chef-5.jpg" alt="chef img">
                                        </figure>
                                        <div class="mu-single-chef-info">
                                            <h4>Simon Jonson</h4>
                                            <span>Cooking Staff</span>
                                        </div>
                                        <div class="mu-single-chef-social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="mu-single-chef">
                                        <figure class="mu-single-chef-img">
                                            <img src="assets/img/chef/chef-1.jpg" alt="chef img">
                                        </figure>
                                        <div class="mu-single-chef-info">
                                            <h4>Kelly Wenzel</h4>
                                            <span>Preparation Staff</span>
                                        </div>
                                        <div class="mu-single-chef-social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="mu-single-chef">
                                        <figure class="mu-single-chef-img">
                                            <img src="assets/img/chef/delivery.jpg" alt="chef img">
                                        </figure>
                                        <div class="mu-single-chef-info">
                                            <h4>Greg Hong</h4>
                                            <span>Delivery Staff</span>
                                        </div>
                                        <div class="mu-single-chef-social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="mu-single-chef">
                                        <figure class="mu-single-chef-img">
                                            <img src="assets/img/chef/accountant.jpg" alt="chef img">
                                        </figure>
                                        <div class="mu-single-chef-info">
                                            <h4>Marty Fukuda</h4>
                                            <span>Accountant</span>
                                        </div>
                                        <div class="mu-single-chef-social">
                                            <a href="#"><i class="fa fa-facebook"></i></a>
                                            <a href="#"><i class="fa fa-twitter"></i></a>
                                            <a href="#"><i class="fa fa-google-plus"></i></a>
                                            <a href="#"><i class="fa fa-linkedin"></i></a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Chef Section -->

    <!-- jQuery library -->
    <script src="assets/js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- Slick slider -->
    <script type="text/javascript" src="assets/js/slick.js"></script>
    <!-- Counter -->
    <script type="text/javascript" src="assets/js/simple-animated-counter.js"></script>
    <!-- Gallery Lightbox -->
    <script type="text/javascript" src="assets/js/jquery.magnific-popup.min.js"></script>
    <!-- Date Picker -->
    <script type="text/javascript" src="assets/js/bootstrap-datepicker.js"></script>
    <!-- Ajax contact form  -->
    <script type="text/javascript" src="assets/js/app.js"></script>

    <!-- Custom js -->
    <script src="assets/js/custom.js"></script>
</asp:Content>
