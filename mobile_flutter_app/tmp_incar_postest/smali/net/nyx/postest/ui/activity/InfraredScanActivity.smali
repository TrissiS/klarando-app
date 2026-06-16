.class public Lnet/nyx/postest/ui/activity/InfraredScanActivity;
.super Lnet/nyx/postest/ui/activity/BasePrinterActivity;
.source "InfraredScanActivity.java"


# static fields
.field public static final synthetic I:Le/a/a/a$a;

.field public static synthetic J:Ljava/lang/annotation/Annotation;


# instance fields
.field public D:Landroid/widget/TextView;

.field public E:Landroid/widget/TextView;

.field public F:Landroid/widget/Button;

.field public G:Ld/a/b/g/b;

.field public final H:Landroid/content/BroadcastReceiver;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    .line 1
    invoke-static {}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->U()V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lnet/nyx/postest/ui/activity/BasePrinterActivity;-><init>()V

    .line 2
    new-instance v0, Lnet/nyx/postest/ui/activity/InfraredScanActivity$a;

    invoke-direct {v0, p0}, Lnet/nyx/postest/ui/activity/InfraredScanActivity$a;-><init>(Lnet/nyx/postest/ui/activity/InfraredScanActivity;)V

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->H:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public static synthetic U()V
    .registers 9

    .line 1
    new-instance v8, Le/a/b/a/b;

    const-class v0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;

    const-string v1, "InfraredScanActivity.java"

    invoke-direct {v8, v1, v0}, Le/a/b/a/b;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v1, "1"

    const-string v2, "onClick"

    const-string v3, "net.nyx.postest.ui.activity.InfraredScanActivity"

    const-string v4, "android.view.View"

    const-string v5, "view"

    const-string v6, ""

    const-string v7, "void"

    move-object v0, v8

    invoke-virtual/range {v0 .. v7}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Le/a/a/e/c;

    move-result-object v0

    const-string v1, "method-execution"

    const/16 v2, 0x46

    invoke-virtual {v8, v1, v0, v2}, Le/a/b/a/b;->a(Ljava/lang/String;Le/a/a/d;I)Le/a/a/a$a;

    move-result-object v0

    sput-object v0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->I:Le/a/a/a$a;

    return-void
.end method

.method public static synthetic a(Lnet/nyx/postest/ui/activity/InfraredScanActivity;)Ld/a/b/g/b;
    .registers 1

    .line 1
    iget-object p0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->G:Ld/a/b/g/b;

    return-object p0
.end method

.method public static final synthetic a(Lnet/nyx/postest/ui/activity/InfraredScanActivity;Landroid/view/View;Le/a/a/a;)V
    .registers 3

    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const p2, 0x7f080067

    if-ne p1, p2, :cond_c

    .line 23
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->S()V

    :cond_c
    return-void
.end method

