-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 15, 2024 lúc 01:16 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `apple`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai`
--

CREATE TABLE `loai` (
  `id` int(11) NOT NULL,
  `tenLoai` varchar(200) NOT NULL,
  `thuTu` int(11) NOT NULL,
  `anHien` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loai`
--

INSERT INTO `loai` (`id`, `tenLoai`, `thuTu`, `anHien`) VALUES
(1, 'iPhone', 1, 1),
(2, 'iPad', 2, 1),
(3, 'Mac', 3, 1),
(4, 'Watch', 4, 1),
(5, 'AirPod', 5, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `tenSP` varchar(200) NOT NULL,
  `moTa` text NOT NULL,
  `urlHinh` varchar(255) DEFAULT NULL,
  `capNhat` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gia` decimal(10,0) NOT NULL,
  `giaCu` decimal(10,0) DEFAULT NULL,
  `idLoai` int(11) NOT NULL,
  `anHien` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `tenSP`, `moTa`, `urlHinh`, `capNhat`, `gia`, `giaCu`, `idLoai`, `anHien`) VALUES
(3, 'AirPods Pro (2021)\r\n', 'AirPods Pro (2021) có tính năng Chủ Động Khử Tiếng Ồn giúp người nghe đắm chìm trong thế giới âm thanh. Chế Độ Xuyên Âm giúp bạn nghe được âm thanh của thế giới xung quanh. AirPods Pro chống mồ hôi và chống nước và kích cỡ tai nghe tùy chỉnh được tạo sự thoải mái cả ngày dài.\r\n\r\nTính năng nổi bật\r\nTính năng Chủ Động Khử Tiếng Ồn giúp ngăn chặn các âm thanh bên ngoài lọt vào tai để bạn có thể đắm chìm vào âm nhạc\r\nChế Độ Xuyên Âm giúp bạn nghe và tương tác với thế giới xung quanh\r\nChế độ âm thanh không gian với tính năng theo dõi chuyển động của đầu đưa âm thanh đến quanh bạn\r\nEQ thích ứng sẽ tự động điều chỉnh nhạc hướng vào tai bạn\r\nĐầu silicon mềm mại với ba kích cỡ khác nhau tạo sự thoải mái và ôm khít\r\nCảm biến lực giúp bạn dễ dàng điều khiển chương trình giải trí, trả lời hoặc kết thúc cuộc gọi, và thực hiện nhiều tác vụ khác\r\nChống mồ hôi và chống nước\r\nTổng thời gian nghe hơn 24 giờ với Hộp Sạc MagSafe\r\nThiết lập dễ dàng, có khả năng nhận biết khi đeo, và tự động chuyển đổi để mang lại trải nghiệm tuyệt vời\r\nDễ dàng chia sẻ âm thanh giữa hai bộ AirPods trên iPhone, iPad, iPod touch hoặc Apple TV\r\nCác thông tin Apple đảm bảo ( Pháp lý)\r\n\r\n', 'AirPods-Pro2-A.jpg', '2023-04-03 13:39:11', 4700000, 5700000, 5, 1),
(4, 'MacBook Air M1 2020 ', 'MacBook Air M1 Là máy tính xách tay mỏng và nhẹ nhất của Apple – nay thay đổi ngoạn mục với chip Apple M1 mạnh mẽ. Tạo ra một cú nhảy vọt về hiệu năng CPU và đồ họa, cùng thời lượng pin lên đến 18 giờ.\n\nTính năng nổi bật\nChip M1 do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU\nTăng thời gian sử dụng với thời lượng pin lên đến 18 giờ\nCPU 8 lõi cho tốc độ nhanh hơn đến 3.5x, xử lý công việc nhanh chóng hơn bao giờ hết\nGPU lên đến 8 lõi với tốc độ xử lý đồ họa nhanh hơn đến 5x cho các ứng dụng và game đồ họa khủng\nNeural Engine 16 lõi cho công nghệ máy học hiện đại\nBộ nhớ thống nhất 8GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy\nỔ lưu trữ SSD siêu nhanh giúp mở các ứng dụng và tập tin chỉ trong tích tắc\nThiết kế không quạt giảm tối đa tiếng ồn khi sử dụng\nMàn hình Retina 13.3 inch với dải màu rộng P3 cho hình ảnh sống động và chi tiết ấn tượng\nCamera FaceTime HD với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video đẹp hình, rõ tiếng hơn\nBộ ba micro phối hợp tập trung thu giọng nói của bạn, không thu tạp âm môi trường\nWi-Fi 6 thế hệ mới giúp kết nối nhanh hơn\nHai cổng Thunderbolt / USB 4 để sạc và kết nối phụ kiện\nBàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn\nmacOS Big Sur với thiết kế mới đầy táo bạo cùng nhiều cập nhật quan trọng cho các ứng dụng Safari, Messages và Maps\nHiện có màu vàng kim, xám bạc và bạc\nBộ sản phẩm bao gồm  \n\n  MacBook. Dây sạc. HDSD bảo hành điện tử 12 tháng\n\nCác thông tin Apple đảm bảo ( Pháp lý )\n\nHiện có sẵn các lựa chọn để nâng cấp.\n\nThời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin. So với thế hệ máy trước. Kích thước màn hình tính theo đường chéo.', 'macbook-air-space-gray-select-201810.jpeg', '2023-07-22 20:22:55', 19000000, 21000000, 3, 1),
(6, 'iPad Pro M2  128GB\n', 'iPad Pro. Siêu mạnh mẽ với M2.\n\niPad chưa bao giờ Pro đến thế.\n\nTính đa năng của iPad. Hiệu năng đột phá của chip M2.\n\niPad Pro. Với hiệu năng ấn tượng, kết nối không dây siêu nhanh và trải nghiệm Apple Pencil thế hệ mới. Cùng với các tính năng mới mạnh mẽ cho hiệu suất công việc và cộng tác ở iPadOS 16. iPad Pro đem đến trải nghiệm iPad cực đỉnh.\n\n \n\nTính năng nổi bật\n  Màn hình Liquid Retina XDR 12,9 inch1 lộng lẫy với ProMotion, True Tone và dải màu rộng P3\n  Chip M2 với CPU 8 lõi và GPU 10 lõi\n  Camera Wide 12MP, camera sau Ultra Wide 10MP và LiDAR Scanner cho trải nghiệm AR sống động\n  Camera trước Ultra Wide 12MP với tính năng Trung Tâm Màn Hình\n  Wi-Fi 6E2 và mạng di động 5G3 siêu nhanh\n  Cổng kết nối USB-C hỗ trợ Thunderbolt / USB 4\n  Xác thực bảo mật với Face ID\n  Làm được nhiều việc hơn với thời lượng pin bền bỉ cả ngày4\n  Tương thích với Apple Pencil (thế hệ thứ 2), Magic Keyboard và Smart Keyboard Folio\n  Hỗ trợ tính năng lướt của Apple Pencil để đánh dấu và phác thảo chính xác hơn\n  iPadOS 16 khiến iPad giàu năng lực hơn hẳn với các tính năng mới mạnh mẽ cho hiệu suất công việc và cộng tác.\n \n\nPháp lý\nPhụ kiện được bán riêng và tùy thuộc nguồn hàng có sẵn. Khả năng tương thích tùy thuộc thế hệ sản phẩm. Ứng dụng có sẵn trên App Store. Nội dung được cung cấp có thể thay đổi. Phần mềm bên thứ ba được bán riêng.\n\n1Màn hình có các góc bo tròn. Khi tính theo hình chữ nhật, kích thước màn hình iPad Pro 12,9 inch theo đường chéo là 12,9 inch. Diện tích hiển thị thực tế nhỏ hơn.\n\n2Wi-Fi 6E không khả dụng tại Trung Quốc đại lục và Nhật Bản.\n\n3Cần có gói cước dữ liệu. Mạng 5G chỉ khả dụng ở một số thị trường và được cung cấp qua một số nhà mạng. Tốc độ có thể thay đổi tùy địa điểm và nhà mạng. Để biết thông tin về hỗ trợ mạng 5G, vui lòng liên hệ nhà mạng và truy cập apple.com/ipad/cellular.\n\n4Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin.', 'ipad-pro-m1-11-inch-wifi-2tb-2021-xam-thumb-600x600.jpeg', '2023-07-22 20:23:43', 23000000, 25000000, 2, 1),
(14, 'MacBook Pro M1 16GB', 'It’s here. Our first chip designed specifically for Mac. Packed with an astonishing 16 billion transistors, the Apple M1 system on a chip (SoC) integrates the CPU, GPU, Neural Engine, I/O, and so much more onto a single tiny chip. With incredible performance, custom technologies, and industry-leading power efficiency,1 M1 is not just a next step for Mac — it’s another level entirely.\n', 'mb.jpg', '2023-07-22 20:24:53', 35000000, 29000000, 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_session_id` int(11) DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 người dùng 0 admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_session_id`, `role`) VALUES
(2, '', 'tram@gmail.com', '123', 0, 0),
(6, 'Trang', 'trang@gmail.com', '111', NULL, 1),
(8, 'Nam khùng', 'nam1@gmail.com', '111', NULL, 1),
(9, 'Ni', 'ni@gmail.com', '123', NULL, 1),
(10, 'chang', 'chang@gmail.com', '777', NULL, 1),
(11, 'ny', 'ny@gmail.com', '123', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `ho` varchar(50) DEFAULT NULL,
  `ten` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `vaitro` tinyint(1) NOT NULL COMMENT '1 admin, 0 là người dùng',
  `locked` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 là bị khóa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`idUser`, `ho`, `ten`, `username`, `password`, `email`, `vaitro`, `locked`) VALUES
(1, 'Lê', 'Trâm', 'tram', '123', 'tram123@gamil.com', 1, 0),
(2, NULL, NULL, 'Trâm', '456', 'abc@gmail.com', 0, 1),
(3, NULL, NULL, 'Dương', '789', 'duong@gmail.com', 1, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `loai`
--
ALTER TABLE `loai`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `loai`
--
ALTER TABLE `loai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
