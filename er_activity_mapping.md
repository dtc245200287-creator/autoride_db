# ERD và Activity Diagram Mapping

Activity Diagram của AutoRide yêu cầu hệ thống phải xử lý tiền cọc, phí phạt trễ và phí sửa chữa khi khách trả xe.

Trong cơ sở dữ liệu cũ, bảng Rentals không có các trường security_deposit, late_fee và damage_fee. Điều này khiến hệ thống không thể lưu trữ đầy đủ các khoản tiền phát sinh trong quá trình trả xe.

Đặc biệt, damage_fee là trường bắt buộc vì khi xe bị hư hỏng, hệ thống phải ghi nhận số tiền khách phải bồi thường. Nếu không có trường này, hệ thống không thể tính chính xác số tiền hoàn lại cho khách.

Công thức hoàn tiền là:

security_deposit - late_fee - damage_fee

Ngoài ra, bảng Inspections được tách riêng để lưu thông tin kiểm tra xe và mô tả chi tiết hư hỏng. Cách thiết kế này giúp dữ liệu kiểm tra xe được quản lý độc lập với thông tin hợp đồng thuê xe.
