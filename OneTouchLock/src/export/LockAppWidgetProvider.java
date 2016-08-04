package export;
import workspace.utils.CommonUtil;
import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.content.Intent;
import android.widget.RemoteViews;

public class LockAppWidgetProvider extends AppWidgetProvider {
    @Override
    public void onReceive(final Context context, final Intent intent) {
        if (intent.getAction().equals("lock")) {
            final Intent intent1 = new Intent(context, LockActivity.class);
            intent1.addFlags(0x10000000);
            context.startActivity(intent1);
        }
        super.onReceive(context, intent);
    }
    @Override
    public void onUpdate(final Context context, final AppWidgetManager appwidgetmanager, final int ai[]) {
        super.onUpdate(context, appwidgetmanager, ai);
        final RemoteViews remoteviews = new RemoteViews(context.getPackageName(), CommonUtil.getResourceId(context, "layout", "main_layout"));
        final Intent intent = new Intent(context, LockAppWidgetProvider.class);
        intent.setAction("lock");
        remoteviews.setOnClickPendingIntent(CommonUtil.getResourceId(context, "id", "lock"), PendingIntent.getBroadcast(context, 0, intent, 0));
        appwidgetmanager.updateAppWidget(ai, remoteviews);
    }
}
