<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ea74e479-55a1-4ad4-9403-67912df02a2a" /><img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/52659a0b-1d43-4d01-ae83-19e789d0e7c0" /># API Contract — e-Hunian

## 1. Overview

API e-Hunian merupakan RESTful API untuk mendukung sistem informasi
pengelolaan rumah susun sederhana sewa (Rusunawa).

API digunakan untuk mengelola pengguna, informasi Rusunawa, unit hunian,
fasilitas, pengajuan sewa, dokumen pengajuan, dan ulasan.

Seluruh endpoint menggunakan format JSON dan mengikuti prinsip RESTful
dengan penggunaan HTTP method sesuai fungsi masing-masing endpoint.

## 2. Base URL

```text
/api

## 3. Authentication

Endpoint yang membutuhkan autentikasi menggunakan token pada HTTP header:

```text
Authorization: Bearer <access_token>

## 4. Standard Response

### 4.1 Success Response

Seluruh endpoint yang berhasil menggunakan struktur response JSON yang konsisten:

```json
{
  "status": "success",
  "message": "Request berhasil diproses",
  "data": {}
}

### 4.2 Error Response

Jika terjadi kesalahan, API menggunakan struktur response berikut:

```json
{
  "status": "error",
  "message": "Request tidak dapat diproses",
  "errors": {}
}

## 5. Authentication Endpoints

### 5.1 Register User

**POST** `/auth/register`

Digunakan untuk membuat akun pengguna baru.

**Authentication:** Tidak diperlukan.

**Request Body:**

```json
{
  "name": "Budi Santoso",
  "email": "budi@email.com",
  "password": "password123",
  "phone": "08123456789",
  "role": "resident"
}

**Success Response — 201:**

```json
{
  "status": "success",
  "message": "Registrasi berhasil",
  "data": {
    "id": 1,
    "name": "Budi Santoso",
    "email": "budi@email.com",
    "role": "resident"
  }
}

**Error Response:**

- **422** — Data registrasi tidak valid atau email sudah digunakan.
- **400** — Request tidak dapat diproses.

---

### 5.2 Login User

**POST** `/auth/login`

Digunakan untuk melakukan autentikasi pengguna.

**Authentication:** Tidak diperlukan.

**Request Body:**

```json
{
  "email": "budi@email.com",
  "password": "password123"
}

**Success Response — 200:**

```json
{
  "status": "success",
  "message": "Login berhasil",
  "data": {
    "access_token": "eyJhbGciOi...",
    "user": {
      "id": 1,
      "name": "Budi Santoso",
      "email": "budi@email.com",
      "role": "resident"
    }
  }
}
**Error Response:**

- **401** — Email atau password salah.
- **422** — Email atau password belum diisi.

---

## 6. Rusunawa Endpoints

### 6.1 Get All Rusunawa

**GET** `/rusunawa`

Digunakan untuk menampilkan daftar Rusunawa yang tersedia.

**Authentication:** Tidak diperlukan.

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Data Rusunawa berhasil diambil",
  "data": [
    {
      "id": 1,
      "name": "Rusunawa Pasar Rumput",
      "location": "Jakarta Selatan",
      "description": "Hunian vertikal untuk masyarakat",
      "rating": 4.8,
      "total_units": 142
    }
  ]
}

---

### 6.2 Get Rusunawa Detail

**GET** `/rusunawa/{id}`

Digunakan untuk menampilkan informasi detail Rusunawa berdasarkan ID.

**Authentication:** Tidak diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Rusunawa |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Detail Rusunawa berhasil diambil",
  "data": {
    "id": 1,
    "name": "Rusunawa Pasar Rumput",
    "location": "Jakarta Selatan",
    "description": "Hunian vertikal untuk masyarakat",
    "rating": 4.8,
    "total_units": 142
  }
}

---

### 6.3 Get Rusunawa Units

**GET** `/rusunawa/{id}/units`

Digunakan untuk menampilkan daftar unit hunian pada suatu Rusunawa.

**Authentication:** Tidak diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Rusunawa |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Daftar unit berhasil diambil",
  "data": [
    {
      "id": 1,
      "rusunawa_id": 1,
      "unit_number": "B-0304",
      "floor": 3,
      "area_m2": 36.00,
      "bedrooms": 2,
      "monthly_price": 650000.00,
      "status": "available"
    },
    {
      "id": 2,
      "rusunawa_id": 1,
      "unit_number": "B-0412",
      "floor": 4,
      "area_m2": 36.00,
      "bedrooms": 2,
      "monthly_price": 650000.00,
      "status": "available"
    }
  ]
}

---

### 6.4 Get Unit Detail

**GET** `/units/{id}`

Digunakan untuk menampilkan informasi detail unit hunian berdasarkan ID.

**Authentication:** Tidak diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Unit |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Detail unit berhasil diambil",
  "data": {
    "id": 1,
    "rusunawa_id": 1,
    "unit_number": "B-0304",
    "floor": 3,
    "area_m2": 36.00,
    "bedrooms": 2,
    "monthly_price": 650000.00,
    "status": "available"
  }
}

### 6.5 Get Rusunawa Facilities

**GET** `/rusunawa/{id}/facilities`

Digunakan untuk menampilkan daftar fasilitas yang tersedia pada Rusunawa berdasarkan ID Rusunawa.

**Authentication:** Tidak diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Rusunawa |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Daftar fasilitas berhasil diambil",
  "data": [
    {
      "id": 1,
      "name": "Area Parkir",
      "description": "Area parkir kendaraan penghuni"
    },
    {
      "id": 2,
      "name": "Mushola",
      "description": "Tempat ibadah bagi penghuni"
    }
  ]
}
```

**Error Response:**

- **404** — Rusunawa tidak ditemukan.
- **200** — Rusunawa ditemukan tetapi belum memiliki fasilitas.

### 6.6 Get Facility Detail

**GET** `/facilities/{id}`

Digunakan untuk menampilkan informasi detail fasilitas berdasarkan ID fasilitas.

**Authentication:** Tidak diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Fasilitas |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Detail fasilitas berhasil diambil",
  "data": {
    "id": 1,
    "name": "Area Parkir",
    "description": "Area parkir kendaraan penghuni"
  }
}
```

**Error Response:**

- **404** — Fasilitas tidak ditemukan.

## 7. Application Endpoints

### 7.1 Create Application

**POST** `/applications`

Digunakan untuk membuat pengajuan sewa unit Rusunawa oleh pengguna.

**Authentication:** Diperlukan.

**Request Body:**

```json
{
  "unit_id": 1
}
```

**Request Body Parameters:**

| Parameter | Tipe | Wajib | Keterangan |
|---|---|---|---|
| unit_id | integer | Ya | ID unit yang ingin diajukan |

**Success Response – 201:**

```json
{
  "status": "success",
  "message": "Pengajuan berhasil dibuat",
  "data": {
    "id": 1,
    "application_number": "APP-20261005-0001",
    "user_id": 1,
    "unit_id": 1,
    "status": "submitted",
    "submitted_at": "2026-10-05T15:00:00Z"
  }
}
```

**Error Response:**

- **400** — Data pengajuan tidak valid.
- **401** — Pengguna belum terautentikasi.
- **404** — Unit tidak ditemukan.
- **409** — Unit tidak tersedia atau sudah diajukan.

### 7.2 Get My Applications

**GET** `/applications`

Digunakan untuk menampilkan daftar pengajuan sewa milik pengguna yang sedang login.

**Authentication:** Diperlukan.

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Daftar pengajuan berhasil diambil",
  "data": [
    {
      "id": 1,
      "application_number": "APP-20261005-0001",
      "unit_id": 1,
      "status": "submitted",
      "submitted_at": "2026-10-05T15:00:00Z"
    }
  ]
}
```

**Error Response:**

- **401** — Pengguna belum terautentikasi.

### 7.3 Get Application Detail

**GET** `/applications/{id}`

Digunakan untuk menampilkan detail pengajuan sewa berdasarkan ID pengajuan.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Detail pengajuan berhasil diambil",
  "data": {
    "id": 1,
    "application_number": "APP-20261005-0001",
    "user_id": 1,
    "unit_id": 1,
    "status": "submitted",
    "submitted_at": "2026-10-05T15:00:00Z"
  }
}
```

**Error Response:**

- **401** — Pengguna belum terautentikasi.
- **403** — Pengguna tidak memiliki akses ke pengajuan tersebut.
- **404** — Pengajuan tidak ditemukan.

### 7.4 Cancel Application

**PATCH** `/applications/{id}/cancel`

Digunakan untuk membatalkan pengajuan sewa yang dibuat oleh pengguna yang sedang login.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Pengajuan berhasil dibatalkan",
  "data": {
    "id": 1,
    "application_number": "APP-20261005-0001",
    "status": "cancelled",
    "cancelled_at": "2026-10-05T16:00:00Z"
  }
}
```

**Error Response:**

- **401** — Pengguna belum terautentikasi.
- **403** — Pengguna tidak memiliki akses ke pengajuan tersebut.
- **404** — Pengajuan tidak ditemukan.
- **409** — Pengajuan tidak dapat dibatalkan karena status sudah berubah.

### 7.5 Upload Application Document

**POST** `/applications/{id}/documents`

Digunakan untuk mengunggah dokumen yang diperlukan dalam proses pengajuan sewa.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Request Body:**

```text
Content-Type: multipart/form-data
```

| Parameter | Tipe | Wajib | Keterangan |
|---|---|---|---|
| document_type | string | Ya | Jenis dokumen yang diunggah |
| file | file | Ya | File dokumen pengajuan |

**Success Response – 201:**

```json
{
  "status": "success",
  "message": "Dokumen berhasil diunggah",
  "data": {
    "id": 1,
    "application_id": 1,
    "document_type": "ktp",
    "file_name": "ktp_budi_santoso.pdf",
    "file_url": "/storage/documents/ktp_budi_santoso.pdf",
    "uploaded_at": "2026-10-05T16:30:00Z"
  }
}
```

**Error Response:**

- **400** — Data atau format dokumen tidak valid.
- **401** — Pengguna belum terautentikasi.
- **403** — Pengguna tidak memiliki akses ke pengajuan tersebut.
- **404** — Pengajuan tidak ditemukan.
- **422** — File tidak memenuhi ketentuan yang ditetapkan.

### 7.6 Get Application Documents

**GET** `/applications/{id}/documents`

Digunakan untuk menampilkan daftar dokumen yang telah diunggah pada suatu pengajuan sewa.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Daftar dokumen berhasil diambil",
  "data": [
    {
      "id": 1,
      "application_id": 1,
      "document_type": "ktp",
      "file_name": "ktp_budi_santoso.pdf",
      "file_url": "/storage/documents/ktp_budi_santoso.pdf",
      "uploaded_at": "2026-10-05T16:30:00Z"
    }
  ]
}
```

**Error Response:**

- **401** — Pengguna belum terautentikasi.
- **403** — Pengguna tidak memiliki akses ke pengajuan tersebut.
- **404** — Pengajuan tidak ditemukan.
- **200** — Pengajuan ditemukan tetapi belum memiliki dokumen.

### 7.7 Get Application Document Detail

**GET** `/application-documents/{id}`

Digunakan untuk menampilkan informasi detail dokumen pengajuan berdasarkan ID dokumen.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Dokumen |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Detail dokumen berhasil diambil",
  "data": {
    "id": 1,
    "application_id": 1,
    "document_type": "ktp",
    "file_name": "ktp_budi_santoso.pdf",
    "file_url": "/storage/documents/ktp_budi_santoso.pdf",
    "uploaded_at": "2026-10-05T16:30:00Z"
  }
}
```

**Error Response:**

- **401** — Pengguna belum terautentikasi.
- **403** — Pengguna tidak memiliki akses ke dokumen tersebut.
- **404** — Dokumen tidak ditemukan.

### 7.8 Delete Application Document

**DELETE** `/application-documents/{id}`

Digunakan untuk menghapus dokumen pengajuan yang telah diunggah oleh pengguna.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Dokumen |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Dokumen berhasil dihapus",
  "data": null
}
```

**Error Response:**

- **401** — Pengguna belum terautentikasi.
- **403** — Pengguna tidak memiliki akses ke dokumen tersebut.
- **404** — Dokumen tidak ditemukan.
- **409** — Dokumen tidak dapat dihapus karena pengajuan sudah diproses.

### 7.9 Update Application Document

**PUT** `/application-documents/{id}`

Digunakan untuk memperbarui dokumen pengajuan yang telah diunggah sebelumnya.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Dokumen |

**Request Body:**

```text
Content-Type: multipart/form-data
```

| Parameter | Tipe | Wajib | Keterangan |
|---|---|---|---|
| document_type | string | Ya | Jenis dokumen |
| file | file | Ya | File dokumen pengganti |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Dokumen berhasil diperbarui",
  "data": {
    "id": 1,
    "application_id": 1,
    "document_type": "ktp",
    "file_name": "ktp_budi_santoso_update.pdf",
    "file_url": "/storage/documents/ktp_budi_santoso_update.pdf",
    "uploaded_at": "2026-10-05T17:00:00Z"
  }
}
```

**Error Response:**

- **400** — Data atau format dokumen tidak valid.
- **401** — Pengguna belum terautentikasi.
- **403** — Pengguna tidak memiliki akses ke dokumen tersebut.
- **404** — Dokumen tidak ditemukan.
- **409** — Dokumen tidak dapat diperbarui karena pengajuan sudah diproses.
- **422** — File tidak memenuhi ketentuan yang ditetapkan.

### 7.10 Submit Application

**POST** `/applications/{id}/submit`

Digunakan untuk mengirim atau mengajukan kembali pengajuan sewa setelah data dan dokumen yang diperlukan telah lengkap.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Pengajuan berhasil dikirim",
  "data": {
    "id": 1,
    "application_number": "APP-20261005-0001",
    "status": "submitted",
    "submitted_at": "2026-10-05T17:15:00Z"
  }
}
### 7.11 Get Application Status

**GET** `/applications/{id}/status`

Digunakan untuk menampilkan status terbaru dari pengajuan sewa milik pengguna.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Status pengajuan berhasil diambil",
  "data": {
    "id": 1,
    "application_number": "APP-20261005-0001",
    "status": "submitted",
    "submitted_at": "2026-10-05T17:15:00Z"
  }
}

### 7.12 Get Application History

**GET** `/applications/{id}/history`

Digunakan untuk menampilkan riwayat perubahan status pengajuan sewa.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Riwayat pengajuan berhasil diambil",
  "data": [
    {
      "status": "submitted",
      "changed_at": "2026-10-05T17:15:00Z",
      "note": "Pengajuan berhasil dikirim"
    },
    {
      "status": "reviewed",
      "changed_at": "2026-10-06T09:00:00Z",
      "note": "Pengajuan sedang ditinjau"
    }
  ]
}

### 7.13 Update Application

**PUT** `/applications/{id}`

Digunakan untuk memperbarui data pengajuan sewa selama pengajuan belum diproses.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Request Body Parameters:**

| Parameter | Tipe | Wajib | Keterangan |
|---|---|---|---|
| unit_id | integer | Tidak | ID unit yang dipilih |
| notes | string | Tidak | Catatan tambahan pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Pengajuan berhasil diperbarui",
  "data": {
    "id": 1,
    "application_number": "APP-20261005-0001",
    "unit_id": 2,
    "notes": "Pengajuan diperbarui oleh pengguna",
    "status": "draft",
    "updated_at": "2026-10-05T18:00:00Z"
  }
}

### 7.14 Delete Application

**DELETE** `/applications/{id}`

Digunakan untuk membatalkan atau menghapus pengajuan sewa yang dibuat oleh pengguna.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Pengajuan berhasil dibatalkan",
  "data": {
    "id": 1,
    "application_number": "APP-20261005-0001",
    "status": "cancelled",
    "cancelled_at": "2026-10-05T18:30:00Z"
  }
}

### 7.15 Approve Application

**PATCH** `/applications/{id}/approve`

Digunakan untuk menyetujui pengajuan sewa oleh petugas atau admin setelah pengajuan selesai diverifikasi.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Pengajuan berhasil disetujui",
  "data": {
    "id": 1,
    "application_number": "APP-20261005-0001",
    "status": "approved",
    "approved_at": "2026-10-05T19:00:00Z"
  }
}

### 7.16 Reject Application

**PATCH** `/applications/{id}/reject`

Digunakan untuk menolak pengajuan sewa oleh petugas atau admin setelah proses verifikasi.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Request Body Parameters:**

| Parameter | Tipe | Wajib | Keterangan |
|---|---|---|---|
| reason | string | Ya | Alasan penolakan pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Pengajuan berhasil ditolak",
  "data": {
    "id": 1,
    "application_number": "APP-20261005-0001",
    "status": "rejected",
    "rejection_reason": "Dokumen persyaratan tidak lengkap",
    "rejected_at": "2026-10-05T19:30:00Z"
  }
}

### 7.17 Cancel Application

**PATCH** `/applications/{id}/cancel`

Digunakan untuk membatalkan pengajuan sewa oleh pengguna sebelum pengajuan diproses lebih lanjut.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Pengajuan berhasil dibatalkan",
  "data": {
    "id": 1,
    "application_number": "APP-20261005-0001",
    "status": "cancelled",
    "cancelled_at": "2026-10-05T20:00:00Z"
  }
}

### 7.18 Get Application History

**GET** `/applications/{id}/history`

Digunakan untuk menampilkan riwayat perubahan status pengajuan sewa berdasarkan ID pengajuan.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Pengajuan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Riwayat pengajuan berhasil diambil",
  "data": [
    {
      "status": "submitted",
      "changed_at": "2026-10-05T17:15:00Z",
      "note": "Pengajuan berhasil dikirim"
    },
    {
      "status": "reviewed",
      "changed_at": "2026-10-06T09:00:00Z",
      "note": "Pengajuan sedang ditinjau"
    },
    {
      "status": "approved",
      "changed_at": "2026-10-05T19:00:00Z",
      "note": "Pengajuan disetujui"
    }
  ]
}

### 7.19 Create Review

**POST** `/rusunawa/{id}/reviews`

Digunakan untuk membuat ulasan dan memberikan rating terhadap Rusunawa.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Rusunawa |

**Request Body:**

```json
{
  "rating": 4.5,
  "comment": "Rusunawa cukup nyaman dan fasilitasnya baik."
}
**Request Body Parameters:**

| Parameter | Tipe | Wajib | Keterangan |
|---|---|---|---|
| rating | decimal | Ya | Nilai rating antara 1.0 sampai 5.0 |
| comment | string | Tidak | Komentar atau ulasan pengguna |

**Success Response – 201:**

