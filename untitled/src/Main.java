import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
//        Scanner scanner = new Scanner(System.in);
//        System.out.println("Nhap tem:");
        String name = "Anh Quốc";
        boolean matches = name.matches("^[A-Z][a-z]*(\\s[A-Z][a-z]*)*$");
        System.out.println(matches);
    }
}