# e-Hunian Design Tokens

## Project Information

**Application Name:** e-Hunian  
**Description:** Aplikasi Layanan dan Pengelolaan Rusunawa Berbasis Mobile  

Design tokens ini digunakan sebagai standar visual untuk menjaga konsistensi antara desain Figma, prototype, dan implementasi aplikasi.

---

# 1. Color Tokens

## Primary Colors

Warna utama aplikasi yang digunakan pada tombol, navigasi aktif, dan elemen interaksi.

| Token | Hex Value |
|---|---|
| primary-50 | #EFF6FF |
| primary-100 | #DBEAFE |
| primary-300 | #93C5FD |
| primary-500 | #3B82F6 |
| primary-700 | #1D4ED8 |
| primary-900 | #1E3A8A |

---

## Semantic Colors

Digunakan untuk status dan notifikasi sistem.

| Token | Hex Value | Usage |
|---|---|---|
| success-500 | #16A34A | Status tersedia / berhasil |
| warning-500 | #F59E0B | Status menunggu |
| error-500 | #DC2626 | Error / gagal |
| info-500 | #2563EB | Informasi |

---

## Neutral Colors

Digunakan untuk background, teks, dan elemen pendukung.

| Token | Hex Value |
|---|---|
| neutral-50 | #F9FAFB |
| neutral-100 | #F3F4F6 |
| neutral-200 | #E5E7EB |
| neutral-400 | #9CA3AF |
| neutral-600 | #4B5563 |
| neutral-800 | #1F2937 |

---

# 2. Typography Tokens

Font utama:

```
Inter
```

| Token | Size | Weight | Usage |
|---|---|---|---|
| display-large | 32px | Bold | Selamat Datang |
| heading-1 | 24px | Bold | Rusunawa Pasar Rumput |
| heading-2 | 20px | Semi Bold | Profil Hunian |
| body-large | 16px | Regular | Hunian Nyaman dan Terjangkau |
| body-medium | 14px | Regular | 25 Lantai \| PDAM |
| caption | 12px | Medium | Tersedia |

---

# 3. Spacing Tokens

Menggunakan sistem spacing berbasis 4px.

| Token | Value |
|---|---|
| space-4 | 4px |
| space-8 | 8px |
| space-16 | 16px |
| space-24 | 24px |
| space-32 | 32px |
| space-48 | 48px |

---

# 4. Component Tokens

## Button Primary

Component:

```
Button / Primary
```

Specification:

```
Text:
Ajukan Sewa

Height:
48px

Radius:
12px

Background:
primary-700

Text Color:
white
```

---

## Search Bar

Component:

```
Search Bar
```

Specification:

```
Content:
🔍 Cari Rusunawa..

Height:
44px

Radius:
12px

Background:
neutral-100
```

---

## Housing Card

Component:

```
Card / Housing
```

Content:

```
- Foto Rusunawa
- Nama Rusunawa
- Rating
- Harga Sewa
- Status Unit
```

Example:

```
Rusunawa Pasar Rumput

⭐ 4.8

Rp650.000/bln

Tersedia
```

Specification:

```
Radius:
16px

Background:
White
```

---

## Unit Card

Component:

```
Card / Unit
```

Content:

```
Unit B-0304

2 KT | 1 KM

Lantai 3

Rp650.000/bulan

Tersedia
```

---

## Status Badge

Component:

```
Badge / Status
```

Variants:

| Variant | Usage |
|---|---|
| Available | Tersedia |
| Pending | Dalam Pengajuan |
| Rented | Disewa |

Color:

```
Available:
success-500

Pending:
warning-500

Rented:
neutral-400
```

---

## Bottom Navigation

Component:

```
Navigation / Bottom Bar
```

Items:

```
⌂ Home

🏢 Hunian

📄 Pengajuan

👤 Profil
```

Specification:

```
Height:
72px

Active Color:
primary-700

Inactive Color:
neutral-400
```

---

# 5. Design Rules

## Do

- Gunakan color token yang tersedia.
- Gunakan spacing berdasarkan sistem 4px.
- Gunakan reusable component.
- Gunakan typography sesuai hierarchy.

## Don't

- Jangan menggunakan warna hex baru.
- Jangan membuat ukuran spacing di luar token.
- Jangan membuat komponen tanpa dokumentasi.

---

# Version

```
e-Hunian Design Tokens v1.0
High Fidelity Mockup Project
```
