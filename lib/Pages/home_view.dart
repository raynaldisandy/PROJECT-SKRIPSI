import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:skinalertsv2/Controlers/frame_controller.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/assets_list.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_ripplebutton.dart';
import 'package:skinalertsv2/Widget/user_info.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {

  
  @override
  Widget build(BuildContext context) {
  final TabController tabController = TabController(length: 3, vsync: this);

    final htmldata1 = """ 
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gejala dan Jenis Kanker Kulit</title>
</head>
<body>
    <header>
        <h1>Gejala dan Jenis Kanker Kulit</h1>
        <h2>Panduan Lengkap Kondisi Kulit</h2>
    </header>
    
    <main>
        <article>
            <h3>1. Symptoms of Skin Cancer</h3>
            <h4>Gejala Kanker Kulit</h4>
            <p>Kanker kulit adalah pertumbuhan sel kulit abnormal yang terjadi akibat kerusakan DNA, biasanya disebabkan oleh paparan sinar ultraviolet (UV) berlebihan. Penyakit ini menjadi salah satu kanker yang paling sering terjadi karena kulit adalah organ terluar tubuh yang paling sering terpapar lingkungan luar.</p>
            
            <h5>Faktor Risiko Utama:</h5>
            <ul>
                <li>Paparan sinar matahari tanpa perlindungan</li>
                <li>Kulit terang</li>
                <li>Riwayat keluarga dengan kanker kulit</li>
            </ul>
            
            <h5>Tanda dan Gejala:</h5>
            <ul>
                <li>Adanya bercak atau benjolan baru</li>
                <li>Luka yang sulit sembuh</li>
                <li>Perubahan bentuk, ukuran, atau warna pada tahi lalat</li>
            </ul>
            
            <h5>Jenis Kanker Kulit:</h5>
            <ul>
                <li>Karsinoma sel basal</li>
                <li>Karsinoma sel skuamosa</li>
                <li>Melanoma (tipe paling berbahaya karena dapat menyebar cepat ke organ tubuh lain)</li>
            </ul>
            
            <h5>Deteksi Dini:</h5>
            <p>Deteksi dini sangat penting untuk meningkatkan peluang kesembuhan. Metode sederhana seperti aturan ABCDE dapat digunakan untuk mengenali perubahan pada tahi lalat:</p>
            <ul>
                <li><strong>A</strong>symmetry (Asimetri)</li>
                <li><strong>B</strong>order (Batas tidak rata)</li>
                <li><strong>C</strong>olor (Warna tidak merata)</li>
                <li><strong>D</strong>iameter (Diameter lebih dari 6mm)</li>
                <li><strong>E</strong>volution (Perkembangan atau perubahan)</li>
            </ul>
            
            <h5>Pencegahan:</h5>
            <ul>
                <li>Penggunaan tabir surya</li>
                <li>Pakaian pelindung</li>
                <li>Pemeriksaan kulit secara rutin, terutama bagi individu dengan risiko tinggi</li>
            </ul>
        </article>
        
        <article>
            <h3>2. Actinic Keratoses (AKIEC)</h3>
            <p>Actinic Keratoses adalah lesi prakanker kulit yang muncul akibat paparan sinar matahari jangka panjang. Lesi ini biasanya tampak sebagai bercak kecil berwarna merah, kecokelatan, atau keabu-abuan dengan permukaan kasar dan bersisik. Lokasinya sering muncul pada wajah, telinga, tangan, atau kulit kepala yang terpapar sinar UV.</p>
            
            <h5>Karakteristik:</h5>
            <ul>
                <li>Berpotensi berkembang menjadi kanker kulit ganas, khususnya karsinoma sel skuamosa</li>
                <li>Gejala yang dapat dirasakan antara lain gatal, perih, atau sensasi terbakar pada area lesi</li>
                <li>Kondisi ini harus dikenali sejak dini agar tidak berkembang lebih parah</li>
            </ul>
            
            <h5>Penanganan:</h5>
            <ul>
                <li>Cryotherapy</li>
                <li>Obat oles seperti imiquimod atau 5-fluorouracil</li>
                <li>Terapi fotodinamik</li>
            </ul>
            
            <h5>Pencegahan:</h5>
            <p>Melindungi kulit dari paparan sinar UV berlebih dan melakukan pemeriksaan kulit secara berkala.</p>
        </article>
        
        <article>
            <h3>3. Basal Cell Carcinoma (BCC)</h3>
            <p>Basal Cell Carcinoma (BCC) adalah jenis kanker kulit paling umum yang berasal dari sel basal pada lapisan terdalam epidermis. Pertumbuhannya cenderung lambat, tetapi jika tidak ditangani dapat merusak jaringan di sekitarnya.</p>
            
            <h5>Faktor Risiko:</h5>
            <ul>
                <li>Paparan sinar UV berlebihan</li>
                <li>Kulit terang</li>
                <li>Riwayat kanker kulit sebelumnya</li>
            </ul>
            
            <h5>Ciri-ciri Klinis:</h5>
            <ul>
                <li>Benjolan kecil berwarna pucat, merah muda, atau keperakan dengan permukaan mengilap</li>
                <li>Lesi kadang berdarah, membentuk kerak, atau tidak kunjung sembuh</li>
                <li>Walaupun jarang menyebar ke organ lain, BCC tetap berbahaya karena bisa menyebabkan kerusakan jaringan permanen</li>
            </ul>
            
            <h5>Pengobatan:</h5>
            <ul>
                <li>Operasi pengangkatan</li>
                <li>Cryotherapy</li>
                <li>Terapi laser</li>
            </ul>
            
            <h5>Pencegahan:</h5>
            <p>Mengurangi paparan sinar matahari langsung, menggunakan tabir surya, serta pemeriksaan kulit secara rutin bagi individu dengan risiko tinggi.</p>
        </article>
        
        <article>
            <h3>4. Benign Keratosis like Lesions (BKL)</h3>
            <p>Benign Keratosis like Lesions (BKL) adalah lesi jinak pada kulit yang biasanya tidak berbahaya. Lesi ini sering muncul seiring bertambahnya usia dan tidak memiliki potensi menjadi kanker. Meski demikian, bentuknya kadang menyerupai kanker kulit sehingga menimbulkan kekhawatiran.</p>
            
            <h5>Ciri-ciri:</h5>
            <ul>
                <li>Bercak menonjol berwarna coklat, kehitaman, atau abu-abu</li>
                <li>Permukaan kasar menyerupai kutil</li>
                <li>Biasanya tidak menimbulkan rasa sakit, namun bisa terasa gatal atau teriritasi jika tergesek pakaian</li>
            </ul>
            
            <h5>Penanganan:</h5>
            <p>Pengobatan umumnya tidak diperlukan kecuali untuk alasan kosmetik atau jika menyebabkan ketidaknyamanan. Jika diperlukan, dokter dapat melakukan:</p>
            <ul>
                <li>Cryotherapy</li>
                <li>Bedah kecil untuk menghilangkannya</li>
            </ul>
        </article>
        
        <article>
            <h3>5. Dermatofibroma (DF)</h3>
            <p>Dermatofibroma adalah tumor jinak pada kulit yang sering muncul pada tungkai atau lengan. Lesi ini terbentuk dari proliferasi jaringan fibrosa dan biasanya tidak berbahaya. Kondisi ini lebih sering dialami oleh wanita dewasa dibandingkan pria.</p>
            
            <h5>Ciri Khas:</h5>
            <ul>
                <li>Benjolan kecil, padat, berwarna coklat atau kemerahan</li>
                <li>Terasa keras saat disentuh</li>
                <li>Jika ditekan, bagian tengahnya sering kali tampak menjorok ke dalam</li>
                <li>Umumnya tidak menimbulkan rasa nyeri, tetapi bisa terasa gatal pada beberapa orang</li>
            </ul>
            
            <h5>Penanganan:</h5>
            <p>Karena sifatnya jinak, dermatofibroma biasanya tidak memerlukan pengobatan. Namun, jika benjolan menimbulkan masalah estetika atau sering teriritasi, prosedur bedah kecil dapat dilakukan untuk mengangkatnya.</p>
        </article>
        
        <article>
            <h3>6. Melanoma (MEL)</h3>
            <p>Melanoma adalah jenis kanker kulit paling berbahaya yang berasal dari sel penghasil pigmen (melanosit). Penyakit ini berpotensi menyebar dengan cepat ke organ tubuh lain sehingga memerlukan deteksi dan penanganan segera.</p>
            
            <h5>Faktor Risiko:</h5>
            <ul>
                <li>Paparan sinar UV</li>
                <li>Kulit terang</li>
                <li>Riwayat keluarga dengan melanoma</li>
            </ul>
            
            <h5>Gejala:</h5>
            <ul>
                <li>Tahi lalat yang berubah warna, bentuk, atau ukuran</li>
                <li>Lesi sering kali memiliki tepi tidak rata</li>
                <li>Warna yang bervariasi</li>
                <li>Diameter lebih dari 6 mm</li>
                <li>Terus berkembang dari waktu ke waktu</li>
                <li>Tahi lalat yang terasa gatal, nyeri, atau berdarah juga perlu diwaspadai</li>
            </ul>
            
            <h5>Penanganan:</h5>
            <ul>
                <li>Operasi pengangkatan lesi</li>
                <li>Terapi imun</li>
                <li>Kemoterapi</li>
            </ul>
            
            <h5>Pencegahan:</h5>
            <p>Pemeriksaan rutin kulit sangat disarankan, terutama bagi individu yang memiliki banyak tahi lalat atau faktor risiko tinggi.</p>
        </article>
        
        <article>
            <h3>7. Melanocytic Nevi (NV)</h3>
            <p>Melanocytic Nevi atau yang lebih dikenal sebagai tahi lalat adalah pertumbuhan jinak dari sel melanosit. Hampir semua orang memiliki nevus, dan sebagian besar tidak berbahaya. Namun, beberapa jenis nevi dapat berkembang menjadi melanoma jika mengalami perubahan abnormal.</p>
            
            <h5>Ciri-ciri:</h5>
            <ul>
                <li>Bercak kecil berwarna coklat, hitam, atau kebiruan</li>
                <li>Bentuk bulat atau oval</li>
                <li>Nevi normal umumnya stabil dari waktu ke waktu dan tidak menimbulkan keluhan</li>
                <li>Tahi lalat yang berubah warna, bentuk, atau ukuran harus segera diperiksa</li>
            </ul>
            
            <h5>Pemeriksaan:</h5>
            <p>Pemeriksaan rutin sangat penting untuk membedakan antara nevus normal dan yang berpotensi menjadi kanker. Dokter dapat melakukan:</p>
            <ul>
                <li>Dermoskopi</li>
                <li>Biopsi jika ditemukan kecurigaan terhadap melanoma</li>
            </ul>
        </article>
        
        <article>
            <h3>8. Vascular Lesions (VASC)</h3>
            <p>Vascular Lesions adalah kelainan pada pembuluh darah kulit yang bisa berupa tumor jinak atau malformasi pembuluh darah. Lesi ini dapat muncul sejak lahir (contohnya hemangioma) atau berkembang seiring pertumbuhan. Sebagian besar bersifat jinak dan tidak berbahaya.</p>
            
            <h5>Ciri-ciri:</h5>
            <ul>
                <li>Bercak merah, ungu, atau kebiruan pada kulit</li>
                <li>Kadang disertai pembengkakan</li>
                <li>Dapat muncul di berbagai bagian tubuh dengan ukuran bervariasi</li>
            </ul>
            
            <h5>Penanganan:</h5>
            <p>Sebagian besar kasus tidak memerlukan pengobatan, namun bila mengganggu fungsi organ atau menimbulkan masalah estetika, pengobatan dapat dilakukan dengan:</p>
            <ul>
                <li>Terapi laser</li>
                <li>Bedah</li>
                <li>Obat-obatan tertentu</li>
            </ul>
            
            <h5>Pemeriksaan:</h5>
            <p>Pemeriksaan medis diperlukan untuk menentukan tingkat keparahan dan jenis terapi yang sesuai.</p>
        </article>
    </main>
    
    <footer>
        <p><strong>Informasi Penting:</strong> Konten ini disediakan untuk tujuan edukasi dan informasi umum saja. Konsultasikan dengan dokter atau profesional kesehatan untuk diagnosis dan perawatan yang tepat.</p>
    </footer>
</body>
</html>
    """; 

    final List<String> imgList = [
      AssetList.exampleSkinCarousale,
      AssetList.exampleSkinCarousale,
      AssetList.exampleSkinCarousale,
    ];
    final FrameController frameController = Get.put(FrameController());
    SizeConfig().init(context);
    return Container(
      color: AppColors.backgroundcolor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SpaceSizer(
              vertical: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              UserPicture(),
              SpaceSizer(
                horizontal: 6,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LeaguespartanTextView(
                      value: "Good Morning and Keep Healthy",
                      color: AppColors.textblackcolour,
                    ),
                    SpaceSizer(
                      vertical: 1,
                    ),
                    Obx(
                      () => LeaguespartanTextView(
                        value: frameController.userName.value,
                        color: AppColors.textblackcolour,
                        size: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   
                  ])
            ]),
             SizedBox(
                      width: SizeConfig.horizontal(100),
                      height: SizeConfig.horizontal(60),
                      child: CarouselSlider.builder(
                          carouselController: frameController.carouselController,
                          options: CarouselOptions(
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1500),
                              autoPlay: true,
                              aspectRatio: 9 / 4,
                              enlargeCenterPage: true,
                              onPageChanged:
                                  (int index, CarouselPageChangedReason reason) {
                                frameController.currentDot(index);
                              }),
                          itemCount: imgList.length,
                          itemBuilder: (BuildContext context, int index,
                                  int realIndex) =>
                              Center(
                                  child: CustomRippleButton(
                                      radius: 0,
                                      onTap: () {},
                                      child: ClipRRect(
                                        
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.horizontal(1))),
                                          child: imgList.isEmpty
                                              ? const CircularProgressIndicator()
                                              : Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: AppColors.buttoncolorgreendark,width: SizeConfig.horizontal(1))
                                                ),
                                                child: Image.asset(imgList[index],
                                                    fit: BoxFit.fill,
                                                    width:
                                                        SizeConfig.horizontal(100),
                                                    height: SizeConfig.horizontal(
                                                        100)),
                                              ))))),
                    ),
                    TabBar(
                      controller: tabController,
                      indicator: BoxDecoration(color: AppColors.buttoncolorgreendark,borderRadius: BorderRadius.all(Radius.circular(SizeConfig.horizontal(99)))),
                      indicatorColor: AppColors.buttoncolorgreendark,
                      unselectedLabelColor: AppColors.buttoncolorgreendark,
                      labelColor: Colors.white,
                      labelStyle: leagueSpartanStyle().labelStyle(AppColors.buttoncolorgreendark),
            tabs: <Widget>[
              Tab(text: 'Symptoms',),
              Tab(text: 'Diagnosis And\n Treatment',),
              Tab(text: 'Click For Check',),
            ],
          ),
          SizedBox(
            height: SizeConfig.horizontal(100),
            child: TabBarView(
              controller: tabController,
              children: 
            [
                 
            Center(child: Html(data: htmldata1)),
            Center(child: Text("It's cloudy here2")),
            Center(child: Text("It's cloudy here3")),
            ]),
          ),
          SpaceSizer(vertical: 12,)
          ],
        ),
      ),
    );
  }
}
