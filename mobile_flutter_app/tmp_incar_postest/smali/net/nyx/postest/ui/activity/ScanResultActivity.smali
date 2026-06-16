.class public Lnet/nyx/postest/ui/activity/ScanResultActivity;
.super Lnet/nyx/postest/base/AppActivity;
.source "ScanResultActivity.java"


# instance fields
.field public B:Landroid/widget/TextView;

.field public C:Lnet/nyx/widget/layout/SettingBar;

.field public D:Lnet/nyx/widget/layout/SettingBar;

.field public E:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lnet/nyx/postest/base/AppActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public A()V
    .registers 4

    const v0, 0x7f0801f4

    .line 1
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/ScanResultActivity;->B:Landroid/widget/TextView;

    const v0, 0x7f08017f

    .line 2
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/ScanResultActivity;->C:Lnet/nyx/widget/layout/SettingBar;

    const v0, 0x7f08016b

    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/ScanResultActivity;->D:Lnet/nyx/widget/layout/SettingBar;

    const v0, 0x7f080061

    .line 4
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lnet/nyx/postest/ui/activity/ScanResultActivity;->E:Landroid/widget/Button;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput v0, v1, v2

    .line 5
    invoke-interface {p0, v1}, Ld/a/a/g/e;->a([I)V

    .line 6
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/ScanResultActivity;->L()V

    return-void
.end method

.method public final L()V
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "SCAN_RESULT"

    .line 2
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "SCAN_TYPE"

    .line 3
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "SCAN_TYPE_FORM"

    .line 4
    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 5
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/ScanResultActivity;->B:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/ScanResultActivity;->C:Lnet/nyx/widget/layout/SettingBar;

    invoke-virtual {v3, v2}, Lnet/nyx/widget/layout/SettingBar;->c(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;

    .line 7
    iget-object v2, p0, Lnet/nyx/postest/ui/activity/ScanResultActivity;->D:Lnet/nyx/widget/layout/SettingBar;

    invoke-virtual {v2, v0}, Lnet/nyx/widget/layout/SettingBar;->c(Ljava/lang/CharSequence;)Lnet/nyx/widget/layout/SettingBar;

    const-string v2, "URL"

    .line 8
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 9
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/ScanResultActivity;->E:Landroid/widget/Button;

    const v2, 0x7f0f00ac

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 10
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/ScanResultActivity;->E:Landroid/widget/Button;

    new-instance v2, Ld/a/b/f/a/z;

    invoke-direct {v2, p0, v1}, Ld/a/b/f/a/z;-><init>(Lnet/nyx/postest/ui/activity/ScanResultActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_5a

    .line 11
    :cond_44
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/ScanResultActivity;->E:Landroid/widget/Button;

    const v2, 0x7f0f00f7

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 12
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/ScanResultActivity;->E:Landroid/widget/Button;

    new-instance v2, Ld/a/b/f/a/a0;

    invoke-direct {v2, p0, v1}, Ld/a/b/f/a/a0;-><init>(Lnet/nyx/postest/ui/activity/ScanResultActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_5a
    return-void
.end method

.method public synthetic a(Ljava/lang/String;Landroid/view/View;)V
    .registers 4

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 2
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object p1

    if-eqz p1, :cond_18

    .line 4
    invoke-virtual {p0, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_18
    return-void
.end method

.method public synthetic b(Ljava/lang/String;Landroid/view/View;)V
    .registers 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_26

    const-string p2, "clipboard"

    .line 2
    invoke-virtual {p0, p2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/ClipboardManager;

    const-string v0, "Label"

    .line 3
    invoke-static {v0, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    .line 4
    invoke-virtual {p2, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    const p1, 0x7f0f002c

    .line 5
    invoke-virtual {p0, p1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_26
    return-void
.end method

.method public w()I
    .registers 2

    const v0, 0x7f0b0023

    return v0
.end method
