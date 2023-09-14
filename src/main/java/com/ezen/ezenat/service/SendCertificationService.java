package com.ezen.ezenat.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class SendCertificationService {
	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
		String api_key = "NCSNMVVEBG73FZGS";								//본인의 API KEY
		String api_secret = "2FWY1NTWBLJZTI9CRDSOILFRDUBKCZAH";				//본인의 API SECRET
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber);										// 수신전화번호
		params.put("from", "01055021179");									// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "EZENAT 휴대폰 인증 메시지 : 인증번호는" + "["+cerNum+"]" + "입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

        try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
			
        } catch (CoolsmsException e) {
    		System.out.println(e.getMessage());
    		System.out.println(e.getCode());
        }

	}
}
