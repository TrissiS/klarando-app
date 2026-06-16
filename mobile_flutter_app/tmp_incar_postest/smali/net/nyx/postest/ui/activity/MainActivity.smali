.class public Lnet/nyx/postest/ui/activity/MainActivity;
.super Lnet/nyx/postest/base/AppActivity;
.source "MainActivity.java"


# static fields
.field public static final synthetic L:Le/a/a/a$a;

.field public static synthetic M:Ljava/lang/annotation/Annotation;


# instance fields
.field public B:Lnet/nyx/widget/layout/SettingBar;

.field public C:Lnet/nyx/widget/layout/SettingBar;

.field public D:Lnet/nyx/widget/layout/SettingBar;

.field public E:Landroid/widget/TextView;

.field public F:Landroid/widget/TextView;

.field public G:Landroid/widget/TextView;

.field public H:Landroid/widget/TextView;

.field public I:Landroid/widget/TextView;

.field public J:Landroid/widget/ProgressBar;

.field public K:Landroid/widget/ProgressBar;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    .line 1
    invoke-static {}, Lnet/nyx/postest/ui/activity/MainActivity;->O()V

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lnet/nyx/postest/base/AppActivity;-><init>()V

    return-void
.end method

.method public static synthetic O()V
    .registers 9

    .line 1
    new-instance v8, Le/a/b/a/b;

    const-class v0, Lnet/nyx/postest/ui/activity/MainActivity;

    const-string v1, "MainActivity.java"

    invoke-direct {v8, v1, v0}, Le/a/b/a/b;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v1, "1"

    const-string v2, "onClick"

    const-string v3, "net.nyx.postest.ui.activity.MainActivity"

    const-string v4, "android.view.View"

    const-string v5, "view"

    const-string v6, ""

    const-string v7, "void"

    move-object v0, v8

    invoke-virtual/range {v0 .. v7}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Le/a/a/e/c;

    move-result-object v0

    const-string v1, "method-execution"

    const/16 v2, 0x80

    invoke-virtual {v8, v1, v0, v2}, Le/a/b/a/b;->a(Ljava/lang/String;Le/a/a/d;I)Le/a/a/a$a;

    move-result-object v0

    sput-object v0, Lnet/nyx/postest/ui/activity/MainActivity;->L:Le/a/a/a$a;

    return-void
.end method

.method public static final synthetic a(Lnet/nyx/postest/ui/activity/MainActivity;Landroid/view/View;Le/a/a/a;)V
    .registers 4

    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p2

    const v0, 0x7f08016a

    if-ne p2, v0, :cond_f

    .line 22
    const-class p1, Lnet/nyx/postest/ui/activity/DeviceInfoActivity;

    invoke-interface {p0, p1}, Ld/a/a/g/b;->a(Ljava/lang/Class;)V

    goto :goto_58

    :cond_f
    const v0, 0x7f080174

    if-ne p2, v0, :cond_18

    .line 23
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/MainActivity;->L()V

    goto :goto_58

    :cond_18
    const v0, 0x7f08016f

    if-ne p2, v0, :cond_23

    .line 24
    const-class p1, Lnet/nyx/postest/ui/activity/NfcActivity;

    invoke-interface {p0, p1}, Ld/a/a/g/b;->a(Ljava/lang/Class;)V

    goto :goto_58

    :cond_23
    const v0, 0x7f080171

    if-ne p2, v0, :cond_2e

    .line 25
    const-class p1, Lnet/nyx/postest/ui/activity/PrintActivity;

    invoke-interface {p0, p1}, Ld/a/a/g/b;->a(Ljava/lang/Class;)V

    goto :goto_58

    .line 26
    :cond_2e
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p2

    const v0, 0x7f080175

    if-ne p2, v0, :cond_3b

    .line 27
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/MainActivity;->M()V

    goto :goto_58

    .line 28
    :cond_3b
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p2

    const v0, 0x7f08016c

    if-ne p2, v0, :cond_4a

    .line 29
    const-class p1, Lnet/nyx/postest/ui/activity/LcdActivity;

    invoke-interface {p0, p1}, Ld/a/a/g/b;->a(Ljava/lang/Class;)V

    goto :goto_58

    .line 30
    :cond_4a
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const p2, 0x7f080166

    if-ne p1, p2, :cond_58

    .line 31
    const-class p1, Lnet/nyx/postest/ui/activity/CashActivity;

    invoke-interface {p0, p1}, Ld/a/a/g/b;->a(Ljava/lang/Class;)V

    :cond_58
    :goto_58
    return-void
