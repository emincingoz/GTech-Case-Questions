# Flutter

CORS politikaları, web sayfasına başka bir siteden görüntü çekilmesine izin vermez. Proje chrome gibi bir tarayıcıda çalıştırılmak istenirse bu sebeple hata alınacaktır, resimler görüntülenemeyecektir. Bu durumun önüne geçmek için Flutter'ın kullandığı render seçeneği değiştirilebilir.

Proje aşağıdaki komut ile CLI'dan çalıştırılırsa hata alınmayacaktır.

`flutter run -d chrome --web-renderer html`

Elemanların listeden silinebilmesi için Dismissible widget'ı kullanıldı. Elemanlar sağa veya sola kaydırıldığında listeden kaldırılabilmekte.
