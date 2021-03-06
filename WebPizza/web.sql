
USE PizzaStore
GO
/****** Object:  Table [dbo].[BanhPizza]    Script Date: 02-Apr-22 7:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanhPizza](
	[MaBanh] [nvarchar](50) NOT NULL,
	[TenBanh] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[DonGia] [numeric](18, 0) NULL,
 CONSTRAINT [PK_BanhPizza] PRIMARY KEY CLUSTERED 
(
	[MaBanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 02-Apr-22 7:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[SoLuong] [numeric](18, 0) NULL,
	[TongGia] [numeric](18, 0) NULL,
	[MaBanh] [nvarchar](50) NOT NULL,
	[MaS] [nvarchar](50) NULL,
	[MaV] [nvarchar](50) NULL,
	[MaPT] [nvarchar](50) NULL,
	[MaD] [nvarchar](50) NULL,
	[MaGG] [nvarchar](50) NULL,
	[MaHD] int  NOT NULL,
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTKhuyenMai]    Script Date: 02-Apr-22 7:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTKhuyenMai](
	[MaGG] [nvarchar](50) NOT NULL,
	[PTGiam] [float] NULL,
 CONSTRAINT [PK_CTKhuyenMai] PRIMARY KEY CLUSTERED 
(
	[MaGG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 02-Apr-22 7:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[MaKH] int NOT NULL,
	[UseName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 02-Apr-22 7:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] int IDENTITY(1,1) NOT NULL,
	[NgayLap] [date] NULL,
	[MaKH] [nvarchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 02-Apr-22 7:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] int IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nchar](10) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDe]    Script Date: 02-Apr-22 7:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDe](
	[MaD] [nvarchar](50) NOT NULL,
	[TenDeBanh] [nvarchar](50) NULL,
	[GTDB] [numeric](18, 0) NULL,
 CONSTRAINT [PK_LoaiDe] PRIMARY KEY CLUSTERED 
(
	[MaD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiVien]    Script Date: 02-Apr-22 7:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiVien](
	[MaV] [nvarchar](50) NOT NULL,
	[TenVien] [nvarchar](50) NULL,
	[GTV] [numeric](18, 0) NULL,
 CONSTRAINT [PK_LoaiVien] PRIMARY KEY CLUSTERED 
(
	[MaV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanThem]    Script Date: 02-Apr-22 7:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanThem](
	[MaPT] [nvarchar](50) NOT NULL,
	[TenPT] [nvarchar](50) NULL,
	[GTPhanThem] [numeric](18, 0) NULL,
 CONSTRAINT [PK_PhanThem] PRIMARY KEY CLUSTERED 
(
	[MaPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 02-Apr-22 7:49:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[MaS] [nvarchar](50) NOT NULL,
	[LoaiSize] [nvarchar](50) NULL,
	[GTS] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[MaS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'1', N'Thịt Xông Khói', N'Thơm Ngon Và Giàu Protein Với Thịt Xông Khói, Xúc Xích, ThịT Bò, Giăm Bông Và Pepperoni', N'hinh1.jpg', CAST(99000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'10', N'Sfiha', N'Sfiha được xem là pizza tại Syria và khá nổi tiếng ở các nước Trung Đông.', N'hinh10.jpg', CAST(179000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'11', N'Bulgogi Pizza', N'Bulgogi là món ăn ưa thích của người Hàn Quốc và là món ăn quen thuộc của xứ kim chi.', N'hinh11.jpg', CAST(129000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'12', N'Kebab Pizza', N'Từ tên gọi Kebab Pizza ta có thể hình dung ra loại đồ ăn vặt đầy hấp dẫn của người Thụy Điển.', N'hinh12.jpg', CAST(159000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'13', N'Neapolitan', N'Đến từ chính quê hương của pizza chiếc bánh mang phong cách truyền thống và đơn giản.', N'hinh13.jpg', CAST(159000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'14', N'Coca', N'Coca gồm một lát bánh mì nướng với ớt chuông đỏ và xúc xích Tây Ban Nha.', N'hinh14.jpg', CAST(119000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'15', N'Pizza chiên', N'Những chiếc pizza chiên tạo nên món ăn đường phố đầy hấp dẫn ở Glasgow và Fife.', N'hinh15.jpg', CAST(129000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'16', N'Deep-Dish', N'Món pizza với phần nhân được kẹp giữa hai lớp vỏ dày làm cho chiếc bánh trong rất đồ sộ.', N'hinh16.jpg', CAST(129000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'17', N'Pastrmajlija', N'Thịt nướng với hạt tiêu tạo nên phần topping ngon tuyệt và được rất nhiều người ưu chuộng', N'hinh17.jpg', CAST(150000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'18', N'Bánh pizza pepperoni', N'Chiếc bánh pizza được phục vụ trên hơn 35% tất cả đơn hàng pizza tại Mỹ.', N'hinh18.gif', CAST(359000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'2', N'Hải Sản', N'Pizza Cơn Lốc Hải Sản Với Hải Sản (MựC, Thanh Cua) Nhân Đôi Cùng Với Thơm, Ớt Chuông Xanh, HàNh Tây, Phủ Phô Mai Mozzarella', N'hinh2.jpg', CAST(99000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'3', N'Rau', N'Thanh Nhẹ Với Ô Liu Đen Tuyệt Hảo, Cà Chua Bi Tươi Ngon, Nấm, Thơm, Bắp, Hành Tây Và Phô Mai Mozzarella Cho Bạn Bữa Tiệc Rau Củ Tròn Vị', N'hinh3.jpg', CAST(99000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'4', N'Bò và Tôm', N'Thịt Bò Úc, Tôm, Thơm Trên Nền Xốt Hàn Quốc Cay Nồng, Phủ Rau Mầm Và Mè Rang', N'hinh4.jpg', CAST(99000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'5', N'Trứng Cút Xốt', N'Trứng cút cay kiểu Ý trên nền sốt cà chua', N'hinh5.jpg', CAST(79000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'6', N'Gà Phô Mai', N'Với 3 LớP Phô Mai Mozzarella VàNg Óng Quyến Rũ', N'hinh6.jpg', CAST(79000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'7', N'Đặc Biệt 5 Vị', N'Tôm, Nấm, Xúc Xích, Thanh Cua, Mực', N'hinh7.jpg', CAST(249000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'8', N'Bò Mê-Hi-Cô', N'Pizza Bò Nướng Nấm Trong Cuộc Phiêu Lưu Vị Giác Với Thịt Bò, Nấm, Thơm, Cà Rốt Và Rau Mầm Phủ Xốt Tiêu Đen Thơm Nồng', N'hinh8.jpg', CAST(249000 AS Numeric(18, 0)))
INSERT [dbo].[BanhPizza] ([MaBanh], [TenBanh], [MoTa], [Image], [DonGia]) VALUES (N'9', N'Hải Sản Singapore', N'Tôm, cua, mực và nghêu với sốt Singapore', N'hinh9.jpg', CAST(249000 AS Numeric(18, 0)))
GO
INSERT [dbo].[CTKhuyenMai] ([MaGG], [PTGiam]) VALUES (N'KM1', 2)
INSERT [dbo].[CTKhuyenMai] ([MaGG], [PTGiam]) VALUES (N'KM2', 5)
INSERT [dbo].[CTKhuyenMai] ([MaGG], [PTGiam]) VALUES (N'KM3', 10)
GO
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'1', N'Hien', N'123')
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'2', N'Hao', N'456')
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'3', N'San', N'789')
GO
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH]) VALUES (N'1', CAST(N'2020-02-20' AS Date), N'1')
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH]) VALUES (N'2', CAST(N'2022-03-19' AS Date), N'2')
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH]) VALUES (N'3', CAST(N'2022-03-08' AS Date), N'3')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'1', N'Cao Xuân Hiển', N'Quận 2', N'015316489 ')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'2', N'Võ Phạm Nhựt Hào', N'Quận 9', N'091643267 ')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'3', N'Võ Hồng San', N'Quận Bình Thạnh', N'025631492 ')
GO
INSERT [dbo].[LoaiDe] ([MaD], [TenDeBanh], [GTDB]) VALUES (N'D1', N'Mong', CAST(14000 AS Numeric(18, 0)))
INSERT [dbo].[LoaiDe] ([MaD], [TenDeBanh], [GTDB]) VALUES (N'D2', N'TrungBinh', CAST(27000 AS Numeric(18, 0)))
INSERT [dbo].[LoaiDe] ([MaD], [TenDeBanh], [GTDB]) VALUES (N'D3', N'Day', CAST(40000 AS Numeric(18, 0)))
GO
INSERT [dbo].[LoaiVien] ([MaV], [TenVien], [GTV]) VALUES (N'V1', N'VienPM1', CAST(25000 AS Numeric(18, 0)))
INSERT [dbo].[LoaiVien] ([MaV], [TenVien], [GTV]) VALUES (N'V2', N'VienPM2', CAST(48000 AS Numeric(18, 0)))
INSERT [dbo].[LoaiVien] ([MaV], [TenVien], [GTV]) VALUES (N'V3', N'VienPM3', CAST(56000 AS Numeric(18, 0)))
GO
INSERT [dbo].[PhanThem] ([MaPT], [TenPT], [GTPhanThem]) VALUES (N'1', N'Rau', CAST(10000 AS Numeric(18, 0)))
INSERT [dbo].[PhanThem] ([MaPT], [TenPT], [GTPhanThem]) VALUES (N'2', N'Thit', CAST(15000 AS Numeric(18, 0)))
INSERT [dbo].[PhanThem] ([MaPT], [TenPT], [GTPhanThem]) VALUES (N'3', N'HaiSan', CAST(30000 AS Numeric(18, 0)))
INSERT [dbo].[PhanThem] ([MaPT], [TenPT], [GTPhanThem]) VALUES (N'4', N'NuocNgot', CAST(15000 AS Numeric(18, 0)))
INSERT [dbo].[PhanThem] ([MaPT], [TenPT], [GTPhanThem]) VALUES (N'5', N'NuocFree', CAST(0 AS Numeric(18, 0)))
GO
INSERT [dbo].[Size] ([MaS], [LoaiSize], [GTS]) VALUES (N'L', N'Large', CAST(38000 AS Numeric(18, 0)))
INSERT [dbo].[Size] ([MaS], [LoaiSize], [GTS]) VALUES (N'M', N'Medium', CAST(20000 AS Numeric(18, 0)))
INSERT [dbo].[Size] ([MaS], [LoaiSize], [GTS]) VALUES (N'S', N'Small', CAST(12000 AS Numeric(18, 0)))
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_BanhPizza] FOREIGN KEY([MaBanh])
REFERENCES [dbo].[BanhPizza] ([MaBanh])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_BanhPizza]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_CTKhuyenMai] FOREIGN KEY([MaGG])
REFERENCES [dbo].[CTKhuyenMai] ([MaGG])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_CTKhuyenMai]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_LoaiDe] FOREIGN KEY([MaD])
REFERENCES [dbo].[LoaiDe] ([MaD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_LoaiDe]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_LoaiVien] FOREIGN KEY([MaV])
REFERENCES [dbo].[LoaiVien] ([MaV])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_LoaiVien]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_PhanThem] FOREIGN KEY([MaPT])
REFERENCES [dbo].[PhanThem] ([MaPT])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_PhanThem]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_Size] FOREIGN KEY([MaS])
REFERENCES [dbo].[Size] ([MaS])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_Size]
GO
ALTER TABLE [dbo].[DangNhap]  WITH CHECK ADD  CONSTRAINT [FK_DangNhap_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DangNhap] CHECK CONSTRAINT [FK_DangNhap_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO