.class public Lnet/nyx/postest/core/BootReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BootReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/nyx/postest/core/BootReceiver$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/Context;)V
    .registers 3

    .line 6
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_17

    .line 7
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 8
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 9
    invoke-static {}, Lnet/nyx/postest/core/BootReceiver$a;->a()Lnet/nyx/postest/core/BootReceiver;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_17
    return-void
.end method

.method public static b(Landroid/content/Context;)V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_d

    .line 2
    invoke-static {}, Lnet/nyx/postest/core/BootReceiver$a;->a()Lnet/nyx/postest/core/BootReceiver;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_d
    return-void
.end method


# virtual methods
.method public final a()V
    .registers 9

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-static {v0}, Ld/a/b/g/f;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 2
    invoke-static {}, Ld/a/b/g/j;->a()Ld/a/b/g/j;

    move-result-object v0

    const-wide/16 v1, 0x0

    const-string v3, "checkUpt"

    invoke-virtual {v0, v3, v1, v2}, Ld/a/b/g/j;->a(Ljava/lang/String;J)J

    move-result-wide v0

    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v0, v4, v0

    const-wide/32 v6, 0x2932e00

    cmp-long v2, v0, v6

    if-lez v2, :cond_31

    .line 4
    invoke-static {}, Ld/a/b/a;->a()V

    .line 5
    invoke-static {}, Ld/a/b/g/j;->a()Ld/a/b/g/j;

    move-result-object v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Ld/a/b/g/j;->a(Ljava/lang/String;Ljava/lang/Long;)V

    :cond_31
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p1, p2, v0

    const-string v0, "CoreReceiver onReceive: %s"

    .line 2
    invoke-static {v0, p2}, Lf/a/a;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string p2, "android.intent.action.BOOT_COMPLETED"

    .line 3
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1b

    .line 4
    invoke-static {p1}, Lnet/nyx/postest/core/CoreService;->a(Ljava/lang/String;)V

    goto :goto_26

    :cond_1b
    const-string p2, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 5
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_26

    .line 6
    invoke-virtual {p0}, Lnet/nyx/postest/core/BootReceiver;->a()V

    :cond_26
    :goto_26
    return-void
.end method
