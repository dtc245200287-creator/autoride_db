CREATE DATABASE IF NOT EXISTS autoride_db;
USE autoride_db;

-- Bảng Cars
CREATE TABLE Cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    license_plate VARCHAR(20) UNIQUE NOT NULL
);

-- Bảng Rentals
CREATE TABLE Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT,
    customer_name VARCHAR(100) NOT NULL,
    rent_date DATETIME NOT NULL,
    return_date DATETIME,

    status ENUM('BOOKED', 'ACTIVE', 'COMPLETED', 'CANCELLED')
        DEFAULT 'BOOKED',

    security_deposit DECIMAL(10, 2) DEFAULT 0,
    late_fee DECIMAL(10, 2) DEFAULT 0,
    damage_fee DECIMAL(10, 2) DEFAULT 0,

    FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);

-- Bảng Inspections
CREATE TABLE Inspections (
    inspection_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT NOT NULL,
    inspection_date DATETIME NOT NULL,
    damage_description TEXT,
    inspector_name VARCHAR(100),

    FOREIGN KEY (rental_id)
        REFERENCES Rentals(rental_id)
        ON DELETE RESTRICT
);

-- Thêm xe
INSERT INTO Cars (model_name, license_plate)
VALUES ('Toyota Camry', '20A-12345');

-- Khách thuê xe, đóng cọc 10.000.000 VNĐ
INSERT INTO Rentals (
    car_id,
    customer_name,
    rent_date,
    status,
    security_deposit
)
VALUES (
    1,
    'Nguyen Van A',
    '2026-09-21 08:00:00',
    'ACTIVE',
    10000000
);

-- Khách trả xe, nhân viên kiểm tra phát hiện vỡ đèn pha
INSERT INTO Inspections (
    rental_id,
    inspection_date,
    damage_description,
    inspector_name
)
VALUES (
    1,
    '2026-09-23 08:00:00',
    'Vỡ đèn pha trái',
    'Tran Van B'
);

-- Hoàn tất hợp đồng, ghi nhận phí
UPDATE Rentals
SET
    status = 'COMPLETED',
    return_date = '2026-09-23 08:00:00',
    late_fee = 0,
    damage_fee = 2000000
WHERE rental_id = 1;

-- Tính số tiền thực tế hoàn lại
SELECT
    rental_id,
    customer_name,
    security_deposit,
    late_fee,
    damage_fee,
    (security_deposit - late_fee - damage_fee) AS refund_amount
FROM Rentals
WHERE rental_id = 1;