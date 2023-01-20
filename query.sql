SELECT * FROM schoters.transaksi;

-- No 1
SELECT DISTINCT customer FROM transaksi;
SELECT customer,COUNT(*) AS TotalTransaksi FROM transaksi GROUP BY customer;


-- NO 2
SELECT DISTINCT domisili FROM customer;
SELECT Domisili,COUNT(*) AS TotalTransaksi FROM customer GROUP BY Domisili;


-- Produk dengan Penjualan Terbanyak
SELECT tipeProduk, COUNT(*) AS JumlahPenjualan FROM transaksi GROUP BY tipeProduk ORDER BY JumlahPenjualan DESC;


-- Bulan dengan Pendapatan Terbanyak
SELECT MONTHNAME(tanggalTransaksi) AS Bulan, SUM(hargaAsli) AS TotalHargaPenjualan
FROM transaksi
GROUP BY MONTHNAME(tanggalTransaksi)
ORDER BY TotalHargaPenjualan DESC;	


-- Sales dengan Total Harga Penjualan Terbanyak
SELECT namaSales, COUNT(*) AS JumlahPenjualan, SUM(hargaAsli) AS TotalHargaPenjualan
FROM transaksi
GROUP BY namaSales
ORDER BY TotalHargaPenjualan DESC;


-- Produk dengan penjualan terbanyak oleh setiap sales
SELECT namaSales, tipeProduk, jumlahPenjualan
FROM (SELECT namaSales, tipeProduk, COUNT(tipeproduk) AS jumlahPenjualan FROM transaksi GROUP BY namaSales, tipeProduk ORDER BY jumlahPenjualan DESC) AS subTransaksi 
GROUP BY namaSales
ORDER BY jumlahPenjualan DESC;


-- Customer dengan total harga pembelian terbanyak
SELECT customer, COUNT(*) AS JumlahPembelian, SUM(hargaAsli) AS TotalHargaPembelian
FROM transaksi
GROUP BY customer
ORDER BY TotalHargaPembelian DESC
LIMIT 10;

-- Produk yang paling sering dibeli setiap customer beserta usianya
SELECT customer, tipeProduk, jumlahPembelian AS jumlah, usia
FROM (SELECT customer, tipeProduk, COUNT(tipeproduk) AS jumlahPembelian FROM transaksi GROUP BY customer, tipeProduk ORDER BY jumlahPembelian DESC) AS subTransaksi 
LEFT JOIN customer
ON subTransaksi.customer= customer.Name
GROUP BY customer
ORDER BY jumlahPembelian DESC;


-- Bulan dengan budget campaign terbesar
SELECT MONTHNAME(startDate) AS bulan, budget
FROM campaign
ORDER BY budget DESC;