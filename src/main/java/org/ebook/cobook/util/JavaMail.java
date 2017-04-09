package org.ebook.cobook.util;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.util.StopWatch;

public class JavaMail {

	public static String sendMail(String receiverEmail, String receiverNickName) {

		StopWatch watch = new StopWatch();
		watch.start();
		System.out.println("메일실행");
		String authString = getRandomString();
		// 먼저 환경 정보를 설정해야 한다.
		// 메일 서버 주소를 IP 또는 도메인 명으로 지정한다.
		try {
			Properties props = System.getProperties();
			// props.setProperty("smtp.gmail.com", "587");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			props.put("mail.transport.protocol", "smtp");

			// 위 환경 정보로 "메일 세션"을 만들고 빈 메시지를 만든다
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("aby41970826@gmail.com", "qksdiqkfkalf#113");// Specify
				}
			});
			MimeMessage msg = new MimeMessage(session);

			// 발신자, 수신자, 참조자, 제목, 본문 내용 등을 설정한다
			msg.setFrom(new InternetAddress("aby41970826@gmail.com", "cobook운영자"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmail, receiverNickName));
			msg.setSubject("이메일 인증 안내");
			msg.setContent("인증번호 : " + authString, "text/html; charset=utf-8");
			// 메일을 발신한다
			Transport.send(msg);
			watch.stop();
			System.out.println(watch.getTotalTimeSeconds());
		} catch (Exception e) {
			// 적절히 처리
			System.out.println(e.getMessage());
		}
		
		return authString;
	}

	public static String getRandomString(){
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for(int i = 0; i < 20; i++){
			int rIndex = rnd.nextInt(3);
			switch(rIndex){
			case 0:
				temp.append((char)((int)(rnd.nextInt(26)) + 97));
				break;
			case 1:
				temp.append((char)((int)(rnd.nextInt(26)) + 65));
				break;
			case 2:
				temp.append((rnd.nextInt(10)));
				break;
			}

	}


		System.out.println(temp);
		String authString = temp.toString();
		return authString;
		
	}

}