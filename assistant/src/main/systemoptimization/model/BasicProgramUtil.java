package main.systemoptimization.model;
import android.graphics.drawable.Drawable;

/**
 * 应用程序简要信息实体类
 * @author 陈思初
 *@ 用与存放单个应用程序信息
 */
public class BasicProgramUtil {
    /*
    * 定义应用程序的简要信息部分
    */
    private Drawable icon; // 程序图标
    private String programName; // 程序名称
    private String processName;
    private String menory; //内存
    private String cpu;
    private String programPackageName; //程序包名
    private boolean addWhite;//是否加入白名单
    private boolean isOsProgram; //是否为系统程序
    private int pid;
    private int uid;
    private int pro_cpu;
    private float pro_memory;
    public BasicProgramUtil() {
        icon = null;
        programName = "";
        processName = "";
        menory = "0";
        cpu = "0";
        programPackageName = "";
        addWhite = false;
        isOsProgram = false;
    }
    public Drawable getIcon() {
        return icon;
    }
    public void setIcon(Drawable icon) {
        this.icon = icon;
    }
    public String getProgramName() {
        return programName;
    }
    public void setProgramName(String programName) {
        this.programName = programName;
    }
    public String getProcessName() {
        return processName;
    }
    public void setProcessName(String processName) {
        this.processName = processName;
    }
    public String getMenory() {
        return menory;
    }
    public void setMenory(String menory) {
        //内存信息
        //		if(menory!=null&&!menory.equals("")){
        //			long size=Long.parseLong(menory);
        //			menory="k";
        //		     if (size >= 1024) { 
        //		    	 
        //		            size = size/1024; 
        //		            menory = "MB"; 
        //		        } 
        //		     menory=size+menory;
        //		}
        this.menory = menory;
    }
    public String getCpu() {
        try {
            cpu = cpu.trim();
            if (cpu == null || cpu.equals("") || cpu.equals("null")) {
                cpu = "0";
            }
        } catch (Throwable e) {
            cpu = "0";
        }
        return cpu;
    }
    public void setCpu(String cpu) {
        this.cpu = cpu;
    }
    public boolean isAddWhite() {
        return addWhite;
    }
    public void setAddWhite(boolean addWhite) {
        this.addWhite = addWhite;
    }
    public String getProgramPackageName() {
        return programPackageName;
    }
    public void setProgramPackageName(String programPackageName) {
        this.programPackageName = programPackageName;
    }
    public boolean isOsProgram() {
        return isOsProgram;
    }
    public void setOsProgram(boolean isOsProgram) {
        this.isOsProgram = isOsProgram;
    }
    public int getPid() {
        return pid;
    }
    public int getUid() {
        return uid;
    }
    public void setPid(int pid) {
        this.pid = pid;
    }
    public void setUid(int Uid) {
        uid = Uid;
    }
    public int getPro_cpu() {
        return pro_cpu;
    }
    public void setPro_cpu(int proCpu) {
        pro_cpu = proCpu;
    }
    public float getPro_memory() {
        return pro_memory;
    }
    public void setPro_memory(float proMemory) {
        pro_memory = proMemory;
    }
}
