# AI Prompt Log

## Prompt 1
Tại sao các cột tiền trong cơ sở dữ liệu nên sử dụng DECIMAL thay vì FLOAT?

## Kết quả
DECIMAL phù hợp với dữ liệu tài chính vì giúp lưu trữ giá trị số thập phân chính xác hơn và tránh sai số khi tính toán tiền.

## Prompt 2
Nên thiết kế bảng Inspections như thế nào để liên kết với Rentals?

## Kết quả
Bảng Inspections có inspection_id làm khóa chính và rental_id làm khóa ngoại tham chiếu đến Rentals. Bảng được tách riêng để lưu thông tin kiểm tra và mô tả hư hỏng.

## Prompt 3
Tại sao cần có damage_fee trong bảng Rentals?

## Kết quả
damage_fee dùng để lưu chi phí sửa chữa do hư hỏng xe. Giá trị này được sử dụng để tính số tiền hoàn lại cho khách.

## Prompt 4
Công thức tính tiền hoàn lại từ tiền cọc, phí trễ và phí hư hỏng là gì?

## Kết quả
Tiền hoàn lại = security_deposit - late_fee - damage_fee.