```json
{
  "status": "success",
  "message": "Ulasan berhasil dibuat",
  "data": {
    "id": 1,
    "user_id": 1,
    "rusunawa_id": 1,
    "rating": 4.5,
    "comment": "Rusunawa cukup nyaman dan fasilitasnya baik.",
    "created_at": "2026-10-05T20:30:00Z"
  }
}

**Error Response:**

- **400** — Data ulasan tidak valid.
- **401** — Pengguna belum terautentikasi.
- **404** — Rusunawa tidak ditemukan.
- **409** — Pengguna sudah memberikan ulasan pada Rusunawa tersebut.
- **422** — Rating harus berada pada rentang 1.0 sampai 5.0.

---

### 7.20 Get Rusunawa Reviews

**GET** `/rusunawa/{id}/reviews`

Digunakan untuk menampilkan daftar ulasan pengguna terhadap suatu Rusunawa.

**Authentication:** Tidak diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Rusunawa |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Daftar ulasan berhasil diambil",
  "data": [
    {
      "id": 1,
      "user_id": 1,
      "rusunawa_id": 1,
      "rating": 4.5,
      "comment": "Rusunawa cukup nyaman dan fasilitasnya baik.",
      "created_at": "2026-10-05T20:30:00Z"
    },
    {
      "id": 2,
      "user_id": 2,
      "rusunawa_id": 1,
      "rating": 4.0,
      "comment": "Lokasi cukup strategis dan lingkungan bersih.",
      "created_at": "2026-10-06T09:00:00Z"
    }
  ]
}

**Error Response:**

- **404** — Rusunawa tidak ditemukan.
- **200** — Rusunawa ditemukan tetapi belum memiliki ulasan.

---

### 7.21 Get Review Detail

**GET** `/reviews/{id}`

Digunakan untuk menampilkan detail ulasan berdasarkan ID ulasan.

**Authentication:** Tidak diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Ulasan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Detail ulasan berhasil diambil",
  "data": {
    "id": 1,
    "user_id": 1,
    "rusunawa_id": 1,
    "rating": 4.5,
    "comment": "Rusunawa cukup nyaman dan fasilitasnya baik.",
    "created_at": "2026-10-05T20:30:00Z"
  }
}

### 7.22 Update Review

**PUT** `/reviews/{id}`

Digunakan untuk memperbarui ulasan yang telah dibuat oleh pengguna.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Ulasan |

**Request Body:**

```json
{
  "rating": 5.0,
  "comment": "Rusunawa sangat nyaman dan fasilitasnya lengkap."
}

### 7.23 Delete Review

**DELETE** `/reviews/{id}`

Digunakan untuk menghapus ulasan yang telah dibuat oleh pengguna.

**Authentication:** Diperlukan.

**Path Parameter:**

| Parameter | Tipe | Keterangan |
|---|---|---|
| id | integer | ID Ulasan |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Ulasan berhasil dihapus",
  "data": null
}

## 8. User Endpoints

### 8.1 Get My Profile

**GET** `/users/me`

Digunakan untuk menampilkan informasi profil pengguna yang sedang login.

**Authentication:** Diperlukan.

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Profil pengguna berhasil diambil",
  "data": {
    "id": 1,
    "name": "Budi Santoso",
    "email": "budi@email.com",
    "phone": "08123456789",
    "role": "resident"
  }
}

### 8.2 Update My Profile

**PUT** `/users/me`

Digunakan untuk memperbarui informasi profil pengguna yang sedang login.

**Authentication:** Diperlukan.

**Request Body:**

```json
{
  "name": "Budi Santoso",
  "phone": "081234567890"
}
**Request Body Parameters:**

| Parameter | Tipe | Wajib | Keterangan |
|---|---|---|---|
| name | string | Ya | Nama pengguna |
| phone | string | Tidak | Nomor telepon pengguna |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Profil pengguna berhasil diperbarui",
  "data": {
    "id": 1,
    "name": "Budi Santoso",
    "email": "budi@email.com",
    "phone": "081234567890",
    "role": "resident"
  }
}
**Error Response:**

- **400** — Data profil tidak valid.
- **401** — Pengguna belum terautentikasi.
- **404** — Data pengguna tidak ditemukan.
- **422** — Data yang diberikan tidak memenuhi ketentuan.

---
### 8.3 Change Password

**PATCH** `/users/me/password`

Digunakan untuk mengubah password pengguna yang sedang login.

**Authentication:** Diperlukan.

**Request Body:**

```json
{
  "current_password": "password123",
  "new_password": "password456"
}
**Request Body Parameters:**

