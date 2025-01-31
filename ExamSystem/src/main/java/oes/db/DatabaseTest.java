package oes.db;

public class DatabaseTest {
    public static void main(String[] args) {
        // Call the getOracleConnection method from the Provider class
        if (Provider.getOracleConnection() != null) {
            System.out.println("Database connected successfully!");
        } else {
            System.out.println("Failed to connect to the database.");
        }
    }
}
