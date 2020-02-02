package com.demo.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.demo.models.BaseUserModel;
import com.demo.models.ContactModel;
import com.demo.utils.Const;
import com.demo.utils.CrossOrigin;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.demo.utils.DatabaseUtil;

@CrossOrigin
public class ContactController  extends Controller {
	
	public static final String DB_TABLE = "contact";
	
	public static final Map<String,String> tableFilter = new HashMap();
	
	static{
		tableFilter.put("id","hidden");
		tableFilter.put("create_time","hidden");
		tableFilter.put("del","hidden");
	}
	
	public enum FilterType{
		hidden,//�����ֶ�
		custom,//�Զ���
		normal//Ĭ��
	}
	
	//添加用户通讯录
	@CrossOrigin
	public void addContact(){
		String key = getPara("key");
		String user_id = getPara("user_id");
		
		List<BaseUserModel> models = BaseUserModel.dao.find("select * from base_user where phone = "+key+" and del != 'delete'");
		JSONObject js = new JSONObject();
		if(models!=null&&models.size()==1){
			List<ContactModel> contactModels = ContactModel.dao.find("select * from "+DB_TABLE+" where owner_id = "+user_id+" and user_id = "+models.get(0).get("id")+" and  del != 'delete'");
			if(contactModels != null && contactModels.size() >= 1){
				js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
				js.put(Const.KEY_RES_MESSAGE,"已存在联系人");
				System.out.println(JsonKit.toJson(js));
				renderJson(JsonKit.toJson(js));
			}else{
				if(user_id.equals(models.get(0).get("id").toString())){
					js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
					js.put(Const.KEY_RES_MESSAGE,"不能添加自己为联系人");
					System.out.println(JsonKit.toJson(js));
					renderJson(JsonKit.toJson(js));
				}else{
					ContactModel contactModel = new ContactModel();
					contactModel.set("owner_id", user_id);
					contactModel.set("user_id", models.get(0).get("id"));
					contactModel.set(Const.KEY_DB_CREATE_TIME, System.currentTimeMillis()/1000+"");
					contactModel.set(Const.KEY_DB_DEL, Const.OPTION_DB_NORMAL);
					contactModel.save();
					js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
					System.out.println(JsonKit.toJson(js));
					renderJson(JsonKit.toJson(js));
				}
			}
		}else{
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
			js.put(Const.KEY_RES_MESSAGE,"找不到联系人");
			renderJson(js.toJSONString());
		}
		
	}
	
	//获取用户通讯录
	@CrossOrigin
	public void getAllByOwner(){
		String owner = getPara("owner");
		List<BaseUserModel> models = BaseUserModel.dao.find("select a.nickName,a.avatarUrl,a.id as user_id from base_user a,"+DB_TABLE+" b where a.id = b.user_id and b.owner_id = "+owner+" and a.del != 'delete' and b.del != 'delete'");
		JSONObject js = new JSONObject();
		if(models!=null&&models.size()>=1){
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
			js.put(Const.KEY_RES_DATA, models);
			System.out.println(JsonKit.toJson(js));
			renderJson(JsonKit.toJson(js));
		}else{
			System.out.println("model:");
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
			renderJson(js.toJSONString());
		}
	}
	
	//获取用户通讯录
	@CrossOrigin
	public void searchAllByOwner(){
		String owner = getPara("owner");
		String key = getPara("key");
		
		List<BaseUserModel> models = BaseUserModel.dao.find("select a.nickName,a.avatarUrl,a.id as user_id from base_user a,"+DB_TABLE+" b where a.id = b.user_id and b.owner_id = "+owner+" and a.username like '%"+key+"%' and a.del != 'delete' and b.del != 'delete'");
		JSONObject js = new JSONObject();
		if(models!=null&&models.size()>=1){
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
			js.put(Const.KEY_RES_DATA, models);
			System.out.println(JsonKit.toJson(js));
			renderJson(JsonKit.toJson(js));
		}else{
			System.out.println("model:");
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
			renderJson(js.toJSONString());
		}
	}
	
