package com.demo.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.demo.models.ActivityBillModel;
import com.demo.models.ActivityMemberModel;
import com.demo.models.ActivityModel;
import com.demo.models.ActivityProgressModel;
import com.demo.models.ActivityVotesModel;
import com.demo.models.VoteItemModel;
import com.demo.models.VoteMemberModel;
import com.demo.models.VoteModel;
import com.demo.utils.Const;
import com.demo.utils.CrossOrigin;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.demo.utils.DatabaseUtil;
import com.demo.utils.Log;

@CrossOrigin
public class ActivityController  extends Controller {
	
	public static final String DB_TABLE = "activity";
	
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
	
	/**
	 * 根据user_id获取参与的所有投票
	 */
	@CrossOrigin
	public void getAllByPartake(){
		String user_id = getPara("user_id");
		List<ActivityModel> models = ActivityModel.dao.find("select a.* from "+DB_TABLE+" a, activity_member b where b.user_id = "+user_id+" and a.id = b.activity_id and a.del != 'delete' and b.del != 'delete'");
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
	public void addWithDetail(){
		JSONObject js = new JSONObject();
		try{
			ActivityModel model = getModel(ActivityModel.class, "", true);
			model.set(Const.KEY_DB_CREATE_TIME, System.currentTimeMillis()/1000+"");
			model.set(Const.KEY_DB_DEL, Const.OPTION_DB_NORMAL);
			System.out.println("model:"+model);
			model.save();
			int id = model.getInt("id");
			
			String selected_user_id = getPara("selected_user_id");
			selected_user_id = selected_user_id.replace("[", "").replace("]", "").replace("\"", "");
			String[] selected_user_id_array = selected_user_id.split(",");
			
			
			for(int j = 0;j<selected_user_id_array.length;j++){
				ActivityMemberModel memberModel = new ActivityMemberModel();
				memberModel.set("activity_id", id);
				memberModel.set("user_id", selected_user_id_array[j]);
				memberModel.set(Const.KEY_DB_CREATE_TIME, System.currentTimeMillis()/1000+"");
				memberModel.set(Const.KEY_DB_DEL, Const.OPTION_DB_NORMAL);
				memberModel.save();
			}
			
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
			renderJson(JsonKit.toJson(js));
		}catch(Exception e){
			js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_201);
			renderJson(JsonKit.toJson(js));
		}
	}
	
	@CrossOrigin
	public void getOtherDetail(){
		String activity_id = getPara("activity_id");
		List<ActivityVotesModel> votesModels = ActivityVotesModel.dao.find("select a.*,b.id as activity_vote_id from vote a,activity_votes b where b.activity_id = "+activity_id+" and a.id = b.vote_id and a.del != 'delete' and b.del != 'delete'");
		List<ActivityProgressModel> progressModels = ActivityProgressModel.dao.find("select * from activity_progress  where activity_id = "+activity_id+" and del != 'delete'");
		List<ActivityBillModel> billModels = ActivityBillModel.dao.find("select * from activity_bill where activity_id = "+activity_id+" and del != 'delete'");
		JSONObject js = new JSONObject();
		js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
		js.put("votes", votesModels);
		js.put("progress", progressModels);
		js.put("bill", billModels);
		System.out.println(JsonKit.toJson(js));
		renderJson(JsonKit.toJson(js));
	}
	
	@CrossOrigin
	public void addVotesForActivity(){
		String activity_id = getPara("activity_id");
		String vote_ids = getPara("vote_ids");
		vote_ids = vote_ids.replace("[", "");
		vote_ids = vote_ids.replace("]", "");
		vote_ids = vote_ids.replace("\"", "");
		
		String[] ids = vote_ids.split(",");
		
		for(int i =0;i<ids.length;i++){
			Log.i(ids[i]);
			
			ActivityVotesModel model = new ActivityVotesModel();
			model.set("activity_id", activity_id);
			model.set("vote_id", ids[i]);
			model.set(Const.KEY_DB_CREATE_TIME, System.currentTimeMillis()/1000+"");
			model.set(Const.KEY_DB_DEL, Const.OPTION_DB_NORMAL);
			model.save();
		}
		
		JSONObject js = new JSONObject();
		js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);

