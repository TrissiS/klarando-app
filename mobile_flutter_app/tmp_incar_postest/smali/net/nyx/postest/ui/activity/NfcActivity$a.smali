.class public Lnet/nyx/postest/ui/activity/NfcActivity$a;
.super Ljava/lang/Object;
.source "NfcActivity.java"

# interfaces
.implements Ld/a/b/f/b/f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/nyx/postest/ui/activity/NfcActivity;->L()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lnet/nyx/postest/ui/activity/NfcActivity;


# direct methods
.method public constructor <init>(Lnet/nyx/postest/ui/activity/NfcActivity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/postest/ui/activity/NfcActivity$a;->a:Lnet/nyx/postest/ui/activity/NfcActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ld/a/a/d;)V
    .registers 2

    .line 1
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/NfcActivity$a;->a:Lnet/nyx/postest/ui/activity/NfcActivity;

    invoke-virtual {p1}, Lnet/nyx/postest/base/AppActivity;->finish()V

    return-void
.end method

.method public b(Ld/a/a/d;)V
    .registers 3

    .line 1
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.settings.NFC_SETTINGS"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/NfcActivity$a;->a:Lnet/nyx/postest/ui/activity/NfcActivity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
