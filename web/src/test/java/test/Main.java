package test;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import org.json.JSONObject;

public class Main {
    public static void main(String args[]) {
       String s="``````>111111";
       System.out.println(0x1D);
       testSearcher();
    }
    private static void testSearcher() {
        try {
            File file = new File("");
            String folder = file.getAbsoluteFile() + "/src/test/java/test/";
            String target = readFileByLines(folder + "target.html");
            String jsonString = readFileByLines(folder + "searcher.txt").trim();
            JSONObject obj = new JSONObject(jsonString);
            String searcher = obj.optString("match");
            System.out.println(target);
            System.out.println(searcher);
            System.out.println(TTest.parseVariable(target, searcher));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static String readFileByLines(String fileName) {
        File file = new File(fileName);
        BufferedReader reader = null;
        StringBuilder sb = new StringBuilder();
        try {
            reader = new BufferedReader(new FileReader(file));
            String line = null;
            while ((line = reader.readLine()) != null) {
                sb.append(line).append("\n");
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {}
            }
        }
        return sb.toString();
    }
}
