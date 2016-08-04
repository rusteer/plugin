.class public Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;
.super Landroid/widget/BaseAdapter;
.source "OfflineActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ParserError",
        "ParserError"
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/webuid/mmVideo/OfflineActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ListAdapter"
.end annotation


# instance fields
.field asyncTask:Lcom/webuid/mmVideo/Async;

.field private context:Landroid/content/Context;

.field map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/webuid/mmVideo/Async;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/webuid/mmVideo/OfflineActivity;


# direct methods
.method public constructor <init>(Lcom/webuid/mmVideo/OfflineActivity;Landroid/content/Context;)V
    .locals 1
    .parameter
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .line 316
    iput-object p1, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    .line 315
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 314
    iput-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->context:Landroid/content/Context;

    .line 393
    iput-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->asyncTask:Lcom/webuid/mmVideo/Async;

    .line 394
    iput-object v0, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->map:Ljava/util/Map;

    .line 317
    iput-object p2, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->context:Landroid/content/Context;

    .line 318
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 322
    sget-object v0, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .parameter "position"

    .prologue
    .line 329
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "id"

    .prologue
    .line 335
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .parameter "position"
    .parameter "convertView"
    .parameter "parent"

    .prologue
    .line 340
    if-nez p2, :cond_0

    .line 342
    iget-object v8, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->context:Landroid/content/Context;

    const v9, 0x7f03001d

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 344
    :cond_0
    const v8, 0x7f060030

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 345
    .local v6, txt_title:Landroid/widget/TextView;
    const v8, 0x7f060033

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 346
    .local v7, video_size:Landroid/widget/TextView;
    const v8, 0x7f060031

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ProgressBar;

    .line 347
    .local v5, pb_progressBar:Landroid/widget/ProgressBar;
    const v8, 0x7f060032

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 348
    .local v3, btn_start:Landroid/widget/Button;
    const v8, 0x7f060035

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 350
    .local v2, btn_pause:Landroid/widget/Button;
    const v8, 0x7f060036

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 351
    .local v1, btn_continue:Landroid/widget/Button;
    const v8, 0x7f060034

    invoke-virtual {p2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 353
    .local v0, btn_cancle:Landroid/widget/Button;
    sget-object v8, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v8, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    const-string v9, "id"

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 355
    .local v4, idval:Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 356
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 358
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 360
    invoke-virtual {v0, v4}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 361
    const-string v8, "getView-idval"

    invoke-static {v8, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    invoke-virtual {v5, v4}, Landroid/widget/ProgressBar;->setTag(Ljava/lang/Object;)V

    .line 366
    sget-object v8, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v8, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    const-string v9, "title"

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 367
    new-instance v9, Ljava/lang/StringBuilder;

    sget-object v8, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v8, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    const-string v10, "size"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "M"

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 368
    sget-object v8, Lcom/webuid/mmVideo/OfflineActivity;->dataList:Ljava/util/ArrayList;

    invoke-virtual {v8, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    const-string v9, "progress"

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v5, v8}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 371
    sget-object v8, Lcom/webuid/mmVideo/Async;->pbList:Ljava/util/Map;

    invoke-interface {v8, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    sget-object v8, Lcom/webuid/mmVideo/OfflineActivity;->btnListStart:Ljava/util/Dictionary;

    invoke-virtual {v8, v4, v3}, Ljava/util/Dictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$0()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 375
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$1()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 376
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$2()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 379
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$0()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/widget/Button;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 380
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$1()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/widget/Button;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 382
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$2()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/widget/Button;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 383
    sget-object v8, Lcom/webuid/mmVideo/Async;->pbList:Ljava/util/Map;

    invoke-interface {v8, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/widget/ProgressBar;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 386
    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 387
    invoke-virtual {v2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 389
    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 390
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 391
    return-object p2
.end method

.method public onClick(Landroid/view/View;)V
    .locals 14
    .parameter "v"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ParserError"
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    const/16 v12, 0x8

    .line 399
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v9

    packed-switch v9, :pswitch_data_0

    .line 509
    :goto_0
    :pswitch_0
    return-void

    .line 402
    :pswitch_1
    const/4 v6, 0x0

    .line 403
    .local v6, startTask:Lcom/webuid/mmVideo/Async;
    const/4 v3, 0x0

    .line 404
    .local v3, isHas:Z
    sget-object v9, Lcom/webuid/mmVideo/OfflineActivity;->asyncListTask:Ljava/util/Dictionary;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6           #startTask:Lcom/webuid/mmVideo/Async;
    check-cast v6, Lcom/webuid/mmVideo/Async;

    .restart local v6       #startTask:Lcom/webuid/mmVideo/Async;
    move-object v7, p1

    .line 405
    check-cast v7, Landroid/widget/Button;

    .line 406
    .local v7, tv:Landroid/widget/Button;
    invoke-virtual {v7}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v8

    .line 407
    .local v8, v_text:Ljava/lang/String;
    const-string v9, "v_text"

    invoke-static {v9, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    const-string v9, "\u6682\u505c"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 410
    if-eqz v6, :cond_1

    .line 411
    const-string v9, "task"

    const-string v10, "not null"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    invoke-virtual {v6}, Lcom/webuid/mmVideo/Async;->pause()V

    .line 414
    const-string v9, "\u7ee7\u7eed"

    invoke-virtual {v7, v9}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 427
    :cond_0
    :goto_1
    const/4 v2, 0x0

    .local v2, i:I
    :goto_2
    sget-object v9, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-lt v2, v9, :cond_3

    .line 436
    :goto_3
    const-string v9, "debug"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "add listTask.size:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v11, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 416
    .end local v2           #i:I
    :cond_1
    const-string v9, "task"

    const-string v10, "null"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 419
    :cond_2
    if-eqz v6, :cond_0

    .line 421
    invoke-virtual {v6}, Lcom/webuid/mmVideo/Async;->continued()V

    .line 422
    const-string v9, "\u6682\u505c"

    invoke-virtual {v7, v9}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 429
    .restart local v2       #i:I
    :cond_3
    sget-object v9, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6           #startTask:Lcom/webuid/mmVideo/Async;
    check-cast v6, Lcom/webuid/mmVideo/Async;

    .line 430
    .restart local v6       #startTask:Lcom/webuid/mmVideo/Async;
    if-eqz v6, :cond_4

    .line 432
    const/4 v3, 0x1

    .line 433
    goto :goto_3

    .line 427
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 439
    .end local v2           #i:I
    .end local v3           #isHas:Z
    .end local v6           #startTask:Lcom/webuid/mmVideo/Async;
    .end local v7           #tv:Landroid/widget/Button;
    .end local v8           #v_text:Ljava/lang/String;
    :pswitch_2
    const/4 v4, 0x0

    .line 441
    .local v4, pauseTask:Lcom/webuid/mmVideo/Async;
    const/4 v2, 0x0

    .restart local v2       #i:I
    :goto_4
    sget-object v9, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-lt v2, v9, :cond_5

    .line 460
    :goto_5
    const-string v9, "debug"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "pause listTask.size:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v11, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 443
    :cond_5
    sget-object v9, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4           #pauseTask:Lcom/webuid/mmVideo/Async;
    check-cast v4, Lcom/webuid/mmVideo/Async;

    .line 444
    .restart local v4       #pauseTask:Lcom/webuid/mmVideo/Async;
    if-eqz v4, :cond_6

    .line 446
    new-instance v9, Lcom/webuid/mmVideo/Async;

    iget-object v10, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    invoke-direct {v9, v10}, Lcom/webuid/mmVideo/Async;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->asyncTask:Lcom/webuid/mmVideo/Async;

    .line 448
    const-string v9, "debug"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "-------asyncTask.paused:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v11, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->asyncTask:Lcom/webuid/mmVideo/Async;

    invoke-virtual {v11}, Lcom/webuid/mmVideo/Async;->isPaused()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    invoke-virtual {v4}, Lcom/webuid/mmVideo/Async;->pause()V

    .line 452
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$0()Ljava/util/List;

    move-result-object v9

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/widget/Button;

    invoke-virtual {v9, v12}, Landroid/widget/Button;->setVisibility(I)V

    .line 453
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$1()Ljava/util/List;

    move-result-object v9

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/widget/Button;

    invoke-virtual {v9, v12}, Landroid/widget/Button;->setVisibility(I)V

    .line 455
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$2()Ljava/util/List;

    move-result-object v9

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/widget/Button;

    invoke-virtual {v9, v13}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_5

    .line 441
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_4

    .line 463
    .end local v2           #i:I
    .end local v4           #pauseTask:Lcom/webuid/mmVideo/Async;
    :pswitch_3
    const/4 v1, 0x0

    .line 465
    .local v1, continueTask:Lcom/webuid/mmVideo/Async;
    const/4 v2, 0x0

    .restart local v2       #i:I
    :goto_6
    sget-object v9, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-lt v2, v9, :cond_7

    .line 484
    :goto_7
    const-string v9, "debug"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "pause listTask.size:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v11, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 467
    :cond_7
    sget-object v9, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #continueTask:Lcom/webuid/mmVideo/Async;
    check-cast v1, Lcom/webuid/mmVideo/Async;

    .line 468
    .restart local v1       #continueTask:Lcom/webuid/mmVideo/Async;
    if-eqz v1, :cond_8

    .line 470
    new-instance v9, Lcom/webuid/mmVideo/Async;

    iget-object v10, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    invoke-direct {v9, v10}, Lcom/webuid/mmVideo/Async;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->asyncTask:Lcom/webuid/mmVideo/Async;

    .line 472
    const-string v9, "debug"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "-------asyncTask.paused:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v11, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->asyncTask:Lcom/webuid/mmVideo/Async;

    invoke-virtual {v11}, Lcom/webuid/mmVideo/Async;->isPaused()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 473
    invoke-virtual {v1}, Lcom/webuid/mmVideo/Async;->continued()V

    .line 476
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$0()Ljava/util/List;

    move-result-object v9

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/widget/Button;

    invoke-virtual {v9, v12}, Landroid/widget/Button;->setVisibility(I)V

    .line 477
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$1()Ljava/util/List;

    move-result-object v9

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/widget/Button;

    invoke-virtual {v9, v13}, Landroid/widget/Button;->setVisibility(I)V

    .line 479
    invoke-static {}, Lcom/webuid/mmVideo/OfflineActivity;->access$2()Ljava/util/List;

    move-result-object v9

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/widget/Button;

    invoke-virtual {v9, v12}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_7

    .line 465
    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_6

    .line 487
    .end local v1           #continueTask:Lcom/webuid/mmVideo/Async;
    .end local v2           #i:I
    :pswitch_4
    const/4 v0, 0x0

    .line 489
    .local v0, cancleTaskC:Lcom/webuid/mmVideo/Async;
    const/4 v2, 0x0

    .restart local v2       #i:I
    :goto_8
    sget-object v9, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-lt v2, v9, :cond_9

    .line 501
    :goto_9
    new-instance v5, Lcom/webuid/mmVideo/service/DownVideoService;

    iget-object v9, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    #calls: Lcom/webuid/mmVideo/OfflineActivity;->getHelper()Lcom/webuid/mmVideo/dao/DataHelper;
    invoke-static {v9}, Lcom/webuid/mmVideo/OfflineActivity;->access$3(Lcom/webuid/mmVideo/OfflineActivity;)Lcom/webuid/mmVideo/dao/DataHelper;

    move-result-object v9

    invoke-virtual {v9}, Lcom/webuid/mmVideo/dao/DataHelper;->getDownVideoDao()Lcom/j256/ormlite/dao/Dao;

    move-result-object v9

    invoke-direct {v5, v9}, Lcom/webuid/mmVideo/service/DownVideoService;-><init>(Lcom/j256/ormlite/dao/Dao;)V

    .line 503
    .local v5, pvService:Lcom/webuid/mmVideo/service/DownVideoService;
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v5, v9}, Lcom/webuid/mmVideo/service/DownVideoService;->remove(I)I

    .line 504
    iget-object v9, p0, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->this$0:Lcom/webuid/mmVideo/OfflineActivity;

    invoke-virtual {v9}, Lcom/webuid/mmVideo/OfflineActivity;->getDataList()V

    .line 505
    sget-object v9, Lcom/webuid/mmVideo/OfflineActivity;->adapter:Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;

    invoke-virtual {v9}, Lcom/webuid/mmVideo/OfflineActivity$ListAdapter;->notifyDataSetChanged()V

    .line 506
    const-string v9, "debug"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "remove listTask.size:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v11, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 491
    .end local v5           #pvService:Lcom/webuid/mmVideo/service/DownVideoService;
    :cond_9
    sget-object v9, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #cancleTaskC:Lcom/webuid/mmVideo/Async;
    check-cast v0, Lcom/webuid/mmVideo/Async;

    .line 492
    .restart local v0       #cancleTaskC:Lcom/webuid/mmVideo/Async;
    if-eqz v0, :cond_a

    .line 495
    invoke-virtual {v0, v13}, Lcom/webuid/mmVideo/Async;->cancel(Z)Z

    .line 496
    const-string v9, "debug"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "remove sucess?:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v11, Lcom/webuid/mmVideo/OfflineActivity;->listTask:Ljava/util/List;

    invoke-interface {v11, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 489
    :cond_a
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_8

    .line 399
    :pswitch_data_0
    .packed-switch 0x7f060032
        :pswitch_1
        :pswitch_0
        :pswitch_4
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