		System.out.println(JsonKit.toJson(js));
		renderJson(JsonKit.toJson(js));
	}
	
	@CrossOrigin
	public void deleteVotesForActivity(){
		String activity_id = getPara("activity_id");
		String vote_ids = getPara("vote_ids");
		vote_ids = vote_ids.replace("[", "");
		vote_ids = vote_ids.replace("]", "");
		vote_ids = vote_ids.replace("\"", "");
		
		String[] ids = vote_ids.split(",");
		
		for(int i =0;i<ids.length;i++){
			Log.i(ids[i]);
			
			ActivityVotesModel model = ActivityVotesModel.dao.findFirst("select * from activity_votes where id = "+ids[i]);
			model.set(Const.KEY_DB_DEL, Const.OPTION_DB_DELETE);
			model.update();
		}
		
		JSONObject js = new JSONObject();
		js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);

		System.out.println(JsonKit.toJson(js));
		renderJson(JsonKit.toJson(js));
	}
	
	@CrossOrigin
	public void addProgressForActivity(){
		ActivityProgressModel model = getModel(ActivityProgressModel.class, "", true);
		model.set(Const.KEY_DB_CREATE_TIME, System.currentTimeMillis()/1000+"");
		model.set(Const.KEY_DB_DEL, Const.OPTION_DB_NORMAL);
		model.save();
		
		JSONObject js = new JSONObject();
		js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
		System.out.println(JsonKit.toJson(js));
		renderJson(JsonKit.toJson(js));
	}
	
	@CrossOrigin
	public void deleteProgressForActivity(){
		String activity_id = getPara("activity_id");
		String progress_ids = getPara("progress_ids");
		progress_ids = progress_ids.replace("[", "");
		progress_ids = progress_ids.replace("]", "");
		progress_ids = progress_ids.replace("\"", "");
		
		String[] ids = progress_ids.split(",");
		
		for(int i =0;i<ids.length;i++){
			Log.i(ids[i]);
			
			ActivityProgressModel model = ActivityProgressModel.dao.findFirst("select * from activity_progress where id = "+ids[i]);
			model.set(Const.KEY_DB_DEL, Const.OPTION_DB_DELETE);
			model.update();
		}
		
		JSONObject js = new JSONObject();
		js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);

		System.out.println(JsonKit.toJson(js));
		renderJson(JsonKit.toJson(js));
	}
	
	@CrossOrigin
	public void addBillForActivity(){
		ActivityBillModel model = getModel(ActivityBillModel.class, "", true);
		model.set(Const.KEY_DB_CREATE_TIME, System.currentTimeMillis()/1000+"");
		model.set(Const.KEY_DB_DEL, Const.OPTION_DB_NORMAL);
		model.save();
		
		JSONObject js = new JSONObject();
		js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);
		System.out.println(JsonKit.toJson(js));
		renderJson(JsonKit.toJson(js));
	}
	
	@CrossOrigin
	public void deleteBillForActivity(){
		String activity_id = getPara("activity_id");
		String bill_ids = getPara("bill_ids");
		bill_ids = bill_ids.replace("[", "");
		bill_ids = bill_ids.replace("]", "");
		bill_ids = bill_ids.replace("\"", "");
		
		String[] ids = bill_ids.split(",");
		
		for(int i =0;i<ids.length;i++){
			Log.i(ids[i]);
			
			ActivityBillModel model = ActivityBillModel.dao.findFirst("select * from activity_bill where id = "+ids[i]);
			model.set(Const.KEY_DB_DEL, Const.OPTION_DB_DELETE);
			model.update();
		}
		
		JSONObject js = new JSONObject();
		js.put(Const.KEY_RES_CODE, Const.KEY_RES_CODE_200);

		System.out.println(JsonKit.toJson(js));
		renderJson(JsonKit.toJson(js));
	}
	
	@CrossOrigin
	public void getAllByCreator(){
		String creator = getPara("creator");
		List<ActivityModel> models = ActivityModel.dao.find("select * from "+DB_TABLE+" where creator = "+creator+" and del != 'delete'");
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
		List<ActivityModel> models = ActivityModel.dao.find("select * from "+DB_TABLE+" where del != 'delete'");
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
		List<ActivityModel> models = ActivityModel.dao.find("select * from "+DB_TABLE+" where id = "+id+" and  del != 'delete'");
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
			ActivityModel model = getModel(ActivityModel.class, "", true);
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
			ActivityModel model = getModel(ActivityModel.class, "", true);
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
			ActivityModel model = getModel(ActivityModel.class, "", true);
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
		List<ActivityModel> models = ActivityModel.dao.find("select * from "+DB_TABLE+" where "+map+" like '%"+key+"%' and del != 'delete'");
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
