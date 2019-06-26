<?php require 'header.php'; ?>
   <!-- =======================================================================
                                        START CONTENT
        ======================================================================= -->
<?php 
$BatasAwal = $contact['paging'];
    if (!empty($_GET['page'])) {
        $hal = $_GET['page'] - 1;
        $MulaiAwal = $BatasAwal * $hal;
    } else if (!empty($_GET['page']) and $_GET['page'] == 1) {
        $MulaiAwal = 0;
    } else if (empty($_GET['page'])) {
        $MulaiAwal = 0;
    }

if(empty($_GET['thiscategory'])){
    $pr=mysqli_query($con,"SELECT * FROM produk where stok>0 order by tanggal desc LIMIT $MulaiAwal , $BatasAwal ");
    $pg=mysqli_query($con,"SELECT * FROM produk where stok>0 ");
    $npr=mysqli_num_rows($pg);
} 
else{
    $tc=base64_decode($_GET['thiscategory']);
    $pr=mysqli_query($con,"SELECT * FROM produk where id_kat_produk='$tc' and stok>0 order by tanggal desc LIMIT $MulaiAwal , $BatasAwal ");
    $pg=mysqli_query($con,"SELECT * FROM produk where id_kat_produk='$tc' and stok>0 ");
    $npr=mysqli_num_rows($pg);
    $jp=mysqli_fetch_array(mysqli_query($con,"SELECT * FROM rkat_produk where id_kat_produk='$tc' "));
    $cat=$jp['kat_produk'];
}
?>
<div class="content">
<!-- =====================================================================
                                             START THE SLIDER
            ====================================================================== -->
            <div class="container">
                <div class="the-slider" data-tesla-plugin="slider" data-tesla-item=".slide" data-tesla-next=".slide-right" data-tesla-prev=".slide-left" data-tesla-container=".slide-wrapper">
                    <div class="slide-arrows">
                        <div class="slide-left"></div>
                        <div class="slide-right"></div>
                    </div>
                    <ul class="slide-wrapper">
<?php $sli=mysqli_query($con,"SELECT * FROM slider order by id_slider desc limit 7");while($der=mysqli_fetch_array($sli)){ ?>
                        <li class="slide"><img style="width:1140px;height:450px;" st src="control/<?php echo $der['gambar']; ?>" alt="slider image"></li>
<?php } ?>
                    </ul><!--   -->
                </div>
            </div>
            <br>
            <br>
            <!-- =====================================================================
                                             END THE SLIDER
            ====================================================================== -->
            <div class="container" style="border-bottom: 2px solid #eaeaea;">
                <div class="site-title">
                    <div class="site-inside">
                        <span>Product</span>
                    </div>
                </div>
                <div class="all-products-details" style="padding: 20px 0;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                    <?php while($dui=mysqli_fetch_array($pr)) { ?>
                                <div class="col-md-3 col-xs-4">
                                    <div class="product">
                                        <div class="product-cover">
                                            <div class="product-cover-hover"><span><a href="detailproduct?thisproduct=<?php echo base64_encode($dui['id_produk']) ?>&nameproduct=<?php echo $dui['nama']; ?>">Detail</a></span></div>
                                            <img style="width:300px;height:200px;" src="control/<?php echo $dui['gambar']; ?>" alt="product name" />
                                        </div>    
                                        <div class="product-details">    
                                            <a href="detailproduct?thisproduct=<?php echo base64_encode($dui['id_produk']) ?>&nameproduct=<?php echo $dui['nama']; ?>"><h1 style="font-size:90%;"><?php echo $dui['nama']; ?></h1></a>
                                            <div class="product-price">
                                                <button style="float:right;" class="btn btn-xs btn-info">Stok <?php echo rp($dui['stok']); ?></button>
                                                <div style="font-size:18px;"><?php echo 'Rp. '. rp($dui['harga']); ?></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    <?php } ?>            
                            </div>
                            <ul class="page-numbers">
    <?php $cekQuery = $pg;
        $jumlahData = mysqli_num_rows($cekQuery);
        if ($jumlahData > $BatasAwal) {
            echo '<br/><center><div style="font-size:15pt;">Halaman : ';
            $a = explode(".", $jumlahData / $BatasAwal);
            $b = $a[0];
            $c = $b + 1;
            for ($i = 1; $i <= $c; $i++) {
                echo '<li><a class="page-numbers" style="';
                if ($_GET['page'] == $i) {
                    echo 'color:red';
                }
                if(empty($_GET['thiscategory'])){
                echo '" href="?page=' . $i . '">' . $i . '</a> /</li>';
                }
                else{
                 echo '" href="?thiscategory='.base64_encode($tc).'&page=' . $i . '">' . $i . '</a> /</li>';
                }
            }
        }
    ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<div class="box" style="padding-top: 20px;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="site-title"><div class="site-inside"><span>Customer Service</span></div></div>
                            <br> 
                            <div class="panel-group panel-group-2" id="accordion">
<?php $ser=mysqli_query($con,"SELECT * FROM service where status='YES' order by id_service desc limit 4 ");while($vice=mysqli_fetch_array($ser)){ $ur=1; ?>                                                               
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" class="collapsed" href="#collapse-<?php echo $vice['id_service']; ?>">
                                                <i class="icon-473" title="473"></i><?php echo $vice['tanya']; ?>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapse-<?php echo $vice['id_service']; ?>" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <?php echo $vice['jawab']; ?>
                                        </div>
                                    </div>
                                </div>
                                
<?php $ur++; } ?>

                            </div>
                            <p><a href="#" class="btn btn-danger" data-target="#tanya" data-toggle="modal">Kirim Pertanyaan</a></p>
                        </div>
                        <!-- <div class="col-md-6">
                            <div class="site-title"><div class="site-inside"><span>Support</span></div></div> 
                            <br>
                            <div class="row">
                                <img style="width:90%;height:20%;margin-left:20px;" src="images/pendukung/support.jpg">
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
<div id="tanya" class="modal" tabindex="-2" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel">Kirim Pertanyaan</h4>
        </div>
        <div class="modal-body">
          <form role="form" method="post" enctype="multipart/form-data" action="prosesuser/hanuser?thisposition=<?php echo base64_encode('kirimtanya'); ?>">
            <div class="form-group">
              <label>Tulis Pertanyaan</label>
                <textarea name="tanya" class="form-control"></textarea>
            </div>
        </div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-primary btn-circle">Kirim</button> 
          </form>
        </div>
    </div>
</div>
</div>
</div></div></div></div>
   <!-- =======================================================================
                                        END CONTENT
        ======================================================================= -->
<?php require 'footer.php'; ?>