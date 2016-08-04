.class public Lcom/webuid/mmVideo/HomeActivity;
.super Landroid/app/TabActivity;
.source "HomeActivity.java"


# static fields
.field public static m_tabHost:Landroid/widget/TabHost;


# instance fields
.field private mDeviceID:Ljava/lang/String;

.field private mLayoutInflater:Landroid/view/LayoutInflater;

.field private mUpdateManager:Lcom/webuid/mmVideo/UpdateManager;

.field public mainHandler:Landroid/os/Handler;

.field private myApplication:Lcom/webuid/mmVideo/update/MyApplication;

.field private versionCode:I

.field private versionContent:Ljava/lang/String;

.field private versionName:Ljava/lang/String;

.field private versionSource:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Landroid/app/TabActivity;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/webuid/mmVideo/HomeActivity;->versionCode:I

    .line 157
    new-instance v0, Lcom/webuid/mmVideo/HomeActivity$1;

    invoke-direct {v0, p0}, Lcom/webuid/mmVideo/HomeActivity$1;-><init>(Lcom/webuid/mmVideo/HomeActivity;)V

    iput-object v0, p0, Lcom/webuid/mmVideo/HomeActivity;->mainHandler:Landroid/os/Handler;

    .line 47
    return-void
.end method

.method static synthetic access$0(Lcom/webuid/mmVideo/HomeActivity;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 56
    iget-object v0, p0, Lcom/webuid/mmVideo/HomeActivity;->mDeviceID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/webuid/mmVideo/HomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 240
    invoke-direct {p0}, Lcom/webuid/mmVideo/HomeActivity;->startUpdateService()V

    return-void
.end method

.method private getTabItemIntent(I)Landroid/content/Intent;
    .locals 2
    .parameter "index"

    .prologue
    .line 151
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Lcom/webuid/mmVideo/Tabdb$listValue;->mTabClassArray:[Ljava/lang/Class;

    aget-object v1, v1, p1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 153
    .local v0, intent:Landroid/content/Intent;
    return-object v0
.end method

.method private getTabItemView(I)Landroid/view/View;
    .locals 6
    .parameter "index"

    .prologue
    .line 134
    iget-object v3, p0, Lcom/webuid/mmVideo/HomeActivity;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v4, 0x7f030027

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 135
    .local v2, view:Landroid/view/View;
    const v3, 0x7f06005b

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 136
    .local v0, imageView:Landroid/widget/ImageView;
    if-eqz v0, :cond_0

    .line 138
    if-nez p1, :cond_1

    .line 139
    sget-object v3, Lcom/webuid/mmVideo/Tabdb$listValue;->mImageViewArraySel:[I

    aget v3, v3, p1

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 144
    :cond_0
    :goto_0
    const v3, 0x7f06005c

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 145
    .local v1, textView:Landroid/widget/TextView;
    sget-object v3, Lcom/webuid/mmVideo/Tabdb$listValue;->mTextviewArray:[Ljava/lang/String;

    aget-object v3, v3, p1

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    return-object v2

    .line 141
    .end local v1           #textView:Landroid/widget/TextView;
    :cond_1
    sget-object v3, Lcom/webuid/mmVideo/Tabdb$listValue;->mImageViewArray:[I

    aget v3, v3, p1

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method

.method private init()V
    .locals 5

    .prologue
    .line 100
    invoke-virtual {p0}, Lcom/webuid/mmVideo/HomeActivity;->getTabHost()Landroid/widget/TabHost;

    move-result-object v3

    sput-object v3, Lcom/webuid/mmVideo/HomeActivity;->m_tabHost:Landroid/widget/TabHost;

    .line 101
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    iput-object v3, p0, Lcom/webuid/mmVideo/HomeActivity;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 103
    sget-object v3, Lcom/webuid/mmVideo/Tabdb$listValue;->mTabClassArray:[Ljava/lang/Class;

    array-length v0, v3

    .line 104
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-lt v1, v0, :cond_0

    .line 113
    sget-object v3, Lcom/webuid/mmVideo/HomeActivity;->m_tabHost:Landroid/widget/TabHost;

    new-instance v4, Lcom/webuid/mmVideo/HomeActivity$3;

    invoke-direct {v4, p0}, Lcom/webuid/mmVideo/HomeActivity$3;-><init>(Lcom/webuid/mmVideo/HomeActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 130
    return-void

    .line 106
    :cond_0
    sget-object v3, Lcom/webuid/mmVideo/HomeActivity;->m_tabHost:Landroid/widget/TabHost;

    sget-object v4, Lcom/webuid/mmVideo/Tabdb$listValue;->mTextviewArray:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v3

    .line 107
    invoke-direct {p0, v1}, Lcom/webuid/mmVideo/HomeActivity;->getTabItemView(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TabHost$TabSpec;->setIndicator(Landroid/view/View;)Landroid/widget/TabHost$TabSpec;

    move-result-object v3

    .line 108
    invoke-direct {p0, v1}, Lcom/webuid/mmVideo/HomeActivity;->getTabItemIntent(I)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    .line 109
    .local v2, tabSpec:Landroid/widget/TabHost$TabSpec;
    sget-object v3, Lcom/webuid/mmVideo/HomeActivity;->m_tabHost:Landroid/widget/TabHost;

    invoke-virtual {v3, v2}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 110
    sget-object v3, Lcom/webuid/mmVideo/HomeActivity;->m_tabHost:Landroid/widget/TabHost;

    invoke-virtual {v3}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/widget/TabWidget;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f020069

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 104
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private startUpdateService()V
    .locals 4

    .prologue
    .line 242
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/webuid/mmVideo/update/MmUpdateService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 243
    .local v0, updateIntent:Landroid/content/Intent;
    const-string v1, "update"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "url:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/webuid/mmVideo/HomeActivity;->versionSource:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    const-string v1, "app_name"

    invoke-virtual {p0}, Lcom/webuid/mmVideo/HomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f090004

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 245
    const-string v1, "source"

    iget-object v2, p0, Lcom/webuid/mmVideo/HomeActivity;->versionSource:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 246
    invoke-virtual {p0, v0}, Lcom/webuid/mmVideo/HomeActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 247
    return-void
.end method


# virtual methods
.method public checkVersion()V
    .locals 9

    .prologue
    .line 173
    iget v6, p0, Lcom/webuid/mmVideo/HomeActivity;->versionCode:I

    if-lez v6, :cond_0

    .line 174
    const/4 v4, 0x1

    .line 175
    .local v4, versionCodeLocal:I
    const-string v5, "1.0"

    .line 177
    .local v5, versionNameLocal:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/webuid/mmVideo/HomeActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {p0}, Lcom/webuid/mmVideo/HomeActivity;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 178
    .local v2, info:Landroid/content/pm/PackageInfo;
    iget v4, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 179
    iget-object v5, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    .end local v2           #info:Landroid/content/pm/PackageInfo;
    :goto_0
    iget v6, p0, Lcom/webuid/mmVideo/HomeActivity;->versionCode:I

    if-ge v4, v6, :cond_0

    .line 190
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "\u5f53\u524d\u7248\u672c:"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ",\u68c0\u6d4b\u5230\u65b0\u7248\u672c:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/webuid/mmVideo/HomeActivity;->versionName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ",\u8bf7\u5c3d\u5feb\u66f4\u65b0"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 193
    .local v3, updateMsg:Ljava/lang/String;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 194
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    const-string v6, "\u8f6f\u4ef6\u66f4\u65b0"

    invoke-virtual {v0, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 195
    iget-object v6, p0, Lcom/webuid/mmVideo/HomeActivity;->versionContent:Ljava/lang/String;

    invoke-virtual {v0, v6}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 196
    const-string v6, "\u66f4\u65b0"

    new-instance v7, Lcom/webuid/mmVideo/HomeActivity$4;

    invoke-direct {v7, p0}, Lcom/webuid/mmVideo/HomeActivity$4;-><init>(Lcom/webuid/mmVideo/HomeActivity;)V

    invoke-virtual {v0, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 203
    const-string v6, "\u6682\u4e0d\u66f4\u65b0"

    new-instance v7, Lcom/webuid/mmVideo/HomeActivity$5;

    invoke-direct {v7, p0}, Lcom/webuid/mmVideo/HomeActivity$5;-><init>(Lcom/webuid/mmVideo/HomeActivity;)V

    invoke-virtual {v0, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 209
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/AlertDialog;->show()V

    .line 239
    .end local v0           #builder:Landroid/app/AlertDialog$Builder;
    .end local v3           #updateMsg:Ljava/lang/String;
    .end local v4           #versionCodeLocal:I
    .end local v5           #versionNameLocal:Ljava/lang/String;
    :cond_0
    return-void

    .line 180
    .restart local v4       #versionCodeLocal:I
    .restart local v5       #versionNameLocal:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 181
    .local v1, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public getDataSource2()V
    .locals 7

    .prologue
    .line 250
    new-instance v0, Lorg/xmlrpc/android/XMLRPCClient;

    const-string v5, "/index.php?s=/Service/Index"

    invoke-direct {v0, v5}, Lorg/xmlrpc/android/XMLRPCClient;-><init>(Ljava/lang/String;)V

    .line 252
    .local v0, client:Lorg/xmlrpc/android/XMLRPCClient;
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 253
    .local v3, regdata:Lorg/json/JSONObject;
    const-string v5, "device"

    iget-object v6, p0, Lcom/webuid/mmVideo/HomeActivity;->mDeviceID:Ljava/lang/String;

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 254
    const-string v5, "updateDevice"

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Lorg/xmlrpc/android/XMLRPCClient;->call(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 255
    .local v4, result:Ljava/lang/String;
    const-string v5, "result"

    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    if-eqz v4, :cond_0

    .line 257
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x4

    if-le v5, v6, :cond_0

    .line 258
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 259
    .local v1, dict:Lorg/json/JSONObject;
    const-string v5, "version_code"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/webuid/mmVideo/HomeActivity;->versionCode:I

    .line 260
    const-string v5, "version_name"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/webuid/mmVideo/HomeActivity;->versionName:Ljava/lang/String;

    .line 261
    const-string v5, "version_source"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/webuid/mmVideo/HomeActivity;->versionSource:Ljava/lang/String;

    .line 262
    const-string v5, "version_content"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/webuid/mmVideo/HomeActivity;->versionContent:Ljava/lang/String;
    :try_end_0
    .catch Lorg/xmlrpc/android/XMLRPCException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 271
    .end local v1           #dict:Lorg/json/JSONObject;
    .end local v3           #regdata:Lorg/json/JSONObject;
    .end local v4           #result:Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 267
    :catch_0
    move-exception v2

    .line 269
    .local v2, e:Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 265
    .end local v2           #e:Lorg/json/JSONException;
    :catch_1
    move-exception v5

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    .line 61
    invoke-super {p0, p1}, Landroid/app/TabActivity;->onCreate(Landroid/os/Bundle;)V

    .line 62
    const v3, 0x7f03001c

    invoke-virtual {p0, v3}, Lcom/webuid/mmVideo/HomeActivity;->setContentView(I)V

    .line 64
    invoke-direct {p0}, Lcom/webuid/mmVideo/HomeActivity;->init()V

    .line 66
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v3

    const-string v4, "device_token"

    invoke-virtual {v3, v4}, Lcom/webuid/mmVideo/BasicCache;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 67
    .local v1, duid:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 68
    iput-object v1, p0, Lcom/webuid/mmVideo/HomeActivity;->mDeviceID:Ljava/lang/String;

    .line 73
    :goto_0
    const-string v3, "mDeviceID home up"

    iget-object v4, p0, Lcom/webuid/mmVideo/HomeActivity;->mDeviceID:Ljava/lang/String;

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v3

    const-string v4, "device_token"

    iget-object v5, p0, Lcom/webuid/mmVideo/HomeActivity;->mDeviceID:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, p0}, Lcom/webuid/mmVideo/BasicCache;->setValue(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)V

    .line 75
    new-instance v0, Ljava/lang/Thread;

    new-instance v3, Lcom/webuid/mmVideo/HomeActivity$2;

    invoke-direct {v3, p0}, Lcom/webuid/mmVideo/HomeActivity$2;-><init>(Lcom/webuid/mmVideo/HomeActivity;)V

    invoke-direct {v0, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 95
    .local v0, background2:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 96
    return-void

    .line 70
    .end local v0           #background2:Ljava/lang/Thread;
    :cond_0
    new-instance v2, Lcom/webuid/mmVideo/DeviceUuidFactory;

    invoke-direct {v2, p0}, Lcom/webuid/mmVideo/DeviceUuidFactory;-><init>(Landroid/content/Context;)V

    .line 71
    .local v2, dviceU:Lcom/webuid/mmVideo/DeviceUuidFactory;
    invoke-static {}, Lcom/webuid/mmVideo/BasicCache;->getInstance()Lcom/webuid/mmVideo/BasicCache;

    move-result-object v3

    invoke-virtual {v2}, Lcom/webuid/mmVideo/DeviceUuidFactory;->getDeviceUuid()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/webuid/mmVideo/BasicCache;->getMD5Str(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/webuid/mmVideo/HomeActivity;->mDeviceID:Ljava/lang/String;

    goto :goto_0
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 282
    invoke-super {p0}, Landroid/app/TabActivity;->onPause()V

    .line 283
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 284
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 276
    invoke-super {p0}, Landroid/app/TabActivity;->onResume()V

    .line 277
    invoke-static {p0}, Lcom/umeng/analytics/MobclickAgent;->onResume(Landroid/content/Context;)V

    .line 278
    return-void
.end method
