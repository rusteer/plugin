package net.workspace.web.service;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import net.workspace.web.util.SimpleEncoder;
import org.apache.commons.io.FileUtils;

public class BuildServiceUtil {
    private static final String DEFAULT_PACKAGE = "net.workspace";
    public static String getRandomString(int length) {
        //String content = "abceghjklmnopqrstuvxyzABCEHKMXYZ";
        String content = "تسعتسعينسعين";
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(content.charAt(random.nextInt(content.length())));
        }
        return sb.toString();
    }
    public static void updateFileContent(String filePath, String oldString, String newString) throws IOException {
        File file = new File(filePath);
        FileUtils.write(file, FileUtils.readFileToString(file).replace(oldString, newString));
    }
    public static void main(String args[]) throws Exception {
        String baseFolder = "E:/workspace/plugin/code/plugin/20140722";
        File tempFolder = new File("E:/tmp/build/plugin-20140722");
        FileUtils.deleteDirectory(tempFolder);
        FileUtils.copyDirectory(new File(baseFolder), tempFolder);
        updateFileContent(tempFolder.getAbsolutePath() + "/.project", "plugin-20140722", "plugin-20140722-updated");
        String newPacakgeName = "com.tencent.mm.kk";
        update(tempFolder.getAbsolutePath(), newPacakgeName);
    }
    public static void update(String baseFolder, String newPackageName) throws Exception, IOException {
        replaceConstString(baseFolder);
        changePackage(baseFolder, newPackageName);
    }
    public static void replaceConstString(String baseFolder) throws IOException {
        int randomCode = 100 + new Random().nextInt(Integer.MAX_VALUE / 2);
        updateFileContent(baseFolder + "/src/net/workspace/util/SimpleEncoder.java", "228213", randomCode + "");
        SimpleEncoder.setCode(randomCode);
        doReplace(baseFolder + "/src");
    }
    final static String constStringPrefix = "/*const-replace-start*/\"";
    final static String constStringSuffix = "\"";
    private static void doReplace(String baseFolder) throws IOException {
        File[] files = new File(baseFolder).listFiles();
        if (files == null) return;
        for (File file : files) {
            if (file.isDirectory()) {
                doReplace(file.getAbsolutePath());
            } else {
                if (file.getAbsolutePath().endsWith(".java")) {
                    StringBuilder sb = new StringBuilder();
                    List<String> lines = FileUtils.readLines(file);
                    boolean update = false;
                    for (String line : lines) {
                        int index = line.indexOf(constStringPrefix);
                        if (index > 0) {
                            int lastIndex = line.indexOf(constStringSuffix, index + constStringPrefix.length());
                            if (lastIndex > 0) {
                                String s = line.substring(index + constStringPrefix.length(), lastIndex);
                                //System.out.println(line);
                                line = line.replace(constStringPrefix + s + constStringSuffix, SimpleEncoder.getBytesString(s));
                                //System.out.println(line);
                                update = true;
                            }
                        }
                        sb.append(line).append("\n");
                    }
                    if (update) {
                        FileUtils.write(file, sb.toString());
                        System.out.println(file + " updated");
                    }
                }
            }
        }
    }
    public static void changePackage(String baseFolder, String newPackageName) throws Exception, IOException {
        Map<String, String> classMap = getClassMap(baseFolder);
        batchUpdateFiles(classMap, baseFolder, newPackageName);
        changeFileName(classMap, baseFolder, newPackageName);
        moveFolder(baseFolder, newPackageName);
    }
    private static void moveFolder(String baseFolder, String newPackageName) throws IOException {
        File oldFile = new File(baseFolder + "/src/" + DEFAULT_PACKAGE.replace('.', '/'));
        File newFile = new File(baseFolder + "/src/" + newPackageName.replace('.', '/'));
        FileUtils.moveDirectory(oldFile, newFile);
        System.out.println(oldFile + " updated to " + newFile);
    }
    private static void changeFileName(Map<String, String> classMap, String baseFolder, String newPackageName) throws IOException {
        for (String key : classMap.keySet()) {
            File oldFile = new File(baseFolder + "/src/" + DEFAULT_PACKAGE.replace('.', '/') + "/" + key + ".java");
            FileUtils.write(oldFile, FileUtils.readFileToString(oldFile).replace(key, classMap.get(key)));
            File newFile = new File(baseFolder + "/src/" + DEFAULT_PACKAGE.replace('.', '/') + "/" + classMap.get(key) + ".java");
            FileUtils.moveFile(oldFile, newFile);
            System.out.println(oldFile + " updated to " + newFile);
        }
    }
    private static void batchUpdateFiles(Map<String, String> classMap, String baseFolder, String newPackageName) throws Exception {
        for (File file : new File(baseFolder).listFiles()) {
            String path = file.getAbsolutePath();
            if (file.isDirectory()) {
                batchUpdateFiles(classMap, path, newPackageName);
            } else {
                if (path.endsWith("java") || path.endsWith("xml") || path.endsWith("cfg") || path.endsWith("txt")) {
                    updateFile(classMap, file, newPackageName);
                }
            }
        }
    }
    private static void updateFile(Map<String, String> classMap, File file, String newPackageName) throws Exception {
        String content = FileUtils.readFileToString(file);
        boolean updated = false;
        for (String key : classMap.keySet()) {
            String className = DEFAULT_PACKAGE + "." + key;
            if (content.contains(className)) {
                String newClassName = newPackageName + "." + classMap.get(key);
                content = content.replace(className, newClassName);
                updated = true;
            }
        }
        if (content.contains(DEFAULT_PACKAGE)) {
            content = content.replace(DEFAULT_PACKAGE, newPackageName);
            updated = true;
        }
        if (updated) {
            FileUtils.write(file, content);
            System.out.println(file + " updated");
        }
    }
    private static Map<String, String> getClassMap(String projectPath) {
        List<String> exportedClasses = new ArrayList<String>();
        for (File file : new File(projectPath + "/src/net/workspace").listFiles()) {
            String name = file.getName();
            if (name.endsWith(".java")) {
                exportedClasses.add(name.substring(0, name.indexOf(".java")));
            }
        }
        List<String> list = new ArrayList<String>();
        while (list.size() < exportedClasses.size()) {
            String s = getRandomString(new Random().nextInt(110) + 10);
            if (!list.contains(s)) list.add(s);
        }
        Map<String, String> classMap = new HashMap<String, String>();
        for (int i = 0; i < exportedClasses.size(); i++) {
            classMap.put(exportedClasses.get(i), list.get(i));
        }
        return classMap;
    }
}
