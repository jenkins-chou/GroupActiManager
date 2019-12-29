package com.demo.gen;

import java.io.BufferedWriter;


import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.DatabaseMetaData;
import com.mysql.jdbc.ResultSet;

import freemarker.template.Configuration;
import freemarker.template.Template;



public class GenerateCode {
	private static final String db_name = "group_acti_manager";
	private static final String TEMPLATE_CONTROLLER_PATH = "src/com/demo/gen";
	
    private static final String CONTROLLER_CLASS_PATH = "src/com/demo/controller";
    private static final String CONTROLLER_PACKAGE_PATH = "com.demo.controller";
    
    private static final String MODEL_CLASS_PATH = "src/com/demo/models";
    private static final String MODEL_PACKAGE_PATH = "com.demo.models";
    
	public static void main(String[] args){
		try {
			getAllTable();
			//getUpper("postgraduate_exam");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//System.out.println(getUpper("postgraduate_exam"));
	}
	public static void getAllTable() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/"+db_name+"?user=root&password=root");
		getTableNameByCon(conn);
	}
	public static void getTableNameByCon(Connection con) {
		try {
		DatabaseMetaData meta = (DatabaseMetaData) con.getMetaData();
		ResultSet rs = (ResultSet) meta.getTables(null, null, null,new String[] { "TABLE" });
		while (rs.next()) {
		//System.out.println("������" + rs.getString(3));
		//System.out.println("�������û�����" + rs.getString(2));
		
			if(rs.getString(3).equals("base_menu")||
					rs.getString(3).equals("base_user")||
					rs.getString(3).equals("base_user_type")||
					rs.getString(3).equals("base_state")||
					rs.getString(3).equals("base_message")){
				
			}else{
				//genURL(rs.getString(3));
			}
			genURL(rs.getString(3));
			//genController(rs.getString(3));
			//genURL(rs.getString(3));
			//genModel(rs.getString(3));
		}
		con.close();
		} catch (Exception e) {
		try {
		con.close();
		} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
		}
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}
	
	public static void genController(String tableName){
		// step1 ����freeMarker����ʵ��
        Configuration configuration = new Configuration();
        Writer out = null;
        try {
            // step2 ��ȡģ��·��
            configuration.setDirectoryForTemplateLoading(new File(TEMPLATE_CONTROLLER_PATH));
            // step3 ��������ģ��
            Map<String, Object> dataMap = new HashMap<String, Object>();
            String className = getUpper(tableName)+"Controller";
            dataMap.put("classPath", CONTROLLER_PACKAGE_PATH);
            dataMap.put("className", className);
            dataMap.put("tableName", tableName);
            dataMap.put("modelName", getUpper(tableName)+"Model");
            // step4 ����ģ���ļ�
            Template template = configuration.getTemplate("ControllerTemplate.ftl");
            // step5 ��������
            File docFile = new File(CONTROLLER_CLASS_PATH + "\\" + className+".java");
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(docFile)));
            // step6 ����ļ�
            template.process(dataMap, out);
            ;
            System.out.println("me.add(\""+tableName+"\","+className+".class);");
            //System.out.println("----------------->"+className+".java �ļ������ɹ� !");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != out) {
                    out.flush();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
	}
	
	public static void genModel(String tableName){
		// step1 ����freeMarker����ʵ��
        Configuration configuration = new Configuration();
        Writer out = null;
        try {
            // step2 ��ȡģ��·��
            configuration.setDirectoryForTemplateLoading(new File(TEMPLATE_CONTROLLER_PATH));
            // step3 ��������ģ��
            Map<String, Object> dataMap = new HashMap<String, Object>();
            String className = getUpper(tableName)+"Model";
            dataMap.put("classPath",MODEL_PACKAGE_PATH);
            dataMap.put("className", className);
            dataMap.put("tableName", tableName);
            // step4 ����ģ���ļ�
            Template template = configuration.getTemplate("ModelTemplate.ftl");
            // step5 ��������
            File docFile = new File(MODEL_CLASS_PATH + "\\" + className+".java");
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(docFile)));
            // step6 ����ļ�
            template.process(dataMap, out);
            ;

            System.out.println("arp.addMapping(\""+tableName+"\", "+className+".class);");
            //System.out.println("----------------->"+className+".java �ļ������ɹ� !");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != out) {
                    out.flush();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
	}
	
	public static void genURL(String name){
		String[] str = name.split("");
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<str.length;i++){
			//System.out.print(str[i]);
			String header = new String(str[i].charAt(0)+"");
			if(header.equals("_")){
				sb.append(header);
			}else{
				sb.append(header.toUpperCase());
			}
		}
		System.out.println("var URI_"+sb.toString()+" = \"/"+name+"\";");
	}
	
	public static String getUpper(String name){
		String[] str = name.split("_");
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<str.length;i++){
			//System.out.print(str[i]);
			String header = new String(str[i].charAt(0)+"");
			sb.append(header.toUpperCase());
			//System.out.print(header.toUpperCase());
			sb.append(str[i].substring(1, str[i].length()));
		}
		return sb.toString();
	}
}