.end method

.method public static final synthetic a(Lnet/nyx/postest/ui/activity/MainActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V
    .registers 14

    .line 1
    invoke-interface {p4}, Le/a/a/a;->a()Le/a/a/d;

    move-result-object p2

    check-cast p2, Le/a/a/e/a;

    .line 2
    invoke-interface {p2}, Le/a/a/d;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 3
    invoke-interface {p2}, Le/a/a/d;->b()Ljava/lang/String;

    move-result-object p2

    .line 4
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

    .line 5
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    invoke-interface {p4}, Le/a/a/a;->b()[Ljava/lang/Object;

    move-result-object p2

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 7
    :goto_36
    array-length v3, p2

    if-ge v2, v3, :cond_4c

    .line 8
    aget-object v3, p2, v2

    if-nez v2, :cond_41

    .line 9
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_49

    :cond_41
    const-string v4, ", "

    .line 10
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :goto_49
    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    :cond_4c
    const-string p2, ")"

    .line 12
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 15
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

    .line 16
    invoke-static {p0}, Lf/a/a;->a(Ljava/lang/String;)Lf/a/a$c;

    const/4 p0, 0x2

    new-array p0, p0, [Ljava/lang/Object;

    .line 17
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

    .line 18
    :cond_8c
    invoke-static {p3, v1, v2}, Ld/a/b/c/b;->a(Ld/a/b/c/b;J)V

    .line 19
    invoke-static {p3, p2}, Ld/a/b/c/b;->a(Ld/a/b/c/b;Ljava/lang/String;)V

    .line 20
    invoke-static {p0, p1, p4}, Lnet/nyx/postest/ui/activity/MainActivity;->a(Lnet/nyx/postest/ui/activity/MainActivity;Landroid/view/View;Le/a/a/a;)V

    return-void
.end method


# virtual methods
.method public A()V
    .registers 4

    const v0, 0x7f08016a

    .line 1
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    const v0, 0x7f080174

    .line 2
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->B:Lnet/nyx/widget/layout/SettingBar;

    const v0, 0x7f080175

    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    const v0, 0x7f08016f

    .line 4
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    const v0, 0x7f080171

    .line 5
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    const v0, 0x7f080166

    .line 6
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->D:Lnet/nyx/widget/layout/SettingBar;

    const v0, 0x7f08016c

    .line 7
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->C:Lnet/nyx/widget/layout/SettingBar;

    const v0, 0x7f0801f0

    .line 8
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->E:Landroid/widget/TextView;

    const v0, 0x7f0801f9

    .line 9
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->F:Landroid/widget/TextView;

    const v0, 0x7f0801f8

    .line 10
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->G:Landroid/widget/TextView;

    const v0, 0x7f0801f3

    .line 11
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->H:Landroid/widget/TextView;

    const v0, 0x7f0801f5

    .line 12
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->I:Landroid/widget/TextView;

    const v0, 0x7f080142

    .line 13
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->K:Landroid/widget/ProgressBar;

    const v0, 0x7f080143

    .line 14
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->J:Landroid/widget/ProgressBar;

    const/4 v0, 0x7

    new-array v0, v0, [I

    .line 15
    fill-array-data v0, :array_12a

    invoke-interface {p0, v0}, Ld/a/a/g/e;->a([I)V

    .line 16
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_e4

    .line 17
    invoke-static {}, Ld/a/b/g/k;->i()Z

    move-result v0

    const v1, 0x7f07005c

    if-eqz v0, :cond_bc

    .line 18
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->v()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 19
    :cond_bc
    invoke-static {}, Ld/a/b/g/k;->j()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_d3

    .line 20
    :try_start_c2
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->v()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-static {v0}, Landroid/graphics/drawable/Drawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_cd
    .catch Ljava/lang/Exception; {:try_start_c2 .. :try_end_cd} :catch_ce

    goto :goto_e4

    :catch_ce
    move-exception v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_e4

    .line 22
    :cond_d3
    invoke-static {}, Ld/a/b/g/k;->s()Z

    move-result v0

    if-eqz v0, :cond_e4

    .line 23
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->v()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    :cond_e4
    :goto_e4
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v0

    if-nez v0, :cond_f1

    .line 25
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->B:Lnet/nyx/widget/layout/SettingBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 26
    :cond_f1
    invoke-static {}, Ld/a/b/g/k;->c()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_fe

    invoke-static {}, Ld/a/b/g/k;->t()Z

    move-result v0

    if-eqz v0, :cond_103

    .line 27
    :cond_fe
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->D:Lnet/nyx/widget/layout/SettingBar;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 28
    :cond_103
    invoke-static {}, Ld/a/b/g/k;->f()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_117

    const-string v0, "/dev/ttyS2"

    const-string v2, "/dev/ttySPRD3"

    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ld/a/b/g/k;->a([Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_11c

    .line 29
    :cond_117
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->C:Lnet/nyx/widget/layout/SettingBar;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 30
    :cond_11c
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/MainActivity;->N()V

    .line 31
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->E:Landroid/widget/TextView;

    new-instance v1, Lnet/nyx/postest/ui/activity/MainActivity$a;

    invoke-direct {v1, p0}, Lnet/nyx/postest/ui/activity/MainActivity$a;-><init>(Lnet/nyx/postest/ui/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :array_12a
    .array-data 4
        0x7f08016a
        0x7f080174
        0x7f080175
        0x7f08016f
        0x7f080171
        0x7f08016c
        0x7f080166
    .end array-data
.end method

.method public final L()V
    .registers 5

    .line 1
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 2
    new-instance v1, Landroid/content/ComponentName;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ld/a/b/a;->e()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".scanner"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "net.nyx.scanner.ScannerActivity"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 3
    new-instance v1, Ld/a/b/f/a/i;

    invoke-direct {v1, p0}, Ld/a/b/f/a/i;-><init>(Lnet/nyx/postest/ui/activity/MainActivity;)V

    invoke-virtual {p0, v0, v1}, Lnet/nyx/base/BaseActivity;->a(Landroid/content/Intent;Lnet/nyx/base/BaseActivity$a;)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2c} :catch_2d

    goto :goto_41

    .line 4
    :catch_2d
    new-instance v0, Ld/a/b/f/b/k;

    invoke-direct {v0, p0}, Ld/a/b/f/b/k;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0700aa

    .line 5
    invoke-virtual {v0, v1}, Ld/a/b/f/b/k;->g(I)Ld/a/b/f/b/k;

    const v1, 0x7f0f006e

    .line 6
    invoke-virtual {v0, v1}, Ld/a/b/f/b/k;->h(I)Ld/a/b/f/b/k;

    .line 7
    invoke-virtual {v0}, Ld/a/a/d$b;->h()V

    :goto_41
    return-void
.end method

.method public final M()V
    .registers 2

    .line 1
    const-class v0, Lnet/nyx/postest/ui/activity/InfraredScanActivity;

    invoke-interface {p0, v0}, Ld/a/a/g/b;->a(Ljava/lang/Class;)V

    return-void
.end method

.method public final N()V
    .registers 12

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->E:Landroid/widget/TextView;

    invoke-static {}, Ld/a/b/g/k;->g()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->F:Landroid/widget/TextView;

    const v1, 0x7f0f0063

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {}, Ld/a/b/g/k;->a()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->G:Landroid/widget/TextView;

    const v1, 0x7f0f0062

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {}, Ld/a/b/g/k;->n()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    invoke-static {}, Ld/a/b/g/k;->o()[D

    move-result-object v0

    .line 5
    invoke-static {}, Ld/a/b/g/k;->p()[D

    move-result-object v1

    .line 6
    aget-wide v3, v0, v5

    double-to-int v3, v3

    .line 7
    aget-wide v6, v1, v5

    double-to-int v4, v6

    new-array v6, v2, [Ljava/lang/Object;

    .line 8
    aget-wide v7, v0, v2

    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    aput-object v7, v6, v5

    const-string v7, "%.2f"

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    new-array v8, v2, [Ljava/lang/Object;

    .line 9
    aget-wide v9, v1, v2

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v8, v5

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 10
    iget-object v5, p0, Lnet/nyx/postest/ui/activity/MainActivity;->H:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " / "

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "GB"

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    iget-object v5, p0, Lnet/nyx/postest/ui/activity/MainActivity;->I:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    new-instance v2, Ld/a/b/f/a/j;

    invoke-direct {v2, p0, v0, v1}, Ld/a/b/f/a/j;-><init>(Lnet/nyx/postest/ui/activity/MainActivity;[D[D)V

    const-wide/16 v0, 0x190

    invoke-interface {p0, v2, v0, v1}, Ld/a/a/g/g;->a(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public synthetic a(ILandroid/content/Intent;)V
    .registers 4

    const/4 v0, -0x1

    if-ne p1, v0, :cond_13

    if-eqz p2, :cond_13

    .line 38
    new-instance p1, Landroid/content/ComponentName;

    const-class v0, Lnet/nyx/postest/ui/activity/ScanResultActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p2, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_13
    return-void
.end method

.method public synthetic a([D[D)V
    .registers 15

    .line 32
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->K:Landroid/widget/ProgressBar;

    const/4 v1, 0x1

    new-array v2, v1, [I

    aget-wide v3, p1, v1

    const/4 v5, 0x0

    aget-wide v6, p1, v5

    div-double/2addr v3, v6

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    mul-double v3, v3, v6

    double-to-int p1, v3

    aput p1, v2, v5

    const-string p1, "progress"

    invoke-static {v0, p1, v2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v2, 0x258

    .line 33
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 34
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 35
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/MainActivity;->J:Landroid/widget/ProgressBar;

    new-array v4, v1, [I

    aget-wide v8, p2, v1

    aget-wide v10, p2, v5

    div-double/2addr v8, v10

    mul-double v8, v8, v6

    double-to-int p2, v8

    aput p2, v4, v5

    invoke-static {v0, p1, v4}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object p1

    .line 36
    invoke-virtual {p1, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object p1

    .line 37
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 10
    .annotation runtime Ld/a/b/c/a;
    .end annotation

    .line 1
    sget-object v0, Lnet/nyx/postest/ui/activity/MainActivity;->L:Le/a/a/a$a;

    invoke-static {v0, p0, p0, p1}, Le/a/b/a/b;->a(Le/a/a/a$a;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Le/a/a/a;

    move-result-object v3

    invoke-static {}, Ld/a/b/c/b;->b()Ld/a/b/c/b;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Le/a/a/c;

    sget-object v0, Lnet/nyx/postest/ui/activity/MainActivity;->M:Ljava/lang/annotation/Annotation;

    if-nez v0, :cond_29

    const-class v0, Lnet/nyx/postest/ui/activity/MainActivity;

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

    sput-object v0, Lnet/nyx/postest/ui/activity/MainActivity;->M:Ljava/lang/annotation/Annotation;

    :cond_29
    move-object v6, v0

    check-cast v6, Ld/a/b/c/a;

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v6}, Lnet/nyx/postest/ui/activity/MainActivity;->a(Lnet/nyx/postest/ui/activity/MainActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V

    return-void
.end method

.method public w()I
    .registers 2

    const v0, 0x7f0b0020

    return v0
.end method
