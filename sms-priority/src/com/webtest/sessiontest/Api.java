package com.webtest.sessiontest;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.StringTokenizer;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Process;
import android.preference.PreferenceManager;
import android.util.Log;
import android.widget.Toast;
import com.webtest.sessiontest2.R;

public final class Api {
    private static final class ScriptRunner extends Thread {
        public void destroy() {
            synchronized (this) {
                if (exec != null) exec.destroy();
                exec = null;
            }
        }
        public void run() {
            try {
                String s;
                file.createNewFile();
                s = file.getAbsolutePath();
                Runtime.getRuntime().exec((new StringBuilder("chmod 777 ")).append(s).toString()).waitFor();
                OutputStreamWriter outputstreamwriter = new OutputStreamWriter(new FileOutputStream(file));
                if ((new File("/system/bin/sh")).exists()) outputstreamwriter.write("#!/system/bin/sh\n");
                outputstreamwriter.write(script);
                if (!script.endsWith("\n")) outputstreamwriter.write("\n");
                outputstreamwriter.write("exit\n");
                outputstreamwriter.flush();
                outputstreamwriter.close();
                if (asroot) {
                    //L1_L1:
                    exec = Runtime.getRuntime().exec((new StringBuilder("su -c ")).append(s).toString());
                } else {
                    //L2_L2:
                    exec = Runtime.getRuntime().exec((new StringBuilder("sh ")).append(s).toString());
                    //goto _L7
                }
                //_L7:
                InputStreamReader inputstreamreader;
                char ac[];
                inputstreamreader = new InputStreamReader(exec.getInputStream());
                ac = new char[1024];
                //_L10:
                int i;
                while ((i = inputstreamreader.read(ac)) != -1) {
                    // _L4:
                    if (res != null) {
                        //L9_L9:
                        res.append(ac, 0, i);
                    }
                    //L10
                }
                //_L3:
                InputStreamReader inputstreamreader1 = new InputStreamReader(exec.getErrorStream());
                //_L12:
                int j;
                while ((j = inputstreamreader1.read(ac)) != -1) {
                    if (res != null) {
                        //L11_L11:
                        res.append(ac, 0, j);
                        // goto _L12
                    }
                    //L12
                }
                //_L5:
                if (exec != null) exitcode = exec.waitFor();
                destroy();
            } catch (Exception e) {
                if (res != null) res.append((new StringBuilder("\n")).append(e).toString());
                destroy();
            }
        }
        private final boolean asroot;
        private java.lang.Process exec;
        public int exitcode;
        private final File file;
        private final StringBuilder res;
        private final String script;
        public ScriptRunner(File file1, String s, StringBuilder stringbuilder, boolean flag) {
            exitcode = -1;
            file = file1;
            script = s;
            res = stringbuilder;
            asroot = flag;
        }
    }
    public Api() {}
    public static void alert(Context context, CharSequence charsequence) {
        if (context != null) (new android.app.AlertDialog.Builder(context)).setNeutralButton(0x104000a, null).setMessage(charsequence).show();
    }
    public static void alert(Context context, CharSequence charsequence, CharSequence charsequence1) {
        if (context != null) (new android.app.AlertDialog.Builder(context)).setTitle(charsequence).setNeutralButton(0x104000a, null).setMessage(charsequence1).show();
    }
    public static void applicationRemoved(Context context, int i) {
        android.content.SharedPreferences.Editor editor;
        String s;
        String s1;
        String s2;
        int j;
        boolean flag;
        SharedPreferences sharedpreferences = context.getSharedPreferences("DroidWallPrefs", 0);
        editor = sharedpreferences.edit();
        s = sharedpreferences.getString("AllowedUidsWifi", "");
        s1 = sharedpreferences.getString("AllowedUids3G", "");
        s2 = (new StringBuilder(String.valueOf(i))).toString();
        j = s.length();
        flag = false;
        if (j > 0) {
            //L1_L1:
            StringBuilder stringbuilder;
            StringTokenizer stringtokenizer;
            stringbuilder = new StringBuilder();
            stringtokenizer = new StringTokenizer(s, "|");
            //_L7:
            while (stringtokenizer.hasMoreTokens()) {
                String s3 = stringtokenizer.nextToken();
                if (s2.equals(s3)) {
                    Log.d("DroidWall", (new StringBuilder("Removing UID ")).append(s3).append(" from the wi-fi list (package removed)!").toString());
                    flag = true;
                } else {
                    if (stringbuilder.length() > 0) stringbuilder.append('|');
                    stringbuilder.append(s3);
                }
            }
            // _L3:
            if (flag) editor.putString("AllowedUidsWifi", stringbuilder.toString());
        }
        //L2
        //_L2:
        if (s1.length() > 0) {
            //L5_L5:
            StringBuilder stringbuilder1;
            StringTokenizer stringtokenizer1;
            stringbuilder1 = new StringBuilder();
            stringtokenizer1 = new StringTokenizer(s1, "|");
            //_L8:
            while (stringtokenizer1.hasMoreTokens()) {
                String s4 = stringtokenizer1.nextToken();
                if (s2.equals(s4)) {
                    Log.d("DroidWall", (new StringBuilder("Removing UID ")).append(s4).append(" from the 3G list (package removed)!").toString());
                    flag = true;
                } else {
                    if (stringbuilder1.length() > 0) stringbuilder1.append('|');
                    stringbuilder1.append(s4);
                }
            }
            if (flag) editor.putString("AllowedUids3G", stringbuilder1.toString());
        }
        //_L6:
        if (flag) {
            editor.commit();
            if (isEnabled(context)) applySavedIptablesRules(context, false);
        }
        return;
    }
    private static boolean applyIptablesRulesImpl(Context context, List<Integer> list, List<Integer> list1, boolean flag) {
        boolean flag4 = false;
        if (context != null) {
            String s2;
            boolean flag5;
            boolean flag6;
            assertBinaries(context, flag);
            String as[] = { "tiwlan+", "wlan+", "eth+" };
            String as1[] = { "rmnet+", "pdp+", "ppp+", "uwbr+", "wimax+", "vsnet+" };
            boolean flag1 = context.getSharedPreferences("DroidWallPrefs", 0).getString("BlockMode", "blacklist").equals("whitelist");
            boolean flag2;
            boolean flag3;
            StringBuilder stringbuilder;
            int i;
            int j;
            String s;
            int k;
            int l;
            String s1;
            Iterator<Integer> iterator;
            Integer integer;
            Iterator<Integer> iterator1;
            Integer integer1;
            StringBuilder stringbuilder1;
            int i1;
            String s3;
            int j1;
            int k1;
            if (flag1) flag2 = false;
            else flag2 = true;
            flag3 = context.getSharedPreferences("DroidWallPrefs", 0).getBoolean("LogEnabled", false);
            stringbuilder = new StringBuilder();
            stringbuilder.append(scriptHeader(context));
            stringbuilder
                    .append("$IPTABLES --version || exit 1\n# Create the droidwall chains if necessary\n$IPTABLES -L droidwall >/dev/null 2>/dev/null || $IPTABLES --new droidwall || exit 2\n$IPTABLES -L droidwall-3g >/dev/null 2>/dev/null || $IPTABLES --new droidwall-3g || exit 3\n$IPTABLES -L droidwall-wifi >/dev/null 2>/dev/null || $IPTABLES --new droidwall-wifi || exit 4\n$IPTABLES -L droidwall-reject >/dev/null 2>/dev/null || $IPTABLES --new droidwall-reject || exit 5\n# Add droidwall chain to OUTPUT chain if necessary\n$IPTABLES -L OUTPUT | $GREP -q droidwall || $IPTABLES -A OUTPUT -j droidwall || exit 6\n# Flush existing rules\n$IPTABLES -F droidwall || exit 7\n$IPTABLES -F droidwall-3g || exit 8\n$IPTABLES -F droidwall-wifi || exit 9\n$IPTABLES -F droidwall-reject || exit 10\n");
            if (flag3) stringbuilder
                    .append("# Create the log and reject rules (ignore errors on the LOG target just in case it is not available)\n$IPTABLES -A droidwall-reject -j LOG --log-prefix \"[DROIDWALL] \" --log-uid\n$IPTABLES -A droidwall-reject -j REJECT || exit 11\n");
            else stringbuilder.append("# Create the reject rule (log disabled)\n$IPTABLES -A droidwall-reject -j REJECT || exit 11\n");
            if (flag1 && flag3) {
                stringbuilder.append("# Allow DNS lookups on white-list for a better logging (ignore errors)\n");
                stringbuilder.append("$IPTABLES -A droidwall -p udp --dport 53 -j RETURN\n");
            }
            stringbuilder.append("# Main rules (per interface)\n");
            i = as1.length;
            j = 0;
            while (j < i) {
                s = as1[j];
                stringbuilder.append("$IPTABLES -A droidwall -o ").append(s).append(" -j droidwall-3g || exit\n");
                j++;
            }
            //_L3:
            k = as.length;
            l = 0;
            while (l < k) {
                s1 = as[l];
                stringbuilder.append("$IPTABLES -A droidwall -o ").append(s1).append(" -j droidwall-wifi || exit\n");
                l++;
            }
            //_L5:
            stringbuilder.append("# Filtering rules\n");
            if (flag1) {
                //L7_L7:
                s2 = "RETURN";
            } else {
                //L8_L8:
                s2 = "droidwall-reject";
            }
            //_L33:
            if (list1.indexOf(Integer.valueOf(-10)) < 0) {//goto _L10; else goto _L9
                flag5 = false;
            } else {
                //_L9:
                flag5 = true;
            }
            //_L34:
            if (list.indexOf(Integer.valueOf(-10)) < 0) {
                flag6 = false;
            } else {
                flag6 = true;
            }
            //_L35:
            if (flag1 && !flag6) {
                j1 = Process.getUidForName("dhcp");
                if (j1 != -1) {
                    stringbuilder.append("# dhcp user\n");
                    stringbuilder.append("$IPTABLES -A droidwall-wifi -m owner --uid-owner ").append(j1).append(" -j RETURN || exit\n");
                }
                k1 = Process.getUidForName("wifi");
                if (k1 != -1) {
                    stringbuilder.append("# wifi user\n");
                    stringbuilder.append("$IPTABLES -A droidwall-wifi -m owner --uid-owner ").append(k1).append(" -j RETURN || exit\n");
                }
            }
            if (flag5) {
                //L11_L11:
                if (flag2) stringbuilder.append("$IPTABLES -A droidwall-3g -j ").append(s2).append(" || exit\n");
            } else {
                //L12_L12:
                iterator = list1.iterator();
                while (iterator.hasNext()) {
                    integer = (Integer) iterator.next();
                    if (integer.intValue() >= 0) stringbuilder.append("$IPTABLES -A droidwall-3g -m owner --uid-owner ").append(integer).append(" -j ").append(s2).append(" || exit\n");
                }
            }
            //_L30:
            if (flag6) {
                //L13_L13:
                if (flag2) stringbuilder.append("$IPTABLES -A droidwall-wifi -j ").append(s2).append(" || exit\n");
            } else {
                //L14_L14:
                iterator1 = list.iterator();
                while (iterator1.hasNext()) {
                    integer1 = (Integer) iterator1.next();
                    if (integer1.intValue() >= 0) stringbuilder.append("$IPTABLES -A droidwall-wifi -m owner --uid-owner ").append(integer1).append(" -j ").append(s2).append(" || exit\n");
                }
                //  goto _L31
            }
            //_L31:
            if (flag1) {
                //L15_L15:
                if (!flag5) {
                    //L17_L17:
                    if (list1.indexOf(Integer.valueOf(-11)) < 0) {// goto _L20; else goto _L19
                        //L20_L20:
                        stringbuilder.append("$IPTABLES -A droidwall-3g -j droidwall-reject || exit\n");
                        // goto _L18
                    } else {
                        //L19_L19:
                        stringbuilder.append("# hack to allow kernel packets on white-list\n");
                        stringbuilder.append("$IPTABLES -A droidwall-3g -m owner --uid-owner 0:999999999 -j droidwall-reject || exit\n");
                    }
                }
                //L18_L18:
                if (!flag6) {
                    //L21_L21:
                    if (list.indexOf(Integer.valueOf(-11)) < 0) {//goto _L24; else goto _L23
                        //L24_L24:
                        stringbuilder.append("$IPTABLES -A droidwall-wifi -j droidwall-reject || exit\n");
                    } else {
                        //L23_L23:
                        stringbuilder.append("# hack to allow kernel packets on white-list\n");
                        stringbuilder.append("$IPTABLES -A droidwall-wifi -m owner --uid-owner 0:999999999 -j droidwall-reject || exit\n");
                    }
                }
            } else {
                //L16_L16:
                if (list1.indexOf(Integer.valueOf(-11)) >= 0) {
                    stringbuilder.append("# hack to BLOCK kernel packets on black-list\n");
                    stringbuilder.append("$IPTABLES -A droidwall-3g -m owner --uid-owner 0:999999999 -j RETURN || exit\n");
                    stringbuilder.append("$IPTABLES -A droidwall-3g -j droidwall-reject || exit\n");
                }
                if (list.indexOf(Integer.valueOf(-11)) >= 0) {
                    stringbuilder.append("# hack to BLOCK kernel packets on black-list\n");
                    stringbuilder.append("$IPTABLES -A droidwall-wifi -m owner --uid-owner 0:999999999 -j RETURN || exit\n");
                    stringbuilder.append("$IPTABLES -A droidwall-wifi -j droidwall-reject || exit\n");
                }
            }
            //_L22:
            stringbuilder1 = new StringBuilder();
            try {
                i1 = runScriptAsRoot(context, stringbuilder.toString(), stringbuilder1);
                if (!(!flag || i1 == 0)) {
                    //L25_L25:
                    s3 = stringbuilder1.toString();
                    Log.e("DroidWall", s3);
                    if (s3.indexOf("\nTry `iptables -h' or 'iptables --help' for more information.") != -1) s3 = s3.replace("\nTry `iptables -h' or 'iptables --help' for more information.", "");
                    alert(context, (new StringBuilder("Error applying iptables rules. Exit code: ")).append(i1).append("\n\n").append(s3.trim()).toString());
                    // _L27:
                    flag4 = false;
                } else {
                    //L26_L26:
                    flag4 = true;
                }
            } catch (Exception e) {
                if (flag) alert(context, (new StringBuilder("error refreshing iptables: ")).append(e).toString());
                flag4 = false;
            }
        }
        return flag4;
    }
    public static boolean applySavedIptablesRules(Context context, boolean flag) {
        boolean flag1 = false;
        if (context != null) {
            String s;
            String s1;
            LinkedList<Integer> linkedlist;
            SharedPreferences sharedpreferences = context.getSharedPreferences("DroidWallPrefs", 0);
            s = sharedpreferences.getString("AllowedUidsWifi", "");
            s1 = sharedpreferences.getString("AllowedUids3G", "");
            linkedlist = new LinkedList<Integer>();
            if (s.length() > 0) {
                StringTokenizer stringtokenizer = new StringTokenizer(s, "|");
                //_L9:
                while (stringtokenizer.hasMoreTokens()) {
                    String s2 = stringtokenizer.nextToken();
                    if (!s2.equals("")) try {
                        linkedlist.add(Integer.valueOf(Integer.parseInt(s2)));
                    } catch (Exception exception) {}
                }
            }
            //_L4:
            LinkedList<Integer> linkedlist1 = new LinkedList<Integer>();
            if (s1.length() > 0) {
                //L6_L6:
                StringTokenizer stringtokenizer1 = new StringTokenizer(s1, "|");
                //_L10:
                while (stringtokenizer1.hasMoreTokens()) {
                    String s3 = stringtokenizer1.nextToken();
                    if (!s3.equals("")) try {
                        linkedlist1.add(Integer.valueOf(Integer.parseInt(s3)));
                    } catch (Exception exception1) {}
                }
            }
            //_L7:
            flag1 = applyIptablesRulesImpl(context, linkedlist, linkedlist1, flag);
        }
        return flag1;
    }
    public static boolean assertBinaries(Context context, boolean flag) {
        boolean flag1 = true;
        try {
            File file = new File(context.getDir("bin", 0), "busybox_g1");
            boolean flag2 = file.exists();
            boolean flag3 = false;
            if (!flag2) {
                copyRawFile(context, R.raw.busybox_g1, file, "755");
                flag3 = true;
            }
            if (flag3) Toast.makeText(context, "err", Toast.LENGTH_LONG).show();
        } catch (Exception e) {
            if (flag) alert(context, (new StringBuilder("Error installing binary files: ")).append(e).toString());
            flag1 = false;
        }
        return flag1;
    }
    public static void clearAllAppTrafficData(Context context) {
        SharedPreferences sharedpreferences = PreferenceManager.getDefaultSharedPreferences(context);
        android.content.SharedPreferences.Editor editor = sharedpreferences.edit();
        int i = 1;
        do {
            if (i > 31) {
                editor.commit();
                return;
            }
            if (sharedpreferences.contains((new StringBuilder(String.valueOf(i))).append("AppTraffic").toString())) editor.remove((new StringBuilder(String.valueOf(i))).append("AppTraffic").toString());
            i++;
        } while (true);
    }
    public static boolean clearLog(Context context) {
        boolean flag = false;
        StringBuilder stringbuilder = new StringBuilder();
        try {
            if (runScriptAsRoot(context, "dmesg -c >/dev/null || exit\n", stringbuilder) == 0) {
                //L2_L2:
                flag = true;
            } else {
                //L1
                alert(context, stringbuilder);
            }
        } catch (IOException e) {
            e.printStackTrace();
            alert(context, (new StringBuilder("error: ")).append(e).toString());
        }
        return flag;
    }
    private static void copyRawFile(Context context, int i, File file, String s) throws IOException, InterruptedException {
        String s1 = file.getAbsolutePath();
        FileOutputStream fileoutputstream = new FileOutputStream(file);
        InputStream inputstream = context.getResources().openRawResource(i);
        byte abyte0[] = new byte[1024];
        do {
            int j = inputstream.read(abyte0);
            if (j <= 0) {
                fileoutputstream.close();
                inputstream.close();
                Runtime.getRuntime().exec((new StringBuilder("chmod ")).append(s).append(" ").append(s1).toString()).waitFor();
                return;
            }
            fileoutputstream.write(abyte0, 0, j);
        } while (true);
    }
    public static boolean hasRootAccess(Context context, boolean flag) {
        boolean flag1 = hasroot;
        if (!hasroot) {
            StringBuilder stringbuilder = new StringBuilder();
            try {
                if (runScriptAsRoot(context, "exit 0", stringbuilder) == 0) {
                    hasroot = true;
                    flag1 = true;
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return flag1;
    }
    public static boolean isEnabled(Context context) {
        boolean flag;
        if (context == null) flag = false;
        else flag = context.getSharedPreferences("DroidWallPrefs", 0).getBoolean("Enabled", false);
        return flag;
    }
    public static boolean purgeIptables(Context context, boolean flag) {
        StringBuilder stringbuilder = new StringBuilder();
        int i;
        try {
            assertBinaries(context, flag);
            i = runScriptAsRoot(context,
                    (new StringBuilder(String.valueOf(scriptHeader(context)))).append("$IPTABLES -F droidwall\n").append("$IPTABLES -F droidwall-reject\n").append("$IPTABLES -F droidwall-3g\n").append("$IPTABLES -F droidwall-wifi\n")
                            .toString(), stringbuilder);
            if (i == -1) {
                //L1_L1:
                if (flag) alert(context, (new StringBuilder("error purging iptables. exit code: ")).append(i).append("\n").append(stringbuilder).toString());
                return false;
            }
        } catch (Exception e) {
            if (flag) alert(context, (new StringBuilder("error purging iptables: ")).append(e).toString());
            return false;
        }
        return true;
    }
    public static String readInStream(FileInputStream fileinputstream) {
        String s;
        try {
            ByteArrayOutputStream bytearrayoutputstream = new ByteArrayOutputStream();
            byte abyte0[] = new byte[1024];
            do {
                int i = fileinputstream.read(abyte0);
                if (i == -1) {
                    bytearrayoutputstream.close();
                    fileinputstream.close();
                    s = bytearrayoutputstream.toString();
                    break;
                }
                bytearrayoutputstream.write(abyte0, 0, i);
            } while (true);
        } catch (IOException ioexception) {
            s = null;
        }
        return s;
    }
    public static int runScript(Context context, String s, StringBuilder stringbuilder) throws IOException {
        return runScript(context, s, stringbuilder, 40000L, false);
    }
    public static int runScript(Context context, String s, StringBuilder stringbuilder, long l, boolean flag) {
        ScriptRunner scriptrunner = new ScriptRunner(new File(context.getDir("bin", 0), "droidwall.sh"), s, stringbuilder, flag);
        try {
            scriptrunner.start();
            if (l <= 0L) {//goto _L2; else goto _L1
                scriptrunner.join();
            } else {
                scriptrunner.join(l);
            }
            if (scriptrunner.isAlive()) {
                scriptrunner.interrupt();
                scriptrunner.join(150L);
                scriptrunner.destroy();
                scriptrunner.join(50L);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return scriptrunner.exitcode;
    }
    public static int runScriptAsRoot(Context context, String s, StringBuilder stringbuilder) throws IOException {
        return runScriptAsRoot(context, s, stringbuilder, 40000L);
    }
    public static int runScriptAsRoot(Context context, String s, StringBuilder stringbuilder, long l) {
        return runScript(context, s, stringbuilder, l, true);
    }
    private static String scriptHeader(Context context) {
        String s = context.getDir("bin", 0).getAbsolutePath();
        String s1 = (new StringBuilder(String.valueOf(s))).append("/iptables_armv5").toString();
        return (new StringBuilder("IPTABLES=iptables\nBUSYBOX=busybox\nGREP=grep\nECHO=echo\n# Try to find busybox\nif ")).append(s).append("/busybox_g1 --help >/dev/null 2>/dev/null ; then\n").append("\tBUSYBOX=").append(s)
                .append("/busybox_g1\n").append("\tGREP=\"$BUSYBOX grep\"\n").append("\tECHO=\"$BUSYBOX echo\"\n").append("elif busybox --help >/dev/null 2>/dev/null ; then\n").append("\tBUSYBOX=busybox\n")
                .append("elif /system/xbin/busybox --help >/dev/null 2>/dev/null ; then\n").append("\tBUSYBOX=/system/xbin/busybox\n").append("elif /system/bin/busybox --help >/dev/null 2>/dev/null ; then\n")
                .append("\tBUSYBOX=/system/bin/busybox\n").append("fi\n").append("# Try to find grep\n").append("if ! $ECHO 1 | $GREP -q 1 >/dev/null 2>/dev/null ; then\n")
                .append("\tif $ECHO 1 | $BUSYBOX grep -q 1 >/dev/null 2>/dev/null ; then\n").append("\t\tGREP=\"$BUSYBOX grep\"\n").append("\tfi\n").append("\t# Grep is absolutely required\n")
                .append("\tif ! $ECHO 1 | $GREP -q 1 >/dev/null 2>/dev/null ; then\n").append("\t\t$ECHO The grep command is required. DroidWall will not work.\n").append("\t\texit 1\n").append("\tfi\n").append("fi\n")
                .append("# Try to find iptables\n").append("if ").append(s1).append(" --version >/dev/null 2>/dev/null ; then\n").append("\tIPTABLES=").append(s1).append("\n").append("fi\n").toString();
    }
    public static void setAppTrafficData(Context context, DroidApp droidapp, int i) throws JSONException {
        String s = PreferenceManager.getDefaultSharedPreferences(context).getString((new StringBuilder(String.valueOf(i))).append("AppTraffic").toString(), "");
        if (!s.equals("")) {
            JSONArray jsonarray = new JSONArray(s);
            int j = jsonarray.length();
            int k = 0;
            while (k < j) {
                JSONObject jsonobject = jsonarray.getJSONObject(k);
                if (droidapp.uid == jsonobject.optInt("uid")) {
                    droidapp.txByte = droidapp.txByte + jsonobject.optLong("txByte");
                    droidapp.rxByte = droidapp.rxByte + jsonobject.optLong("rxByte");
                    break;
                }
                k++;
            }
        }
    }
    public static void setEnabled(Context context, boolean flag) {
        if (context != null) {
            SharedPreferences sharedpreferences = context.getSharedPreferences("DroidWallPrefs", 0);
            if (sharedpreferences.getBoolean("Enabled", false) != flag) {
                android.content.SharedPreferences.Editor editor = sharedpreferences.edit();
                editor.putBoolean("Enabled", flag);
                if (!editor.commit()) {
                    alert(context, "Error writing to preferences");
                } else {
                    Intent intent = new Intent("com.googlecode.droidwall.intent.action.STATUS_CHANGED");
                    intent.putExtra("com.googlecode.droidwall.intent.extra.STATUS", flag);
                    context.sendBroadcast(intent);
                }
            }
        }
    }
    public static void showIptablesRules(Context context) {
        StringBuilder stringbuilder = new StringBuilder();
        try {
            runScriptAsRoot(context, (new StringBuilder(String.valueOf(scriptHeader(context)))).append("$ECHO $IPTABLES\n").append("$IPTABLES -L -v\n").toString(), stringbuilder);
            alert(context, stringbuilder);
        } catch (Exception e) {
            alert(context, (new StringBuilder("error: ")).append(e).toString());
        }
    }
    public static final int LAST_7_DAYS_TRAFFIC_DATA = 1;
    public static final String MODE_BLACKLIST = "blacklist";
    public static final String MODE_WHITELIST = "whitelist";
    public static final int MONTH_TRAFFIC_DATA = 2;
    public static final String PREFS_NAME = "DroidWallPrefs";
    public static final String PREF_3G_UIDS = "AllowedUids3G";
    public static final String PREF_ENABLED = "Enabled";
    public static final String PREF_LOGENABLED = "LogEnabled";
    public static final String PREF_MODE = "BlockMode";
    public static final String PREF_PASSWORD = "Password";
    public static final String PREF_WIFI_UIDS = "AllowedUidsWifi";
    public static final int SPECIAL_UID_ANY = -10;
    public static final int SPECIAL_UID_KERNEL = -11;
    public static final String STATUS_CHANGED_MSG = "com.googlecode.droidwall.intent.action.STATUS_CHANGED";
    public static final String STATUS_EXTRA = "com.googlecode.droidwall.intent.extra.STATUS";
    public static final int TODAY_TRAFFIC_DATA = 0;
    public static final String TOGGLE_REQUEST_MSG = "com.googlecode.droidwall.intent.action.TOGGLE_REQUEST";
    public static DroidApp applications[] = null;
    private static boolean hasroot = false;
}
