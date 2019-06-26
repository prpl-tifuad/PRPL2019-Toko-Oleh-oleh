<?php require 'header.php'; ?>
<!-- ======================================================================
                                        START CONTENT
======================================================================= -->
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <h2>contact</h2>
                        <div class="google-map">
                            <iframe src="https://www.google.com/maps/embed?pb=!4v1560990772827!6m8!1m7!1sKVaveRpQ2YGcyFFYJhjXwQ!2m2!1d-7.825406793053617!2d110.3735443808574!3f30.668957!4f0!5f0.7820865974627469" width="600" height="450" frameborder="0" style="border:0"></iframe>
                        </div>

                        <div class="contact-info">
                            <div class="row">
                                <div class="col-md-4">
                                    <ul>
                                        <li><span class="location"><?php echo $contact['alamat']; ?></span></li>
                                    </ul>
                                </div>
                                <div class="col-md-4">
                                    <ul>
                                        <li><span class="mail"><a href="mailto:<?php echo $contact['email']; ?>"><?php echo $contact['email']; ?></a></span></li>
                                    </ul>
                                </div>
                                <div class="col-md-4">
                                    <ul>
                                        <li><span class="phone"><?php echo $contact['phone']; ?></span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="site-title">
                            <div class="site-inside">
                                <span>Write us a letter</span>
                            </div>
                        </div>
                        <br>
                        <div class="the-form">
                            <form id="contact_form">
                                <div class="row">
                                    <div class="col-md-4"><p>Name</p>
                                        <input type="text" name="contact-name" class="the-line">
                                    </div>
                                    <div class="col-md-4"><p>E-mail</p>
                                        <input type="text" name="contact-email" class="the-line">
                                    </div>
                                    <div class="col-md-4"><p>Website</p>
                                        <input type="text" name="contact-website" class="the-line">
                                    </div>
                                </div>
                                <p>Comments</p>
                                <textarea name="contact-message" class="the-area"></textarea>
                                <input type="submit" id="form-send" value="Send" class="button-4">
                            </form>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="main-sidebar">
                            <div class="row">
                                <div class="col-md-12 col-xs-6">
                                    <div class="widget">
                                        <div class="widget-title">Kategori</div>
                                        <ul class="widget-category">
<?php //kategori produk
$catcat=mysqli_query($con,"SELECT * from rkat_produk order by kat_produk asc limit 7");
while($rcat=mysqli_fetch_array($catcat)) { $rjp=mysqli_num_rows(mysqli_query($con,"SELECT * FROM produk where id_kat_produk='$rcat[id_kat_produk]' and stok>0 ")); ?>
    <li><a href="product?thiscategory=<?php echo base64_encode($rcat['id_kat_produk']); ?>"><?php echo $rcat['kat_produk'].' ('.$rjp.')'; ?></a></li>
    <?php }
?> 
                                        </ul>
                                    </div>
                                </div>
                                
                                <div class="col-md-12 col-xs-6">
                                    <div class="widget">
                                        <div class="widget-title">Produk Terbaik Bulain Ini</div>
                                        <ul class="widget-category">
<?php $bul=date('m'); // produk
$propro=mysqli_query($con,"SELECT * from produk where stok>0 and month(tanggal)='$bul' order by stok desc limit 15");
while($rpropro=mysqli_fetch_array($propro)) { ?>
    <li><a href="detailproduct?thisproduct=<?php echo base64_encode($rpropro['id_produk']) ?>&nameproduct=<?php echo $rpropro['nama']; ?>"><?php echo $rpropro['nama']; ?></a></li>
    <?php }
?>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-md-12 col-xs-6">
                                    <div class="widget">
                                        <div class="widget-title">Tags</div>
                                        <div class="tagcloud">
                                            <a href="#">Art</a>
                                            <a href="#">Collection</a>
                                            <a href="#">Fashion</a>
                                            <a href="#">Dark</a>
                                            <a href="#">White</a>
                                            <a href="#">Texture</a>
                                            <a href="#">Minimalist</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ======================================================================
                                        END CONTENT
        ======================================================================= -->
<?php require 'footer.php'; ?>