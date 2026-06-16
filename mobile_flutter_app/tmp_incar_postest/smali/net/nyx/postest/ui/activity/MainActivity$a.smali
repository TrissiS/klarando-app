.class public Lnet/nyx/postest/ui/activity/MainActivity$a;
.super Ld/a/b/b/a;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/nyx/postest/ui/activity/MainActivity;->A()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic k:Lnet/nyx/postest/ui/activity/MainActivity;


# direct methods
.method public constructor <init>(Lnet/nyx/postest/ui/activity/MainActivity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/postest/ui/activity/MainActivity$a;->k:Lnet/nyx/postest/ui/activity/MainActivity;

    invoke-direct {p0}, Ld/a/b/b/a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .registers 5

    .line 1
    invoke-static {}, Ld/a/b/g/k;->v()Z

    move-result p1

    if-nez p1, :cond_44

    invoke-static {}, Ld/a/b/g/k;->t()Z

    move-result p1

    if-eqz p1, :cond_d

    goto :goto_44

    .line 2
    :cond_d
    invoke-static {}, Ld/a/b/g/k;->u()Z

    move-result p1

    if-eqz p1, :cond_18

    const-string p1, "com.kte.testmode"

    const-string v0, "com.kte.testmode.AllTest"

    goto :goto_1c

    :cond_18
    const-string p1, "com.sprd.validationtools"

    const-string v0, "com.sprd.validationtools.ValidationToolsMainActivity"

    .line 3
    :goto_1c
    invoke-static {p1}, Ld/a/b/g/k;->c(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2a

    .line 4
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/MainActivity$a;->k:Lnet/nyx/postest/ui/activity/MainActivity;

    const-string v0, "\u672a\u5b89\u88c5\u5de5\u5382\u6d4b\u8bd5App"

    invoke-interface {p1, v0}, Ld/a/b/b/e;->a(Ljava/lang/CharSequence;)V

    return-void

    .line 5
    :cond_2a
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const/high16 v2, 0x10000000

    .line 6
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object v1

    new-instance v2, Landroid/content/ComponentName;

    invoke-direct {v2, p1, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object p1

    .line 8
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity$a;->k:Lnet/nyx/postest/ui/activity/MainActivity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 9
    :cond_44
    :goto_44
    new-instance p1, Landroid/content/Intent;

    const-string v0, "rk.intent.action.startDevicetest"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 10
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity$a;->k:Lnet/nyx/postest/ui/activity/MainActivity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
