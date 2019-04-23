package com.ictwsn.service.message;

import java.util.List;

public interface MessageService {
    public String sendMessage(List<String> mobilePhones, String message);//发送短信
    public String sendMessage(String mobilePhone, String userName);
}