	@CrossOrigin
	public void getAll(){
		List<ContactModel> models = ContactModel.dao.find("select * from "+DB_TABLE+" where del != 'delete'");
		JSONObject js = new JSONObject();
		if(models!=null&&models.size()>=1){
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
			js.put(Const.KEY_RES_DATA, models);
			System.out.println(JsonKit.toJson(js));
			renderJson(JsonKit.toJson(js));
		}else{
			System.out.println("model:");
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
			renderJson(js.toJSONString());
		}
	}
	
	@CrossOrigin
	public void get(){
		String id = getPara("id");
		List<ContactModel> models = ContactModel.dao.find("select * from "+DB_TABLE+" where id = "+id+" and  del != 'delete'");
		JSONObject js = new JSONObject();
		if(models!=null&&models.size()>=1){
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
			js.put(Const.KEY_RES_DATA, models.get(0));
			System.out.println(JsonKit.toJson(js));
			renderJson(JsonKit.toJson(js));
		}else{
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
			renderJson(js.toJSONString());
		}
	}
	
	@CrossOrigin
	public void add(){
		JSONObject js = new JSONObject();
		try{
			ContactModel model = getModel(ContactModel.class, "", true);
			model.set(Const.KEY_DB_CREATE_TIME, System.currentTimeMillis()/1000+"");
			model.set(Const.KEY_DB_DEL, Const.OPTION_DB_NORMAL);
			System.out.println("model:"+model);
			model.save();
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
			renderJson(JsonKit.toJson(js));
		}catch(Exception e){
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
			renderJson(JsonKit.toJson(js));
		}
	}
	
	@CrossOrigin
	public void update(){
		JSONObject js = new JSONObject();
		try{
			ContactModel model = getModel(ContactModel.class, "", true);
			System.out.println("model:"+model);
			model.update();
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
			renderJson(JsonKit.toJson(js));
		}catch(Exception e){
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
			renderJson(JsonKit.toJson(js));
		}
	}
	
	@CrossOrigin
	public void delete(){
		JSONObject js = new JSONObject();
		try{
			ContactModel model = getModel(ContactModel.class, "", true);
			System.out.println("model:"+model);
			model.set(Const.KEY_DB_DEL, Const.OPTION_DB_DELETE);
			model.update();
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
			renderJson(JsonKit.toJson(js));
		}catch(Exception e){
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
			renderJson(JsonKit.toJson(js));
		}
	}

	
	
	@CrossOrigin
	public void getTableInfo(){
		JSONObject js = new JSONObject();
		try{
			List nameList = DatabaseUtil.getTableInfo(DB_TABLE,DatabaseUtil.TableInfoEnum._ColumnNames);
			List commentList = DatabaseUtil.getTableInfo(DB_TABLE,DatabaseUtil.TableInfoEnum._ColumnComments);
			List filterList = new ArrayList();
			for(int i=0;i<nameList.size();i++){
				String filterTypeName = tableFilter.get(nameList.get(i));
				if(filterTypeName == null || filterTypeName == ""){
					filterList.add(FilterType.normal);
				}else{
					filterList.add(filterTypeName);
				}	
			}
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
			js.put("column_name", nameList);
			js.put("column_filter", filterList);
			js.put("column_comment", commentList);
			renderJson(JsonKit.toJson(js));
		}catch(Exception e){
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
			renderJson(JsonKit.toJson(js));
		}
	}
	
	@CrossOrigin
	public void search(){
		String map = "";
		String key = getPara("key");
		List<ContactModel> models = ContactModel.dao.find("select * from "+DB_TABLE+" where "+map+" like '%"+key+"%' and del != 'delete'");
		JSONObject js = new JSONObject();
		if(models!=null && models.size()>=1){
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
			js.put(Const.KEY_RES_DATA, models);
			System.out.println(JsonKit.toJson(js));
			renderJson(JsonKit.toJson(js));
		}else{
			System.out.println("model:");
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201); 
			renderJson(js.toJSONString());
		}
	}
}
