.class public Lnet/nyx/postest/ui/activity/InfraredScanActivity$a;
.super Landroid/content/BroadcastReceiver;
.source "InfraredScanActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/nyx/postest/ui/activity/InfraredScanActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lnet/nyx/postest/ui/activity/InfraredScanActivity;


# direct methods
.method public constructor <init>(Lnet/nyx/postest/ui/activity/InfraredScanActivity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity$a;->a:Lnet/nyx/postest/ui/activity/InfraredScanActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.android.NYX_QSC_DATA"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2d

    .line 2
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity$a;->a:Lnet/nyx/postest/ui/activity/InfraredScanActivity;

    invoke-static {p1}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->a(Lnet/nyx/postest/ui/activity/InfraredScanActivity;)Ld/a/b/g/b;

    move-result-object p1

    if-nez p1, :cond_22

    const-string p1, "qsc"

    .line 3
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 4
    iget-object p2, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity$a;->a:Lnet/nyx/postest/ui/activity/InfraredScanActivity;

    iget-object p2, p2, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->D:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2d

    .line 5
    :cond_22
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity$a;->a:Lnet/nyx/postest/ui/activity/InfraredScanActivity;

    invoke-static {p1}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->a(Lnet/nyx/postest/ui/activity/InfraredScanActivity;)Ld/a/b/g/b;

    move-result-object p1

    invoke-virtual {p1}, Ld/a/b/g/b;->a()V

    const/4 p1, 0x0

    throw p1

    .line 6
    :cond_2d
    :goto_2d
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/InfraredScanActivity$a;->a:Lnet/nyx/postest/ui/activity/InfraredScanActivity;

    invoke-static {p1}, Lnet/nyx/postest/ui/activity/InfraredScanActivity;->b(Lnet/nyx/postest/ui/activity/InfraredScanActivity;)V

    return-void
.end method
