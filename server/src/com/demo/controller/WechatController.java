package com.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.demo.models.BaseUserModel;
import com.demo.utils.Const;
import com.demo.utils.CrossOrigin;
import com.jfinal.core.Controller;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.JsonKit;

public class WechatController extends Controller{
	private final static String appId = "wxa6ccd0b1e617fff6";
	private final static String secret = "4a8f704efdd6febdab027f346b71607f";
	
	public static final String DB_TABLE_USER = "base_user";
	
	@CrossOrigin
	public void getWechatOpenid(){
		String code = getPara("code");
		JSONObject params = new JSONObject();
        params.put("key", "ty");
 
        Map<String, String> headers = new HashMap<String, String>(16);
        headers.put("Content-Type", "application/json");
        String ret = HttpKit.get("https://api.weixin.qq.com/sns/jscode2session?appid="+appId+"&secret="+secret+"&js_code="+code+"&grant_type=authorization_code", null, 
                headers);
        System.out.println(ret);
        
        JSONObject js_wechat = JSONObject.parseObject(ret);
        
        if(js_wechat!=null && js_wechat.getString("openid") != null && !js_wechat.getString("openid").equals("")){
        	List<BaseUserModel> userModels = BaseUserModel.dao.find("select * from "+DB_TABLE_USER+" where openid = '"+js_wechat.getString("openid")+"' and del != 'delete'");
    		JSONObject js = new JSONObject();
    		if(userModels!=null&&userModels.size()>=1){
    			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
    			js.put(Const.KEY_RES_DATA, userModels.get(0));
    			renderJson(JsonKit.toJson(js));
    		}else{
    			BaseUserModel model = getModel(BaseUserModel.class, "", true);
    			model.set(Const.KEY_DB_CREATE_TIME, System.currentTimeMillis()/1000+"");
    			model.set("openid", js_wechat.getString("openid"));
    			model.set(Const.KEY_DB_DEL, Const.OPTION_DB_NORMAL);
    			System.out.println("model:"+model);
    			model.save();
    			List<BaseUserModel> userModelsResult = BaseUserModel.dao.find("select * from "+DB_TABLE_USER+" where openid = '"+js_wechat.getString("openid")+"' and del != 'delete'");
    			
    			if(userModelsResult !=null && userModelsResult.size()>0){
    				js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
        			js.put("data", userModelsResult.get(0));
        			renderJson(JsonKit.toJson(js));
    			}else{
    				js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
        			renderJson(JsonKit.toJson(js));
    			}
    			
    		}
        }else{
            JSONObject js = new JSONObject();
            js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
    		js.put(Const.KEY_RES_DATA, ret);
    		renderJson(JsonKit.toJson(js));
        }
        
        

	}

}
