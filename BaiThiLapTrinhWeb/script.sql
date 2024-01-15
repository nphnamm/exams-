USE [master]
GO
/****** Object:  Database [QLBanQuanAo]    Script Date: 1/14/2024 2:11:16 PM ******/
CREATE DATABASE [QLBanQuanAo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBanQuanAo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLBanQuanAo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBanQuanAo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QLBanQuanAo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLBanQuanAo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBanQuanAo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBanQuanAo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBanQuanAo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBanQuanAo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBanQuanAo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBanQuanAo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBanQuanAo] SET  MULTI_USER 
GO
ALTER DATABASE [QLBanQuanAo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBanQuanAo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBanQuanAo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBanQuanAo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBanQuanAo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBanQuanAo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBanQuanAo', N'ON'
GO
ALTER DATABASE [QLBanQuanAo] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLBanQuanAo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLBanQuanAo]
GO
/****** Object:  Table [dbo].[AnhChiTietSP]    Script Date: 1/14/2024 2:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnhChiTietSP](
	[MaAnh] [nvarchar](50) NOT NULL,
	[MaSPTheoMau] [nvarchar](50) NOT NULL,
	[TenFileAnh] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AnhChiTietSP] PRIMARY KEY CLUSTERED 
(
	[MaAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDH]    Script Date: 1/14/2024 2:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDH](
	[MaDonHang] [nvarchar](50) NOT NULL,
	[MaChiTietSP] [nvarchar](50) NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[DonGiaBan] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSPBan]    Script Date: 1/14/2024 2:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSPBan](
	[MaChiTietSP] [nvarchar](50) NOT NULL,
	[MaSPTheoMau] [nvarchar](50) NOT NULL,
	[KichCo] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGiaBan] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietSPBan] PRIMARY KEY CLUSTERED 
(
	[MaChiTietSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 1/14/2024 2:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [nvarchar](50) NOT NULL,
	[NgayDatHang] [datetime] NOT NULL,
	[MaNguoiDung] [nvarchar](50) NOT NULL,
	[DiaChiGiaoHang] [nvarchar](50) NOT NULL,
	[PTThanhToan] [nchar](10) NOT NULL,
	[TinhTrang] [nvarchar](50) NOT NULL,
	[TenNguoiNhanHang] [nvarchar](50) NOT NULL,
	[SoDienThoaiNhanHang] [nvarchar](50) NOT NULL,
	[TongTien] [int] NOT NULL,
	[GiamGia] [int] NOT NULL,
	[GhiChu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MauSac]    Script Date: 1/14/2024 2:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[MaMau] [nvarchar](50) NOT NULL,
	[TenMau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MauSac] PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 1/14/2024 2:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [nvarchar](50) NOT NULL,
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[TenNguoiDung] [nvarchar](50) NOT NULL,
	[SoDienThoai] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanLoai]    Script Date: 1/14/2024 2:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoai](
	[MaPhanLoai] [nvarchar](50) NOT NULL,
	[PhanLoaiChinh] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhanLoai] PRIMARY KEY CLUSTERED 
(
	[MaPhanLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanLoaiPhu]    Script Date: 1/14/2024 2:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoaiPhu](
	[MaPhanLoaiPhu] [nvarchar](50) NOT NULL,
	[TenPhanLoaiPhu] [nvarchar](50) NOT NULL,
	[MaPhanLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhanLoaiPhu] PRIMARY KEY CLUSTERED 
(
	[MaPhanLoaiPhu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/14/2024 2:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [nvarchar](50) NOT NULL,
	[TenSanPham] [nvarchar](50) NOT NULL,
	[MaPhanLoai] [nvarchar](50) NOT NULL,
	[GiaNhap] [int] NOT NULL,
	[DonGiaBanNhoNhat] [int] NOT NULL,
	[DonGiaBanLonNhat] [int] NOT NULL,
	[TrangThai] [nvarchar](50) NOT NULL,
	[MoTaNgan] [nvarchar](50) NOT NULL,
	[AnhDaiDien] [nvarchar](50) NOT NULL,
	[NoiBat] [nvarchar](50) NOT NULL,
	[MaPhanLoaiPhu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPtheoMau]    Script Date: 1/14/2024 2:11:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPtheoMau](
	[MaSPTheoMau] [nvarchar](50) NOT NULL,
	[MaSanPham] [nvarchar](50) NOT NULL,
	[MaMau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SPtheoMau] PRIMARY KEY CLUSTERED 
(
	[MaSPTheoMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AnhChiTietSP] ([MaAnh], [MaSPTheoMau], [TenFileAnh]) VALUES (N'A1', N'SPM1', N'anh1.jpg')
INSERT [dbo].[AnhChiTietSP] ([MaAnh], [MaSPTheoMau], [TenFileAnh]) VALUES (N'A2', N'SPM2', N'anh2.jpg')
GO
INSERT [dbo].[ChiTietDH] ([MaDonHang], [MaChiTietSP], [SoLuongMua], [DonGiaBan]) VALUES (N'DH1', N'CTSPB1', 2, 90000)
INSERT [dbo].[ChiTietDH] ([MaDonHang], [MaChiTietSP], [SoLuongMua], [DonGiaBan]) VALUES (N'DH2', N'CTSPB2', 3, 120000)
GO
INSERT [dbo].[ChiTietSPBan] ([MaChiTietSP], [MaSPTheoMau], [KichCo], [SoLuong], [DonGiaBan]) VALUES (N'CTSPB1', N'SPM1', N'XL', 2, 90000)
INSERT [dbo].[ChiTietSPBan] ([MaChiTietSP], [MaSPTheoMau], [KichCo], [SoLuong], [DonGiaBan]) VALUES (N'CTSPB2', N'SPM2', N'L', 3, 120000)
GO
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [MaNguoiDung], [DiaChiGiaoHang], [PTThanhToan], [TinhTrang], [TenNguoiNhanHang], [SoDienThoaiNhanHang], [TongTien], [GiamGia], [GhiChu]) VALUES (N'DH1', CAST(N'2024-01-14T00:00:00.000' AS DateTime), N'ND1', N'Ð?a ch? giao hàng 1', N'COD       ', N'Ðang xử lý', N'Nguời nhận hàng 1', N'0123456789', 100000, 0, N'Ghi chú 1')
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [MaNguoiDung], [DiaChiGiaoHang], [PTThanhToan], [TinhTrang], [TenNguoiNhanHang], [SoDienThoaiNhanHang], [TongTien], [GiamGia], [GhiChu]) VALUES (N'DH2', CAST(N'2024-01-15T00:00:00.000' AS DateTime), N'ND2', N'Ð?a ch? giao hàng 2', N'Online    ', N'Ðã giao hàng', N'Người nhận hàng 2', N'0987654321', 150000, 20000, N'Ghi chú 2')
GO
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'M1', N'Ðen')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'M2', N'Trắng')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'M3', N'Đỏ')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (N'M4', N'Hồng')
GO
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [SoDienThoai], [Email], [MatKhau], [DiaChi]) VALUES (N'ND1', N'user1', N'Nguời Dùng 1', N'0123456789', N'user1@example.com', N'password1', N'Ðịa chỉ 1')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [TenNguoiDung], [SoDienThoai], [Email], [MatKhau], [DiaChi]) VALUES (N'ND2', N'user2', N'Nguời Dùng 2', N'0987654321', N'user2@example.com', N'password2', N'Ð?a ch? 2')
GO
INSERT [dbo].[PhanLoai] ([MaPhanLoai], [PhanLoaiChinh]) VALUES (N'PL1', N'Áo')
INSERT [dbo].[PhanLoai] ([MaPhanLoai], [PhanLoaiChinh]) VALUES (N'PL2', N'Quần')
GO
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'PLP1', N'Đầm dạ tiệc', N'PL1')
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'PLP2', N'Đầm công sở', N'PL2')
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'PLP3', N'Quần Công Sở', N'PL3')
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'PLP4', N'Quần Jeans', N'PL4')
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'PLP5', N'Áo Phao', N'PLP5')
INSERT [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu], [TenPhanLoaiPhu], [MaPhanLoai]) VALUES (N'PLP6', N'Áo Vest', N'PLP6')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'SP1', N'Áo Polo Ðen', N'PL1', 50000, 80000, 120000, N'Còn hàng', N'Áo Polo màu den', N'product-01.jpg', N'Yes', N'PLP1')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'SP2', N'Quần Jean Xanh', N'PL2', 60000, 90000, 130000, N'Còn hàng', N'Quần Jean màu xanh', N'product-02.jpg', N'No', N'PLP2')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'SP3', N'Áo Polo Tr?ng', N'PL1', 50000, 80000, 120000, N'Còn hàng', N'Áo Polo màu Trắng', N'product-03.jpg', N'Yes', N'PLP1')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'SP4', N'Quần Jean Xám', N'PL2', 60000, 90000, 130000, N'Còn hàng', N'Quần Jean màu xám', N'product-04.jpg', N'No', N'PLP3')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'SP5', N'Áo So Mi Nam', N'PL1', 50000, 80000, 120000, N'Còn hàng', N'Áo So Mi Nam', N'product-05.jpg', N'Yes', N'PLP1')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [MaPhanLoai], [GiaNhap], [DonGiaBanNhoNhat], [DonGiaBanLonNhat], [TrangThai], [MoTaNgan], [AnhDaiDien], [NoiBat], [MaPhanLoaiPhu]) VALUES (N'SP6', N'Quần Tây Nam', N'PL2', 60000, 90000, 130000, N'Còn hàng', N'Quần Tây Nam', N'product-06.jpg', N'No', N'PLP4')
GO
INSERT [dbo].[SPtheoMau] ([MaSPTheoMau], [MaSanPham], [MaMau]) VALUES (N'SPM1', N'SP1', N'M1')
INSERT [dbo].[SPtheoMau] ([MaSPTheoMau], [MaSanPham], [MaMau]) VALUES (N'SPM2', N'SP2', N'M2')
GO
ALTER TABLE [dbo].[ChiTietDH]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDH_ChiTietSPBan] FOREIGN KEY([MaChiTietSP])
REFERENCES [dbo].[ChiTietSPBan] ([MaChiTietSP])
GO
ALTER TABLE [dbo].[ChiTietDH] CHECK CONSTRAINT [FK_ChiTietDH_ChiTietSPBan]
GO
ALTER TABLE [dbo].[ChiTietDH]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDH_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDH] CHECK CONSTRAINT [FK_ChiTietDH_DonHang]
GO
ALTER TABLE [dbo].[ChiTietSPBan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSPBan_SPtheoMau] FOREIGN KEY([MaSPTheoMau])
REFERENCES [dbo].[SPtheoMau] ([MaSPTheoMau])
GO
ALTER TABLE [dbo].[ChiTietSPBan] CHECK CONSTRAINT [FK_ChiTietSPBan_SPtheoMau]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NguoiDung]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_PhanLoai] FOREIGN KEY([MaPhanLoai])
REFERENCES [dbo].[PhanLoai] ([MaPhanLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_PhanLoai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_PhanLoaiPhu] FOREIGN KEY([MaPhanLoaiPhu])
REFERENCES [dbo].[PhanLoaiPhu] ([MaPhanLoaiPhu])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_PhanLoaiPhu]
GO
ALTER TABLE [dbo].[SPtheoMau]  WITH CHECK ADD  CONSTRAINT [FK_SPtheoMau_MauSac] FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([MaMau])
GO
ALTER TABLE [dbo].[SPtheoMau] CHECK CONSTRAINT [FK_SPtheoMau_MauSac]
GO
ALTER TABLE [dbo].[SPtheoMau]  WITH CHECK ADD  CONSTRAINT [FK_SPtheoMau_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[SPtheoMau] CHECK CONSTRAINT [FK_SPtheoMau_SanPham]
GO
USE [master]
GO
ALTER DATABASE [QLBanQuanAo] SET  READ_WRITE 
GO
