-- 16 ARALIK 2024 DERS KODLARI
-- 16 Aralık 2024 Veritabanı Ders
-- GÖRÜNTÜLER

-- Görüntüler sanaldır, Veritabanı dosyaları içinde yer almaz
-- Görüntü ne işe yarar?
-- Uzun uzun kod yazmaktansa bir görüntü oluşturuyorum ve tek bir kelimeyle uzun uzun "SELECT xxxxxxxx" yazmaktansa oluşturduğum görüntü sayesinde görüntülemek istediğim satırları/verileri kolayca görüntüleyebiliyorum

CREATE VIEW [Çalışan İsim]
AS
  SELECT LastName, FirstName
  FROM Employees

CREATE VIEW İsmiAİleBaşlayanÇalışanlar
AS
  SELECT EmployeeID, FirstName
  FROM Employees
  WHERE FirstName LIKE 'A%'

CREATE VIEW SiparişlerÇalışanİsmiİle
AS
  SELECT Orders.OrderID, Orders.OrderDate, FirstName
  FROM Orders INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID

-- Görüntü Tablosunu Silmek İçin
DROP VIEW [Çalışan İsim]


-- TRIGGER (Tetikleyiciler)
-- Triggler ya bir veri eklendiğinde, ya silindiğinde, ya da güncellendiğinde gerçekleşir
-- Silme, veri girişi, güncelleme
-- DELETE, INSERT, UPDATE

CREATE TRIGGER [Yeni Sipariş]
ON Orders
AFTER INSERT
AS
BEGIN
  INSERT INTO Orders_Log
    (OrderID, DateTime, Açıklama)
  SELECT OrderID, GETDATE(), 'Yeni Sipariş Eklendi'
  FROM inserted;
END;
-- Orders tablosuna yeni veri girişi yapıldığında (INSERT INTO) triggerlanacak.

-- Sertifika ile ilgili soru gelecek sınavda?? BTK Akademide sertifika sorularından benzer gelebilir

-- INDEKS konusu

-- Tabloları kontrol edicez, indexleri kontrol edicez sağ tık rebuild all diye. eğer fragmantasyon %30 üzerindeyse verim azalır veritabanı yavaşlar. rebuild all yaparak yeniden yapılandırıyorum. amaç -> fragmantasyonu azaltmak
-- Fragmantasyon -> veri bozulmaları

-- Günün son konusu: Yetkiler
-- Kullanıcılara Create, Alter, Drop yetkilerinin verilmesini kontrol eder
-- CREATE USER Anıl IDENTIFIED BY MUHENDISLIKFAKULTESI


----------------- SINAV HAKKKINDA BİLGİLER ---------------
-- 1. KOD YAZMA OLUCAK HOCA TABLO YADA TABLOLAR VERECEK İSTEDİĞİ SORGUYU BİZ YAZICAZ
-- VERİLEN BİR KODDA ÇIKTI İSTENECEK, BU KODUN EKRAN GÖRÜNTÜSÜ NE - HOCA BİZE TABLOYU VERECEK (SELECT LastName FROM Calisanlar) bu tablonun çıktısı ne olacak, SQL de çalıştıra basınca gelen görüntüyü yaz
-- HERHANGİ BİR TABLO VERMEDEN KOD SORULUR, BU KOD NE İŞE YARAR (INNER JOIN fln gelebilir ama 5li tablo birleştirme gibi zor gelmeyecek)
-- ZORLAYACAK KISIMLAR INNER JOIN, GROUP BY, HAVING
-- 2-3 TABLO BİRLEŞTİRMELİ JOİN GELEBİLİR (PUANLARI DAHA YÜKSEK)
-- TRİGGER KODU SORULDU, BU TRİGGER KODU NE İŞE YARAR GİBİ BİLGİ SORUSU GELEBİLİR
-- VİZE ÖNCESİ KONULARI YOK, SELECT SONRASI TÜM KONULAR DAHİL

-- 3 SORU OLACAK AMA 20-30 ŞIK OLACAK, a) b) c) d) ....