.method public static final synthetic a(Lnet/nyx/postest/ui/activity/InfraredScanActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V
    .registers 14

    .line 2
    invoke-interface {p4}, Le/a/a/a;->a()Le/a/a/d;

    move-result-object p2

    check-cast p2, Le/a/a/e/a;

    .line 3
    invoke-interface {p2}, Le/a/a/d;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 4
    invoke-interface {p2}, Le/a/a/d;->b()Ljava/lang/String;

    move-result-object p2

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "."

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, "("

    .line 6
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    invoke-interface {p4}, Le/a/a/a;->b()[Ljava/lang/Object;

    move-result-object p2

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 8
    :goto_36
    array-length v3, p2

    if-ge v2, v3, :cond_4c

    .line 9
    aget-object v3, p2, v2

    if-nez v2, :cond_41

    .line 10
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_49

    :cond_41
    const-string v4, ", "

    .line 11
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :goto_49
    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    :cond_4c
    const-string p2, ")"

    .line 13
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 16
    invoke-static {p3}, Ld/a/b/c/b;->b(Ld/a/b/c/b;)J

    move-result-wide v3

    sub-long v3, v1, v3

    invoke-interface {p5}, Ld/a/b/c/a;->value()J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-gez v7, :cond_8c

    invoke-static {p3}, Ld/a/b/c/b;->a(Ld/a/b/c/b;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8c

    const-string p0, "SingleClick"

    .line 17
    invoke-static {p0}, Lf/a/a;->a(Ljava/lang/String;)Lf/a/a$c;

    const/4 p0, 0x2

    new-array p0, p0, [Ljava/lang/Object;

    .line 18
    invoke-interface {p5}, Ld/a/b/c/a;->value()J

    move-result-wide p3

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    aput-object p1, p0, v0

    const/4 p1, 0x1

    aput-object p2, p0, p1

    const-string p1, "%s \u6beb\u79d2\u5185\u53d1\u751f\u5feb\u901f\u70b9\u51fb\uff1a%s"

    invoke-static {p1, p0}, Lf/a/a;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 19
    :cond_8c
    invoke-static {p3, v1, v2}, Ld/a/b/c/b;->a(Ld/a/b/c/b;J)V

    .line 20
    invoke-static {p3, p2}, Ld/a/b/c/b;->a(Ld/a/b/c/b;Ljava/lang/String;)V

    .line 21
    invoke-static {p0, p1, p4}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->a(Lnet/nyx/postest/ui/activity/InfraredScanActivity;Landroid/view/View;Le/a/a/a;)V

    return-void
.end method

.method public static synthetic b(Lnet/nyx/postest/ui/activity/InfraredScanActivity;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->O()V

    return-void
.end method


# virtual methods
.method public A()V
    .registers 5

    const v0, 0x7f0801f2

    .line 1
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->E:Landroid/widget/TextView;

    const v0, 0x7f080067

    .line 2
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->F:Landroid/widget/Button;

    const v1, 0x7f0801eb

    .line 3
    invoke-virtual {p0, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->D:Landroid/widget/TextView;

    .line 4
    invoke-static {}, Ld/a/b/g/k;->t()Z

    move-result v1

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-nez v1, :cond_3c

    invoke-static {}, Ld/a/b/g/k;->l()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_31

    goto :goto_3c

    .line 5
    :cond_31
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->E:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 6
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->F:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_53

    .line 7
    :cond_3c
    :goto_3c
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->E:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 8
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->F:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 9
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->F:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 v1, 0x1

    new-array v1, v1, [I

    aput v0, v1, v3

    .line 10
    invoke-interface {p0, v1}, Ld/a/a/g/e;->a([I)V

    .line 11
    :goto_53
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->R()V

    return-void
.end method

.method public C()I
    .registers 2

    const v0, 0x7f0f00f2

    return v0
.end method

.method public M()V
    .registers 2

    .line 1
    invoke-super {p0}, Lnet/nyx/postest/ui/activity/BasePrinterActivity;->M()V

    .line 2
    new-instance v0, Ld/a/b/f/a/c;

    invoke-direct {v0, p0}, Ld/a/b/f/a/c;-><init>(Lnet/nyx/postest/ui/activity/InfraredScanActivity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final O()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->F()V

    .line 2
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->F:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1c

    iget-object v0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->F:Landroid/widget/Button;

    invoke-virtual {v0}, Landroid/widget/Button;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 3
    invoke-interface {p0}, Ld/a/a/g/g;->h()V

    .line 4
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->F:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_1c
    return-void
.end method

.method public final P()Z
    .registers 7

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/BasePrinterActivity;->B:Ld/a/c/a/a;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_12

    .line 2
    :try_start_6
    invoke-interface {v0}, Ld/a/c/a/a;->e()I

    move-result v0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_a} :catch_e

    if-nez v0, :cond_d

    const/4 v1, 0x1

    :cond_d
    return v1

    :catch_e
    move-exception v0

    .line 3
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 4
    :cond_12
    invoke-static {}, Ld/a/b/g/k;->l()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1a

    const-string v0, "sys/devices/platform/printer/scan_trig"

    .line 5
    :cond_1a
    :try_start_1a
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1f} :catch_4a

    :try_start_1f
    const-string v0, "0"

    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 7
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->flush()V

    const-wide/16 v4, 0x12c

    .line 8
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    const-string v0, "1"

    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 10
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->flush()V
    :try_end_3c
    .catchall {:try_start_1f .. :try_end_3c} :catchall_40

    .line 11
    :try_start_3c
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_3f} :catch_4a

    return v2

    :catchall_40
    move-exception v0

    .line 12
    :try_start_41
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_44
    .catchall {:try_start_41 .. :try_end_44} :catchall_45

    goto :goto_49

    :catchall_45
    move-exception v3

    :try_start_46
    invoke-virtual {v0, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_49
    throw v0
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_4a} :catch_4a

    :catch_4a
    move-exception v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 14
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->D:Landroid/widget/TextView;

    const v4, 0x7f0f00f9

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v1

    invoke-virtual {p0, v4, v2}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return v1
.end method

.method public synthetic Q()V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->F:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method public final R()V
    .registers 3

    .line 1
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.android.NYX_QSC_DATA"

    .line 2
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 3
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->H:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public final S()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->K()V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->P()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 3
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->F:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 4
    new-instance v0, Ld/a/b/f/a/b0;

    invoke-direct {v0, p0}, Ld/a/b/f/a/b0;-><init>(Lnet/nyx/postest/ui/activity/InfraredScanActivity;)V

    const-wide/16 v1, 0x1b58

    invoke-interface {p0, v0, v1, v2}, Ld/a/a/g/g;->a(Ljava/lang/Runnable;J)Z

    goto :goto_1d

    .line 5
    :cond_1a
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->O()V

    :goto_1d
    return-void
.end method

.method public final T()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->H:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 10
    .annotation runtime Ld/a/b/c/a;
    .end annotation

    .line 1
    sget-object v0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->I:Le/a/a/a$a;

    invoke-static {v0, p0, p0, p1}, Le/a/b/a/b;->a(Le/a/a/a$a;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Le/a/a/a;

    move-result-object v3

    invoke-static {}, Ld/a/b/c/b;->b()Ld/a/b/c/b;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Le/a/a/c;

    sget-object v0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->J:Ljava/lang/annotation/Annotation;

    if-nez v0, :cond_29

    const-class v0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;

    const-string v1, "onClick"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/view/View;

    aput-object v7, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const-class v1, Ld/a/b/c/a;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    sput-object v0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->J:Ljava/lang/annotation/Annotation;

    :cond_29
    move-object v6, v0

    check-cast v6, Ld/a/b/c/a;

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v6}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->a(Lnet/nyx/postest/ui/activity/InfraredScanActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V

    return-void
.end method

.method public onDestroy()V
    .registers 2

    .line 1
    invoke-super {p0}, Lnet/nyx/postest/ui/activity/BasePrinterActivity;->onDestroy()V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->T()V

    .line 3
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->G:Ld/a/b/g/b;

    if-nez v0, :cond_b

    return-void

    .line 4
    :cond_b
    invoke-virtual {v0}, Ld/a/b/g/b;->close()V

    const/4 v0, 0x0

    throw v0
.end method

.method public onRightClick(Landroid/view/View;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->D:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public w()I
    .registers 2

    const v0, 0x7f0b001e

    return v0
.end method
