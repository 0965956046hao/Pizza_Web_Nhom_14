USE [master]
GO
/****** Object:  Database [PizzaWeb]    Script Date: 12/04/2022 9:00:43 CH ******/
CREATE DATABASE [PizzaWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PizzaWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PizzaWeb.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PizzaWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PizzaWeb_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PizzaWeb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PizzaWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PizzaWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PizzaWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PizzaWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PizzaWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PizzaWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [PizzaWeb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PizzaWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PizzaWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PizzaWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PizzaWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PizzaWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PizzaWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PizzaWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PizzaWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PizzaWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PizzaWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PizzaWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PizzaWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PizzaWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PizzaWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PizzaWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PizzaWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PizzaWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PizzaWeb] SET  MULTI_USER 
GO
ALTER DATABASE [PizzaWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PizzaWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PizzaWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PizzaWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PizzaWeb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PizzaWeb]
GO
/****** Object:  Table [dbo].[BanhPizza]    Script Date: 12/04/2022 9:00:43 CH ******/
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
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/04/2022 9:00:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[SoLuong] [numeric](18, 0) NULL,
	[TongGia] [numeric](18, 0) NULL,
	[MaHD] [nvarchar](50) NOT NULL,
	[MaBanh] [nvarchar](50) NOT NULL,
	[MaS] [nvarchar](50) NOT NULL,
	[MaV] [nvarchar](50) NOT NULL,
	[MaPT] [nvarchar](50) NOT NULL,
	[MaD] [nvarchar](50) NULL,
	[MaGG] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaBanh] ASC,
	[MaS] ASC,
	[MaV] ASC,
	[MaPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTKhuyenMai]    Script Date: 12/04/2022 9:00:43 CH ******/
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
/****** Object:  Table [dbo].[DangNhap]    Script Date: 12/04/2022 9:00:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[MaKH] [nvarchar](50) NOT NULL,
	[UseName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/04/2022 9:00:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nvarchar](50) NOT NULL,
	[NgayLap] [date] NULL,
	[MaKH] [nvarchar](50) NULL,
	[ThanhToan] [bit] NULL,
	[TongTien] [numeric](18, 0) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/04/2022 9:00:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](50) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nchar](10) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiDe]    Script Date: 12/04/2022 9:00:43 CH ******/
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
/****** Object:  Table [dbo].[LoaiVien]    Script Date: 12/04/2022 9:00:43 CH ******/
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
/****** Object:  Table [dbo].[PhanThem]    Script Date: 12/04/2022 9:00:43 CH ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 12/04/2022 9:00:43 CH ******/
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
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(229000 AS Numeric(18, 0)), N'1', N'10', N'M', N'V1', N'2', N'D3', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(179000 AS Numeric(18, 0)), N'1', N'10', N'S', N'V0', N'5', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(119000 AS Numeric(18, 0)), N'10', N'14', N'S', N'V0', N'5', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(192000 AS Numeric(18, 0)), N'11', N'14', N'M', N'V2', N'2', N'D2', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(119000 AS Numeric(18, 0)), N'11', N'14', N'S', N'V0', N'5', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(129000 AS Numeric(18, 0)), N'12', N'11', N'S', N'V0', N'5', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(159000 AS Numeric(18, 0)), N'12', N'12', N'S', N'V0', N'5', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(179000 AS Numeric(18, 0)), N'2', N'14', N'L', N'V1', N'2', N'D2', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(119000 AS Numeric(18, 0)), N'2', N'14', N'S', N'V0', N'5', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(179000 AS Numeric(18, 0)), N'3', N'10', N'S', N'V0', N'5', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(267000 AS Numeric(18, 0)), N'4', N'10', N'M', N'V2', N'3', N'D2', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(179000 AS Numeric(18, 0)), N'4', N'10', N'S', N'V0', N'5', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(224000 AS Numeric(18, 0)), N'5', N'13', N'M', N'V1', N'3', N'D3', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(159000 AS Numeric(18, 0)), N'5', N'13', N'S', N'V0', N'5', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(149000 AS Numeric(18, 0)), N'6', N'1', N'M', N'V1', N'2', N'D3', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(99000 AS Numeric(18, 0)), N'6', N'1', N'S', N'V0', N'5', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(378000 AS Numeric(18, 0)), N'7', N'13', N'L', N'V0', N'1', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(209000 AS Numeric(18, 0)), N'7', N'13', N'M', N'V1', N'2', N'D2', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(119000 AS Numeric(18, 0)), N'8', N'14', N'S', N'V0', N'5', N'D1', NULL)
INSERT [dbo].[ChiTietHoaDon] ([SoLuong], [TongGia], [MaHD], [MaBanh], [MaS], [MaV], [MaPT], [MaD], [MaGG]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(194000 AS Numeric(18, 0)), N'8', N'15', N'M', N'V1', N'3', N'D2', NULL)
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'1', N'Hien', N'123')
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'2', N'Hao', N'456')
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'3', N'San', N'789')
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'4', N'hoa', N'456')
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'5', N'nhi', N'678')
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'6', N'hao123', N'123456')
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'7', N'hao234', N'123')
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'8', N'hao234', N'123456')
INSERT [dbo].[DangNhap] ([MaKH], [UseName], [Password]) VALUES (N'9', N'nhuthao123', N'123456')
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'1', CAST(N'2022-04-12' AS Date), N'6', 0, CAST(408000 AS Numeric(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'10', CAST(N'2022-04-12' AS Date), N'6', 1, CAST(119000 AS Numeric(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'11', CAST(N'2022-04-12' AS Date), N'6', 0, CAST(311000 AS Numeric(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'12', CAST(N'2022-04-12' AS Date), N'6', 1, CAST(288000 AS Numeric(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'2', CAST(N'2022-04-12' AS Date), N'6', 1, CAST(298000 AS Numeric(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'3', CAST(N'2022-04-12' AS Date), N'4', 0, CAST(179000 AS Numeric(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'4', CAST(N'2022-04-12' AS Date), N'4', 0, CAST(446000 AS Numeric(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'5', CAST(N'2022-04-12' AS Date), N'4', 1, CAST(383000 AS Numeric(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'6', CAST(N'2022-04-12' AS Date), N'6', 1, CAST(248000 AS Numeric(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'7', CAST(N'2022-04-12' AS Date), N'9', 0, CAST(587000 AS Numeric(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'8', CAST(N'2022-04-12' AS Date), N'9', 1, CAST(313000 AS Numeric(18, 0)))
INSERT [dbo].[HoaDon] ([MaHD], [NgayLap], [MaKH], [ThanhToan], [TongTien]) VALUES (N'9', CAST(N'2022-04-12' AS Date), N'6', 1, CAST(497000 AS Numeric(18, 0)))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'1', N'Cao Xuân Hiển', N'Quận 2', N'015316489 ')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'2', N'Võ Phạm Nhựt Hào', N'Quận 9', N'091643267 ')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'3', N'Võ Hồng San', N'Quận Bình Thạnh', N'025631492 ')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'4', N'Lê Thị Thanh Hoa', N'Quận 10', N'0162986123')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'5', N'Lê Thị Thanh nhi', N'Quận 2', N'0162986122')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'6', N'Võ Phạm Nhựt Hào 123', N'Quận 7', N'0965956046')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'7', N'hao123456', N'202/21', N'0965956045')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'8', N'nhuthao', N'202/21 man thiện', N'0965956046')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'9', N'Võ Phạm Nhựt Hào', N'202/21 man thiện, asd', N'0965956046')
INSERT [dbo].[LoaiDe] ([MaD], [TenDeBanh], [GTDB]) VALUES (N'D1', N'Mong', CAST(14000 AS Numeric(18, 0)))
INSERT [dbo].[LoaiDe] ([MaD], [TenDeBanh], [GTDB]) VALUES (N'D2', N'TrungBinh', CAST(27000 AS Numeric(18, 0)))
INSERT [dbo].[LoaiDe] ([MaD], [TenDeBanh], [GTDB]) VALUES (N'D3', N'Day', CAST(40000 AS Numeric(18, 0)))
INSERT [dbo].[LoaiVien] ([MaV], [TenVien], [GTV]) VALUES (N'V0', N'Không viền', CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[LoaiVien] ([MaV], [TenVien], [GTV]) VALUES (N'V1', N'VienPM1', CAST(25000 AS Numeric(18, 0)))
INSERT [dbo].[LoaiVien] ([MaV], [TenVien], [GTV]) VALUES (N'V2', N'VienPM2', CAST(48000 AS Numeric(18, 0)))
INSERT [dbo].[LoaiVien] ([MaV], [TenVien], [GTV]) VALUES (N'V3', N'VienPM3', CAST(56000 AS Numeric(18, 0)))
INSERT [dbo].[PhanThem] ([MaPT], [TenPT], [GTPhanThem]) VALUES (N'1', N'Rau', CAST(10000 AS Numeric(18, 0)))
INSERT [dbo].[PhanThem] ([MaPT], [TenPT], [GTPhanThem]) VALUES (N'2', N'Thit', CAST(15000 AS Numeric(18, 0)))
INSERT [dbo].[PhanThem] ([MaPT], [TenPT], [GTPhanThem]) VALUES (N'3', N'HaiSan', CAST(30000 AS Numeric(18, 0)))
INSERT [dbo].[PhanThem] ([MaPT], [TenPT], [GTPhanThem]) VALUES (N'4', N'NuocNgot', CAST(15000 AS Numeric(18, 0)))
INSERT [dbo].[PhanThem] ([MaPT], [TenPT], [GTPhanThem]) VALUES (N'5', N'NuocFree', CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[Size] ([MaS], [LoaiSize], [GTS]) VALUES (N'L', N'Large', CAST(20000 AS Numeric(18, 0)))
INSERT [dbo].[Size] ([MaS], [LoaiSize], [GTS]) VALUES (N'M', N'Medium', CAST(10000 AS Numeric(18, 0)))
INSERT [dbo].[Size] ([MaS], [LoaiSize], [GTS]) VALUES (N'S', N'Small', CAST(0 AS Numeric(18, 0)))
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
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
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
USE [master]
GO
ALTER DATABASE [PizzaWeb] SET  READ_WRITE 
GO
