.class public Lnet/nyx/postest/ui/activity/NfcActivity;
.super Lnet/nyx/postest/base/AppActivity;
.source "NfcActivity.java"


# instance fields
.field public B:Lnet/nyx/widget/layout/SettingBar;

.field public C:Landroid/nfc/NfcAdapter;

.field public D:Landroid/app/PendingIntent;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lnet/nyx/postest/base/AppActivity;-><init>()V

    return-void
.end method

.method public static a([B)Ljava/lang/String;
    .registers 7

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    .line 1
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2
    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_c
    if-ge v3, v1, :cond_27

    aget-byte v4, p0, v3

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    and-int/lit16 v4, v4, 0xff

    .line 3
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v5, v2

    const-string v4, "%02x"

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 4
    :cond_27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A()V
    .registers 4

    const v0, 0x7f080170

    .line 1
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/NfcActivity;->B:Lnet/nyx/widget/layout/SettingBar;

    .line 2
    invoke-static {p0}, Landroid/nfc/NfcAdapter;->getDefaultAdapter(Landroid/content/Context;)Landroid/nfc/NfcAdapter;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/NfcActivity;->C:Landroid/nfc/NfcAdapter;

    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x1f

    if-lt v0, v2, :cond_28

    .line 4
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lnet/nyx/postest/ui/activity/NfcActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x2000000

    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/NfcActivity;->D:Landroid/app/PendingIntent;

    goto :goto_35

    .line 5
    :cond_28
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lnet/nyx/postest/ui/activity/NfcActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {p0, v1, v0, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/NfcActivity;->D:Landroid/app/PendingIntent;

    :goto_35
    return-void
.end method

.method public final L()V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/NfcActivity;->C:Landroid/nfc/NfcAdapter;

    if-nez v0, :cond_b

    const v0, 0x7f0f00a8

    .line 2
    invoke-interface {p0, v0}, Ld/a/b/b/e;->a(I)V

    return-void

    .line 3
    :cond_b
    invoke-virtual {v0}, Landroid/nfc/NfcAdapter;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_49

    .line 4
    new-instance v0, Ld/a/b/f/b/e;

    invoke-interface {p0}, Ld/a/a/g/b;->f()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Ld/a/b/f/b/e;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0f00a7

    .line 5
    invoke-virtual {v0, v1}, Ld/a/b/f/b/a;->j(I)Ld/a/b/f/b/a;

    check-cast v0, Ld/a/b/f/b/e;

    const v1, 0x7f0f00a9

    .line 6
    invoke-virtual {v0, v1}, Ld/a/b/f/b/e;->k(I)Ld/a/b/f/b/e;

    const v1, 0x7f0f002a

    .line 7
    invoke-virtual {v0, v1}, Ld/a/b/f/b/a;->h(I)Ld/a/b/f/b/a;

    check-cast v0, Ld/a/b/f/b/e;

    const v1, 0x7f0f0028

    .line 8
    invoke-virtual {v0, v1}, Ld/a/b/f/b/a;->g(I)Ld/a/b/f/b/a;

    check-cast v0, Ld/a/b/f/b/e;

    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Ld/a/a/d$b;->c(Z)Ld/a/a/d$b;

    check-cast v0, Ld/a/b/f/b/e;

    new-instance v1, Lnet/nyx/postest/ui/activity/NfcActivity$a;

    invoke-direct {v1, p0}, Lnet/nyx/postest/ui/activity/NfcActivity$a;-><init>(Lnet/nyx/postest/ui/activity/NfcActivity;)V

    .line 10
    invoke-virtual {v0, v1}, Ld/a/b/f/b/e;->a(Ld/a/b/f/b/f;)Ld/a/b/f/b/e;

    .line 11
    invoke-virtual {v0}, Ld/a/a/d$b;->h()V

    :cond_49
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .registers 5

    .line 1
    invoke-super {p0, p1}, Lnet/nyx/base/BaseActivity;->onNewIntent(Landroid/content/Intent;)V

    const-string v0, "android.nfc.extra.TAG"

    .line 2
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/nfc/Tag;

    if-eqz p1, :cond_2c

    .line 3
    invoke-virtual {p1}, Landroid/nfc/Tag;->getId()[B

    move-result-object v0

    invoke-static {v0}, Lnet/nyx/postest/ui/activity/NfcActivity;->a([B)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 4
    invoke-virtual {p1}, Landroid/nfc/Tag;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object v0, v1, p1

    const-string p1, "nfc tag: %s, %s"

    invoke-static {p1, v1}, Lf/a/a;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 5
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/NfcActivity;->B:Lnet/nyx/widget/layout/SettingBar;

    invoke-virtual {p1, v0}, Lnet/nyx/widget/layout/SettingBar;->c(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;

    :cond_2c
    return-void
.end method

.method public onPause()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    .line 2
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/NfcActivity;->C:Landroid/nfc/NfcAdapter;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p0}, Landroid/nfc/NfcAdapter;->disableForegroundDispatch(Landroid/app/Activity;)V

    :cond_a
    return-void
.end method

.method public onResume()V
    .registers 4

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/NfcActivity;->L()V

    .line 3
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/NfcActivity;->C:Landroid/nfc/NfcAdapter;

    if-eqz v0, :cond_10

    .line 4
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/NfcActivity;->D:Landroid/app/PendingIntent;

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v1, v2, v2}, Landroid/nfc/NfcAdapter;->enableForegroundDispatch(Landroid/app/Activity;Landroid/app/PendingIntent;[Landroid/content/IntentFilter;[[Ljava/lang/String;)V

    :cond_10
    return-void
.end method

.method public w()I
    .registers 2

    const v0, 0x7f0b0021

    return v0
.end method
