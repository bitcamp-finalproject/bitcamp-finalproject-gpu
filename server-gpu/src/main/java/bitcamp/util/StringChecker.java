package bitcamp.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringChecker {
  public static boolean isValidPassword(String password) {
    String regex = "^(?=.*[a-z])(?=.*\\d)[A-Za-z\\d!@#$%^&*()_+~`|}{\\[\\]\\\\:';\"<>,./?-]{10,}$";
    Pattern pattern = Pattern.compile(regex);
    Matcher matcher = pattern.matcher(password);
    return matcher.matches();
  }

  public static boolean isValidNickname(String str) {
    boolean hasInvalidChar = str.matches(".+[^a-zA-Z0-9가-힣-_.].+");
    hasInvalidChar = str.length() == 0 ? false : true ;
    return !hasInvalidChar;
  }
}
