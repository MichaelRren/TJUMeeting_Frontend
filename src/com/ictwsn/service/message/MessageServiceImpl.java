package com.ictwsn.service.message;

import org.springframework.stereotype.Service;

import java.util.List;
import cn.edu.tju.sms.webservice.*;
import org.apache.commons.codec.binary.*;

@Service
public class MessageServiceImpl implements MessageService{
    public String sendMessage(List<String> mobilePhones, String message){
//		Tju_Service service = new Tju_Service();
//		Tju serTju = service.getTju();
//		String content = message + SENDER;
//
//		try {
//			//submitSingle
//			String encodedStr = Base64.encodeBase64String((content).getBytes("utf-8"));
//			//System.out.println(encodedStr);
//			return serTju.submitSingle(USER_NAME, PASSWORD, mobilePhone, encodedStr, "0", null);
//		} catch (UnsupportedEncodingException ex) {
//			Logger.getLogger(SmsClient.class.getName()).log(Level.SEVERE, null, ex);
//			return "-2";
//		}
        return "0";
    }

    public String sendMessage(String mobilePhone, String message){

        String SENDER = "【天大办公平台】";

        Tju_Service service = new Tju_Service();
		Tju serTju = service.getTju();
		String content = message + SENDER;

		try {
			String encodedStr = Base64.encodeBase64String((content).getBytes("utf-8"));

			return serTju.submitSingle("tjujwc", "tjujwc20!*", mobilePhone, encodedStr, "0", null);
		} catch (Exception ex) {
//			Logger.getLogger(SmsClient.class.getName()).log(Level.SEVERE, null, ex);
			return "-2";
		}
    }
}
