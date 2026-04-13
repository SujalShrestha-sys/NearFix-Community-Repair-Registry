package nearfix.nearfix.util;

import java.util.regex.Pattern;

public class Validation {

    public static boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        return email != null && Pattern.matches(emailRegex, email);
    }

    public static boolean isValidPhone(String phone) {
        return phone != null && phone.matches("[0-9]{10}");
    }

    public static boolean isValidPassword(String password) {
        String passwordRegex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$";
        return password != null && Pattern.matches(passwordRegex, password);
    }

    public static boolean isValidName(String name) {
        String nameRegex = "^[a-zA-Z\\s]+$";
        return name != null && Pattern.matches(nameRegex, name);
    }
}
