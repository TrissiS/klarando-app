.class public Lnet/nyx/postest/core/CoreService;
.super Landroid/app/Service;
.source "CoreService.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .registers 4

    .line 1
    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v1

    const-class v2, Lnet/nyx/postest/core/CoreService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    if-eqz p0, :cond_10

    .line 2
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 3
    :cond_10
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/app/Application;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    const/4 p1, 0x0

    return-object p1
.end method

.method public onDestroy()V
    .registers 3

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "scanner service stop"

    .line 1
    invoke-static {v1, v0}, Lf/a/a;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2
    invoke-static {p0}, Lnet/nyx/postest/core/BootReceiver;->b(Landroid/content/Context;)V

    .line 3
    invoke-static {p0}, Lnet/nyx/postest/core/PackageReceiver;->b(Landroid/content/Context;)V

    .line 4
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 5

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    .line 1
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x0

    aput-object p3, p2, v0

    const-string p3, "Service start action: %s"

    invoke-static {p3, p2}, Lf/a/a;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.intent.action.BOOT_COMPLETED"

    if-eqz p1, :cond_1f

    const-string p3, "android.intent.action.MAIN"

    .line 3
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_20

    :cond_1f
    move-object p1, p2

    .line 4
    :cond_20
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2c

    .line 5
    invoke-static {p0}, Lnet/nyx/postest/core/BootReceiver;->a(Landroid/content/Context;)V

    .line 6
    invoke-static {p0}, Lnet/nyx/postest/core/PackageReceiver;->a(Landroid/content/Context;)V

    :cond_2c
    const/4 p1, 0x3

    return p1
.end method
