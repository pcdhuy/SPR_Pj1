Project: Sales Performence Report 2009 - 2012

Mục tiêu chính: Luyện tập khả năng sử dụng SQLite và PowerBI dựa trên các task có sẵn và thêm mới.

Mục tiêu cụ thể: 
  1. Task SQL: luyện tập sử dụng các câu lệnh để truy xuất dữ liệu trên bộ data, một số task đơn giản và nâng cao
  2. Task PowerBI: làm quen với ứng dụng trực quan hóa dữ liệu PowerBI, kết hợp sử dụng DAX (Data Analysis Expressions) để thực hiện tính toán và phân tích dữ liệu trên bộ data Excel có sẵn (.csv) 

Chuẩn bị bộ data: Data đang là file đuôi Excel (.csv) chuyển đổi thành file (.db) để có thể truy xuất dữ liệu trong SQLite thông qua thư viện trên Python (sqlite3)
Bộ data: https://www.kaggle.com/datasets/dhawyfarrasputra/sales-performance-report-dqlab-store
Bộ data của tác giả gồm 5499 dòng và 1 cột (chưa xử lý - raw_data.csv) và bộ dữ liệu 5499 dòng và 10 cột (đã xử lý - clean_data.csv)

Task SQL: Tham khảo ở: https://medium.com/analytics-vidhya/project-data-analysis-for-retail-sales-performance-report-f974f9b0c315
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
     4.1. Các thẻ: Sử dụng measure để thay vì hiện (Blank) sẽ hiện 0 ở một số trường hợp, tính tổng số khách hàng, số khách hàng đặt hàng thành công/thất bại. Tính toán doanh thu dựa trên số khách hàng đặt hàng thành công.
     4.2. Các slicer: Sử dụng slicer để có thể filter cả trang customer theo danh mục sản phẩm chính và tháng/năm theo ý muốn.
  5. Trực quan trang Sub-product:
     5.1. Các thẻ: Sử dụng các thẻ từ cột Sales, Order, Discount để trực quan lại dữ liệu theo Sub-product
     5.2. Biểu đồ bánh donut: Sử dụng biểu đồ bánh donut để trực quan hóa tổng doanh thu với những khách hàng đặt hàng thành công
     5.3. Các slicer: Sử dụng Slicer kết hợp với Legend của biểu đồ để xem được tổng doanh thu, discount và số lượng đặt hàng của danh mục sản phẩm phụ.
  6. Trực quan trang Summary:
     6.1. Tổng quát hóa lại những đặc biệt trong 5 trang trực quan dữ liệu trên PowerBI. Dùng điều hướng trang (Page Navigation) để đưa đến từng trang trực quan theo mục.
  7. Trang trí cho báo cáo bằng một số nút (button) để điều hướng các trang qua lại với nhau. 
