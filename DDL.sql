CREATE TABLE CUSTOMER (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    Email VARCHAR2(100) UNIQUE
);

CREATE TABLE PRODUCT (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR2(100),
    Price NUMBER
);

CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);

ALTER TABLE PRODUCT ADD Category VARCHAR2(20);
ALTER TABLE ORDERS ADD OrderDate DATE DEFAULT SYSDATE;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class AddColumnsToTables {

    public static void main(String[] args) {
        String url = "jdbc:your_database_url";
        String user = "your_database_user";
        String password = "your_database_password";
        
        String addCategoryColumn = "ALTER TABLE PRODUCT ADD Category VARCHAR2(20)";
        String addOrderDateColumn = "ALTER TABLE ORDERS ADD OrderDate DATE DEFAULT SYSDATE";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement()) {
            
            // Add Category column to PRODUCT table
            stmt.executeUpdate(addCategoryColumn);
            System.out.println("Category column added to PRODUCT table.");

            // Add OrderDate column to ORDERS table
            stmt.executeUpdate(addOrderDateColumn);
            System.out.println("OrderDate column added to ORDERS table.");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}