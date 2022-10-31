
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

class MyPasswordAuthenticator extends Authenticator {

    String user;
    String pw;

    public MyPasswordAuthenticator(String username, String password) {
        super();
        this.user = username;
        this.pw = password;
    }

    public PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(user, pw);
    }
}
