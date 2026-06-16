.class public abstract Lnet/nyx/postest/ui/activity/BasePrinterActivity;
.super Lnet/nyx/postest/base/AppActivity;
.source "BasePrinterActivity.java"


# instance fields
.field public B:Ld/a/c/a/a;

.field public C:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lnet/nyx/postest/base/AppActivity;-><init>()V

    .line 2
    new-instance v0, Lnet/nyx/postest/ui/activity/BasePrinterActivity$a;

    invoke-direct {v0, p0}, Lnet/nyx/postest/ui/activity/BasePrinterActivity$a;-><init>(Lnet/nyx/postest/ui/activity/BasePrinterActivity;)V

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/BasePrinterActivity;->C:Landroid/content/ServiceConnection;

    return-void
.end method

.method public static synthetic a(Lnet/nyx/postest/ui/activity/BasePrinterActivity;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/BasePrinterActivity;->L()V

    return-void
.end method


# virtual methods
.method public final L()V
    .registers 4

    .line 1
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ld/a/b/a;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".printerservice"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ld/a/b/a;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".printerservice.IPrinterService"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/BasePrinterActivity;->C:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/app/Activity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method public M()V
    .registers 1

    return-void
.end method

.method public final N()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/BasePrinterActivity;->C:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->unbindService(Landroid/content/ServiceConnection;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Lnet/nyx/base/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/BasePrinterActivity;->L()V

    return-void
.end method

.method public onDestroy()V
    .registers 1

    .line 1
    invoke-super {p0}, Lnet/nyx/postest/base/AppActivity;->onDestroy()V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/BasePrinterActivity;->N()V

    return-void
.end method