| Parameter | Tipe | Wajib | Keterangan |
|---|---|---|---|
| current_password | string | Ya | Password pengguna saat ini |
| new_password | string | Ya | Password baru |

**Success Response – 200:**

```json
{
  "status": "success",
  "message": "Password berhasil diubah",
  "data": null
}
**Error Response:**

- **400** — Data password tidak valid.
- **401** — Pengguna belum terautentikasi atau password saat ini salah.
- **422** — Password baru tidak memenuhi ketentuan.

---

---

## 9. Role-Permission Matrix

Keterangan:

- **Public** = dapat diakses tanpa autentikasi.
- **Resident** = pengguna yang sudah login.
- **Admin** = pengguna dengan hak administrasi sistem.

| Endpoint | Method | Public | Resident | Admin |
|---|---|:---:|:---:|:---:|
| `/auth/register` | POST | ✓ | - | - |
| `/auth/login` | POST | ✓ | - | - |
| `/rusunawa` | GET | ✓ | ✓ | ✓ |
| `/rusunawa/{id}` | GET | ✓ | ✓ | ✓ |
| `/rusunawa/{id}/units` | GET | ✓ | ✓ | ✓ |
| `/units/{id}` | GET | ✓ | ✓ | ✓ |
| `/rusunawa/{id}/facilities` | GET | ✓ | ✓ | ✓ |
| `/facilities/{id}` | GET | ✓ | ✓ | ✓ |
| `/applications` | POST | - | ✓ | - |
| `/applications` | GET | - | ✓ | ✓ |
| `/applications/{id}` | GET | - | ✓ | ✓ |
| `/applications/{id}/cancel` | PATCH | - | ✓ | - |
| `/applications/{id}/documents` | POST | - | ✓ | - |
| `/applications/{id}/documents` | GET | - | ✓ | ✓ |
| `/application-documents/{id}` | GET | - | ✓ | ✓ |
| `/application-documents/{id}` | DELETE | - | ✓ | - |
| `/application-documents/{id}` | PUT | - | ✓ | - |
| `/applications/{id}/submit` | POST | - | ✓ | - |
| `/applications/{id}/status` | GET | - | ✓ | ✓ |
| `/applications/{id}/history` | GET | - | ✓ | ✓ |
| `/applications/{id}` | PUT | - | ✓ | - |
| `/applications/{id}` | DELETE | - | ✓ | - |
| `/applications/{id}/approve` | PATCH | - | - | ✓ |
| `/applications/{id}/reject` | PATCH | - | - | ✓ |
| `/rusunawa/{id}/reviews` | POST | - | ✓ | - |
| `/rusunawa/{id}/reviews` | GET | ✓ | ✓ | ✓ |
| `/reviews/{id}` | GET | ✓ | ✓ | ✓ |
| `/reviews/{id}` | PUT | - | ✓ | - |
| `/reviews/{id}` | DELETE | - | ✓ | - |
| `/users/me` | GET | - | ✓ | - |
| `/users/me` | PUT | - | ✓ | - |
| `/users/me/password` | PATCH | - | ✓ | - |

---

## 10. Changelog

| Version | Date | Changes |
|---|---|---|
| 1.0.0 | 2026-10-05 | Initial API Contract: authentication, Rusunawa, application, review, dan user endpoints. |
| 1.0.1 | 2026-10-05 | Penambahan role-permission matrix dan penyelarasan standard response serta error handling. |
