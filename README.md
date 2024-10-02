Project: Sales Performence Report 2009 - 2012

Mục tiêu chính: Luyện tập khả năng sử dụng SQLite và PowerBI dựa trên các task có sẵn và thêm mới.

Mục tiêu cụ thể

Chuẩn bị bộ data: Data đang là file đuôi Excel (.csv) chuyển đổi thành file (.db) để có thể truy xuất dữ liệu trong SQLite
Task SQL:
  1. Xuất ra 10 cột của bộ data bao gồm: order_id/order_status/customer/order_date/order_quantity/sales/discount/discount_value/product_category/product_sub_category
  2. Xuất ra các thông tin của từng cột và filter chúng theo một số thông tin cơ bản.
  3. Xuất ra doanh thu của 4 năm 2009 - 2012 và tổng số lần đặt hàng trong 4 năm đó.
  4. Xuất ra các loại danh mục sản phẩm phụ của từng năm từ 2009 đến 2012 và doanh thu của các danh mục theo từng năm.
  5. Xuất ra tỷ lệ đốt cháy (Burn Rate) của 4 năm.
  6. Xuất ra tỷ lệ đốt cháy của từng danh mục sản phẩm phụ qua 4 năm.
  7. Xuất ra tổng số khách hàng và các khách hàng thực hiện giao dịch thành công/thất bại
  8. Xuất ra tổng số khách hàng giao dịch thành công qua 4 năm.
  9. Xuất ra số khách hàng mới giao dịch trong 4 năm.

Bonus: Task PowerBI: Sử dụng các task của SQL có thể làm để trực quan hóa dữ liệu trong PowerBI
  1. Trực quan trang Sales:
     1.1. Các thẻ (card):Sử dụng cột Sales để tính tổng doanh thu, doanh thu đã được trừ bởi Discount và doanh thu đã bị hoàn trả mặt hàng để xuất ra doanh thu ròng.
     1.2. Các biểu đồ (Column chart & Donut chart): Sử dụng cột Sales tính tổng, trực quan hóa theo 12 tháng và 4 năm, được filter theo order_status và year có thể tương tác trên các Legend làm thay đổi số liệu các thẻ.
  2. Trực quan trang Discount: Tương tự như trang Sales.
  3. Trực quan trang Orders:
     3.1. Các thẻ: Sử dụng cột order_quantity để tách ra: tổng số lần đặt hàng và tổng số lượng đơn hàng.
     3.2. Các biểu đồ cột: Sử dụng biểu đồ cột để trực quan hóa theo danh mục sản phẩm chính theo số lần đặt hàng và số lượng đơn hàng trên mỗi lần đặt hàng và đặt hàng có thành công hay không. Có thể sử dụng Legend để filter các thẻ.
     3.3. Biểu đồ bánh donut: Sử dụng biểu đồ bánh donut để trực quan hóa tổng số lượng đơn hàng theo danh mục sản phẩm chính. Có thể sử dụng Legend để filter các thẻ.
  4. Trực quan trang Customer:
     4.1 Các thẻ: Sử dụng measure để thay vì hiện (Blank) sẽ hiện 0 ở một số trường hợp, tính tổng số khách hàng, số khách hàng đặt hàng thành công/thất bại. Tính toán doanh thu dựa trên số khách hàng đặt hàng thành công.
     4.2 Các slicer: Sử dụng slicer để có thể filter cả trang customer theo danh mục sản phẩm chính và số năm theo ý muốn.
  5. Trực quan trang Sub-product
        
