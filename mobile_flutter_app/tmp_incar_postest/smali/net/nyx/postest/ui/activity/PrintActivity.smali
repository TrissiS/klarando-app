.class public Lnet/nyx/postest/ui/activity/PrintActivity;
.super Lnet/nyx/postest/base/AppActivity;
.source "PrintActivity.java"


# static fields
.field public static final synthetic P:Le/a/a/a$a;

.field public static synthetic Q:Ljava/lang/annotation/Annotation;

.field public static final synthetic R:Le/a/a/a$a;

.field public static synthetic S:Ljava/lang/annotation/Annotation;


# instance fields
.field public B:Lnet/nyx/widget/layout/SettingBar;

.field public C:Landroid/widget/TextView;

.field public D:Lcom/hjq/shape/view/ShapeButton;

.field public E:Lcom/hjq/shape/view/ShapeButton;

.field public final F:Ljava/util/concurrent/ExecutorService;

.field public G:Ljava/lang/String;

.field public H:Ljava/lang/String;

.field public I:Ljava/lang/String;

.field public J:Ljava/lang/String;

.field public K:Z

.field public L:Ld/a/a/d;

.field public final M:Landroid/os/Handler;

.field public N:Ld/a/c/a/a;

.field public O:Landroid/content/ServiceConnection;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    .line 1
    invoke-static {}, Lnet/nyx/postest/ui/activity/PrintActivity;->l0()V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lnet/nyx/postest/base/AppActivity;-><init>()V

    .line 2
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->F:Ljava/util/concurrent/ExecutorService;

    const-string v0, "58mm"

    .line 3
    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->G:Ljava/lang/String;

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->K:Z

    .line 5
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->M:Landroid/os/Handler;

    .line 6
    new-instance v0, Lnet/nyx/postest/ui/activity/PrintActivity$a;

    invoke-direct {v0, p0}, Lnet/nyx/postest/ui/activity/PrintActivity$a;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->O:Landroid/content/ServiceConnection;

    return-void
.end method

.method public static synthetic a(Lnet/nyx/postest/ui/activity/PrintActivity;)Landroid/os/Handler;
    .registers 1

    .line 23
    iget-object p0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->M:Landroid/os/Handler;

    return-object p0
.end method

.method public static synthetic a(Lnet/nyx/postest/ui/activity/PrintActivity;Ld/a/c/a/a;)Ld/a/c/a/a;
    .registers 2

    .line 21
    iput-object p1, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    return-object p1
.end method

.method public static synthetic a(Lnet/nyx/postest/ui/activity/PrintActivity;I)V
    .registers 2

    .line 22
    invoke-virtual {p0, p1}, Lnet/nyx/postest/ui/activity/PrintActivity;->d(I)V

    return-void
.end method

.method public static final synthetic a(Lnet/nyx/postest/ui/activity/PrintActivity;Landroid/view/View;Le/a/a/a;)V
    .registers 3

    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const p2, 0x7f080062

    if-ne p1, p2, :cond_d

    .line 25
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->e0()V

    goto :goto_30

    :cond_d
    const p2, 0x7f080063

    if-ne p1, p2, :cond_16

    .line 26
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->f0()V

    goto :goto_30

    :cond_16
    const p2, 0x7f080066

    if-ne p1, p2, :cond_1f

    .line 27
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->d0()V

    goto :goto_30

    :cond_1f
    const p2, 0x7f080065

    if-ne p1, p2, :cond_28

    .line 28
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->g0()V

    goto :goto_30

    :cond_28
    const p2, 0x7f080064

    if-ne p1, p2, :cond_30

    .line 29
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->M()V

    :cond_30
    :goto_30
    return-void
.end method

.method public static final synthetic a(Lnet/nyx/postest/ui/activity/PrintActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V
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
    invoke-static {p0, p1, p4}, Lnet/nyx/postest/ui/activity/PrintActivity;->a(Lnet/nyx/postest/ui/activity/PrintActivity;Landroid/view/View;Le/a/a/a;)V

    return-void
.end method

.method public static synthetic b(Lnet/nyx/postest/ui/activity/PrintActivity;)V
    .registers 1

    .line 21
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->S()V

    return-void
.end method

.method public static final synthetic b(Lnet/nyx/postest/ui/activity/PrintActivity;Landroid/view/View;Le/a/a/a;)V
    .registers 3

    .line 22
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->R()V

    return-void
.end method

.method public static final synthetic b(Lnet/nyx/postest/ui/activity/PrintActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V
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
    invoke-static {p0, p1, p4}, Lnet/nyx/postest/ui/activity/PrintActivity;->b(Lnet/nyx/postest/ui/activity/PrintActivity;Landroid/view/View;Le/a/a/a;)V

    return-void
.end method

.method public static synthetic c(Lnet/nyx/postest/ui/activity/PrintActivity;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->L()V

    return-void
.end method

.method public static synthetic l0()V
    .registers 10

    .line 1
    new-instance v8, Le/a/b/a/b;

    const-class v0, Lnet/nyx/postest/ui/activity/PrintActivity;

    const-string v1, "PrintActivity.java"

    invoke-direct {v8, v1, v0}, Le/a/b/a/b;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v1, "1"

    const-string v2, "onRightClick"

    const-string v3, "net.nyx.postest.ui.activity.PrintActivity"

    const-string v4, "android.view.View"

    const-string v5, "view"

    const-string v6, ""

    const-string v7, "void"

    move-object v0, v8

    invoke-virtual/range {v0 .. v7}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Le/a/a/e/c;

    move-result-object v0

    const-string v9, "method-execution"

    const/16 v1, 0x51

    invoke-virtual {v8, v9, v0, v1}, Le/a/b/a/b;->a(Ljava/lang/String;Le/a/a/d;I)Le/a/a/a$a;

    move-result-object v0

    sput-object v0, Lnet/nyx/postest/ui/activity/PrintActivity;->P:Le/a/a/a$a;

    const-string v1, "1"

    const-string v2, "onClick"

    const-string v3, "net.nyx.postest.ui.activity.PrintActivity"

    const-string v4, "android.view.View"

    const-string v5, "view"

    const-string v6, ""

    const-string v7, "void"

    move-object v0, v8

    invoke-virtual/range {v0 .. v7}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Le/a/a/e/c;

    move-result-object v0

    const/16 v1, 0x57

    invoke-virtual {v8, v9, v0, v1}, Le/a/b/a/b;->a(Ljava/lang/String;Le/a/a/d;I)Le/a/a/a$a;

    move-result-object v0

    sput-object v0, Lnet/nyx/postest/ui/activity/PrintActivity;->R:Le/a/a/a$a;

    return-void
.end method


# virtual methods
.method public A()V
    .registers 2

    const v0, 0x7f080172

    .line 1
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->B:Lnet/nyx/widget/layout/SettingBar;

    const v0, 0x7f0801f1

    .line 2
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->C:Landroid/widget/TextView;

    const v0, 0x7f080062

    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/hjq/shape/view/ShapeButton;

    const v0, 0x7f080063

    .line 4
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/hjq/shape/view/ShapeButton;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->D:Lcom/hjq/shape/view/ShapeButton;

    const v0, 0x7f080066

    .line 5
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/hjq/shape/view/ShapeButton;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->E:Lcom/hjq/shape/view/ShapeButton;

    const/4 v0, 0x5

    new-array v0, v0, [I

    .line 6
    fill-array-data v0, :array_42

    invoke-interface {p0, v0}, Ld/a/a/g/e;->a([I)V

    .line 7
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->L()V

    return-void

    :array_42
    .array-data 4
        0x7f080062
        0x7f080063
        0x7f080066
        0x7f080065
        0x7f080064
    .end array-data
.end method

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
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->O:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/app/Activity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method public final M()V
    .registers 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v0}, Ld/a/c/a/a;->b()Z

    move-result v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6} :catch_36

    if-eqz v0, :cond_32

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 3
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->N()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    new-instance v1, Ld/a/b/f/b/b;

    invoke-direct {v1, p0}, Ld/a/b/f/b/b;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    .line 5
    invoke-virtual {v1, v0, v2}, Ld/a/b/f/b/b;->a(Ljava/util/List;Ljava/util/List;)Ld/a/b/f/b/b;

    const v2, 0x7f0f00c4

    .line 6
    invoke-virtual {v1, v2}, Ld/a/b/f/b/a;->h(I)Ld/a/b/f/b/a;

    check-cast v1, Ld/a/b/f/b/b;

    new-instance v2, Ld/a/b/f/a/p;

    invoke-direct {v2, p0, v0}, Ld/a/b/f/a/p;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;Ljava/util/List;)V

    .line 7
    invoke-virtual {v1, v2}, Ld/a/b/f/b/b;->a(Ld/a/b/f/b/d;)Ld/a/b/f/b/b;

    .line 8
    invoke-virtual {v1}, Ld/a/a/d$b;->h()V

    goto :goto_35

    .line 9
    :cond_32
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->h0()V

    :goto_35
    return-void

    :catch_36
    move-exception v0

    .line 10
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/16 v0, -0xb

    .line 11
    invoke-virtual {p0, v0}, Lnet/nyx/postest/ui/activity/PrintActivity;->d(I)V

    return-void
.end method

.method public N()Landroid/graphics/Bitmap;
    .registers 6

    .line 1
    new-instance v0, Lnet/nyx/printerservice/print/PrintTextFormat;

    invoke-direct {v0}, Lnet/nyx/printerservice/print/PrintTextFormat;-><init>()V

    .line 2
    invoke-static {}, Ld/a/b/g/k;->g()Ljava/lang/String;

    move-result-object v0

    .line 3
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Model:\t\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\nTime:\t\t"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x104

    .line 5
    :try_start_34
    invoke-static {v0, v1}, Ld/a/b/g/c;->a(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    const-string v2, "1234567890123"

    const/16 v3, 0x46

    const/4 v4, 0x2

    .line 6
    invoke-static {v2, v1, v3, v4}, Ld/a/b/g/c;->a(Ljava/lang/String;III)Landroid/graphics/Bitmap;

    move-result-object v1

    new-array v2, v4, [Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 7
    invoke-static {v2}, Ld/a/b/g/c;->a([Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_4d} :catch_4e

    return-object v0

    :catch_4e
    move-exception v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public O()Landroid/graphics/Bitmap;
    .registers 9

    const-string v0, "1234567890987654321"

    .line 1
    invoke-static {}, Ld/a/b/g/k;->g()Ljava/lang/String;

    move-result-object v1

    .line 2
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Model:\t\t"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\nTime:\t\t"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x140

    .line 4
    :try_start_31
    invoke-static {v1, v2}, Ld/a/b/g/c;->a(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v1

    const/16 v3, 0x5a

    const/4 v4, 0x2

    .line 5
    invoke-static {v0, v2, v3, v4}, Ld/a/b/g/c;->a(Ljava/lang/String;III)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 6
    invoke-static {v0, v2, v2}, Ld/a/b/g/c;->a(Ljava/lang/String;II)Landroid/graphics/Bitmap;

    move-result-object v0

    const/16 v2, 0x180

    const/16 v5, 0x1f4

    const/4 v6, 0x3

    new-array v6, v6, [Landroid/graphics/Bitmap;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    const/4 v1, 0x1

    aput-object v3, v6, v1

    aput-object v0, v6, v4

    .line 7
    invoke-static {v2, v5, v1, v6}, Ld/a/b/g/c;->a(III[Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_53} :catch_54

    return-object v0

    :catch_54
    move-exception v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public P()Landroid/graphics/Bitmap;
    .registers 8

    .line 1
    invoke-static {}, Ld/a/b/g/k;->g()Ljava/lang/String;

    move-result-object v0

    .line 2
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Model:\t\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\nTime:\t\t"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x104

    .line 4
    :try_start_34
    invoke-static {v0, v1}, Ld/a/b/g/c;->a(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    const-string v2, "1234567890123"

    const/16 v3, 0x46

    const/4 v4, 0x2

    .line 5
    invoke-static {v2, v1, v3, v4}, Ld/a/b/g/c;->a(Ljava/lang/String;III)Landroid/graphics/Bitmap;

    move-result-object v1

    const/16 v2, 0x118

    const/16 v3, 0x140

    new-array v5, v4, [Landroid/graphics/Bitmap;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    .line 6
    invoke-static {v2, v3, v4, v5}, Ld/a/b/g/c;->a(III[Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_51} :catch_52

    return-object v0

    :catch_52
    move-exception v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public Q()Landroid/graphics/Bitmap;
    .registers 7

    .line 1
    invoke-static {}, Ld/a/b/g/k;->g()Ljava/lang/String;

    move-result-object v0

    .line 2
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Model:\t\t\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\nTime:\t\t\t"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x180

    .line 4
    :try_start_34
    invoke-static {v0, v1}, Ld/a/b/g/c;->a(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    const-string v1, "1234567890987654321"

    const/16 v2, 0x140

    const/16 v3, 0x5a

    const/4 v4, 0x2

    .line 5
    invoke-static {v1, v2, v3, v4}, Ld/a/b/g/c;->a(Ljava/lang/String;III)Landroid/graphics/Bitmap;

    move-result-object v1

    const/16 v2, 0x1c8

    const/16 v3, 0xf0

    new-array v4, v4, [Landroid/graphics/Bitmap;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    .line 6
    invoke-static {v2, v3, v0, v4}, Ld/a/b/g/c;->a(III[Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_53} :catch_54

    return-object v0

    :catch_54
    move-exception v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final R()V
    .registers 4

    .line 1
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ld/a/b/a;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".printerservice.SETTINGS"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final S()V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->F:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Ld/a/b/f/a/t;

    invoke-direct {v1, p0}, Ld/a/b/f/a/t;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public final T()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->J:Ljava/lang/String;

    if-eqz v0, :cond_18

    const-string v1, "_80"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->J:Ljava/lang/String;

    const-string v1, "_80K"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_18

    :cond_16
    const/4 v0, 0x1

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    return v0
.end method

.method public synthetic U()V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->D:Lcom/hjq/shape/view/ShapeButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method

.method public synthetic V()V
    .registers 5

    .line 1
    :try_start_0
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v0}, Ld/a/c/a/a;->f()I

    move-result v0

    .line 2
    invoke-virtual {p0, v0}, Lnet/nyx/postest/ui/activity/PrintActivity;->d(I)V

    .line 3
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v0}, Ld/a/c/a/a;->d()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->H:Ljava/lang/String;

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    .line 4
    iget-object v2, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v2, v1}, Ld/a/c/a/a;->a([Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_21

    .line 5
    aget-object v1, v1, v3

    iput-object v1, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->I:Ljava/lang/String;

    :cond_21
    new-array v0, v0, [Ljava/lang/String;

    .line 6
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v1, v0}, Ld/a/c/a/a;->b([Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_2f

    .line 7
    aget-object v0, v0, v3

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->J:Ljava/lang/String;

    .line 8
    :cond_2f
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->T()Z

    move-result v0

    if-eqz v0, :cond_41

    const-string v0, "80mm"

    .line 9
    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->G:Ljava/lang/String;

    .line 10
    new-instance v0, Ld/a/b/f/a/u;

    invoke-direct {v0, p0}, Ld/a/b/f/a/u;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 11
    :cond_41
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->c0()V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_44} :catch_45

    goto :goto_49

    :catch_45
    move-exception v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_49
    return-void
.end method

.method public synthetic W()V
    .registers 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const v1, 0x7f0f00b6

    .line 2
    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->G:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->H:Ljava/lang/String;

    if-eqz v3, :cond_4a

    const v3, 0x7f0f00b7

    new-array v4, v2, [Ljava/lang/Object;

    const-string v6, "1.5.8"

    aput-object v6, v4, v5

    .line 5
    invoke-virtual {p0, v3, v4}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v3, 0x7f0f00b8

    new-array v4, v2, [Ljava/lang/Object;

    iget-object v6, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->H:Ljava/lang/String;

    aput-object v6, v4, v5

    .line 7
    invoke-virtual {p0, v3, v4}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    :cond_4a
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->I:Ljava/lang/String;

    if-eqz v1, :cond_5c

    const v3, 0x7f0f00d0

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v1, v2, v5

    .line 10
    invoke-virtual {p0, v3, v2}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    :cond_5c
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->C:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public synthetic X()V
    .registers 15

    const-string v0, "**************************************"

    .line 1
    new-instance v1, Lnet/nyx/printerservice/print/PrintTextFormat;

    invoke-direct {v1}, Lnet/nyx/printerservice/print/PrintTextFormat;-><init>()V

    const/4 v2, 0x1

    .line 2
    :try_start_8
    invoke-virtual {v1, v2}, Lnet/nyx/printerservice/print/PrintTextFormat;->b(I)V

    const/16 v3, 0x20

    .line 3
    invoke-virtual {v1, v3}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 4
    invoke-virtual {v1, v2}, Lnet/nyx/printerservice/print/PrintTextFormat;->a(I)V

    .line 5
    iget-object v4, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const v5, 0x7f0f00cd

    invoke-virtual {p0, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    const/16 v7, 0x180

    invoke-interface {v4, v5, v1, v7, v6}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;II)I

    const/4 v4, 0x0

    .line 6
    invoke-virtual {v1, v4}, Lnet/nyx/printerservice/print/PrintTextFormat;->b(I)V

    const/16 v5, 0x18

    .line 7
    invoke-virtual {v1, v5}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 8
    invoke-virtual {v1, v4}, Lnet/nyx/printerservice/print/PrintTextFormat;->a(I)V

    .line 9
    iget-object v4, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v4, v0, v1, v7, v6}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;II)I

    .line 10
    invoke-virtual {v1, v5}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 11
    iget-object v4, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const v8, 0x7f0f00c8

    invoke-virtual {p0, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v4, v8, v1, v7, v6}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;II)I

    .line 12
    invoke-virtual {v1, v3}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 13
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const v4, 0x7f0f00c9

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1, v7, v6}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;II)I

    const/16 v3, 0x28

    .line 14
    invoke-virtual {v1, v3}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 15
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const v4, 0x7f0f00ca

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1, v7, v6}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;II)I

    const/16 v3, 0x30

    .line 16
    invoke-virtual {v1, v3}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 17
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const v4, 0x7f0f00cb

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1, v7, v6}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;II)I

    .line 18
    invoke-virtual {v1, v5}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 19
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v3, v0, v1, v7, v6}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;II)I

    .line 20
    iget-object v8, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const-string v9, "2022061418"

    const/16 v10, 0x180

    const/16 v11, 0xa0

    const/4 v12, 0x2

    const/4 v13, 0x2

    invoke-interface/range {v8 .. v13}, Ld/a/c/a/a;->a(Ljava/lang/String;IIII)I

    .line 21
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const/16 v4, 0x10

    invoke-interface {v3, v4}, Ld/a/c/a/a;->a(I)I

    .line 22
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const-string v4, "1234567887654321"

    invoke-interface {v3, v4, v7, v7, v6}, Ld/a/c/a/a;->a(Ljava/lang/String;III)I

    .line 23
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v3, v0, v1, v7, v6}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;II)I

    .line 24
    invoke-virtual {v1, v2}, Lnet/nyx/printerservice/print/PrintTextFormat;->a(I)V

    .line 25
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const-string v2, "***Completed***"

    invoke-interface {v0, v2, v1, v7, v6}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;II)I

    .line 26
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v0}, Ld/a/c/a/a;->c()I

    move-result v0
    :try_end_ab
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_ab} :catch_ac

    goto :goto_b2

    :catch_ac
    move-exception v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/16 v0, -0xb

    .line 28
    :goto_b2
    invoke-virtual {p0, v0}, Lnet/nyx/postest/ui/activity/PrintActivity;->d(I)V

    return-void
.end method

.method public synthetic Y()V
    .registers 11

    const-string v0, "*********************************************************"

    .line 1
    new-instance v1, Lnet/nyx/printerservice/print/PrintTextFormat;

    invoke-direct {v1}, Lnet/nyx/printerservice/print/PrintTextFormat;-><init>()V

    const/4 v2, 0x1

    .line 2
    :try_start_8
    invoke-virtual {v1, v2}, Lnet/nyx/printerservice/print/PrintTextFormat;->b(I)V

    const/16 v3, 0x20

    .line 3
    invoke-virtual {v1, v3}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 4
    invoke-virtual {v1, v2}, Lnet/nyx/printerservice/print/PrintTextFormat;->a(I)V

    .line 5
    iget-object v4, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const v5, 0x7f0f00cd

    invoke-virtual {p0, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v1}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;)I

    const/4 v4, 0x0

    .line 6
    invoke-virtual {v1, v4}, Lnet/nyx/printerservice/print/PrintTextFormat;->b(I)V

    const/16 v5, 0x18

    .line 7
    invoke-virtual {v1, v5}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 8
    invoke-virtual {v1, v4}, Lnet/nyx/printerservice/print/PrintTextFormat;->a(I)V

    .line 9
    iget-object v4, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v4, v0, v1}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;)I

    .line 10
    invoke-virtual {v1, v5}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 11
    iget-object v4, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const v6, 0x7f0f00c8

    invoke-virtual {p0, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6, v1}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;)I

    .line 12
    invoke-virtual {v1, v3}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 13
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const v4, 0x7f0f00c9

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;)I

    const/16 v3, 0x28

    .line 14
    invoke-virtual {v1, v3}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 15
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const v4, 0x7f0f00ca

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;)I

    const/16 v3, 0x30

    .line 16
    invoke-virtual {v1, v3}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 17
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const v4, 0x7f0f00cb

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;)I

    .line 18
    invoke-virtual {v1, v5}, Lnet/nyx/printerservice/print/PrintTextFormat;->c(I)V

    .line 19
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v3, v0, v1}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;)I

    .line 20
    iget-object v4, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const-string v5, "2022061418"

    const/16 v6, 0x238

    const/16 v7, 0xa0

    const/4 v8, 0x2

    const/4 v9, 0x1

    invoke-interface/range {v4 .. v9}, Ld/a/c/a/a;->a(Ljava/lang/String;IIII)I

    .line 21
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const/16 v4, 0x10

    invoke-interface {v3, v4}, Ld/a/c/a/a;->a(I)I

    .line 22
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const-string v4, "1234567887654321"

    const/16 v5, 0x180

    invoke-interface {v3, v4, v5, v5, v2}, Ld/a/c/a/a;->a(Ljava/lang/String;III)I

    .line 23
    iget-object v3, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v3, v0, v1}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;)I

    .line 24
    invoke-virtual {v1, v2}, Lnet/nyx/printerservice/print/PrintTextFormat;->a(I)V

    .line 25
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const-string v2, "***Completed***"

    invoke-interface {v0, v2, v1}, Ld/a/c/a/a;->a(Ljava/lang/String;Lnet/nyx/printerservice/print/PrintTextFormat;)I

    .line 26
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v0}, Ld/a/c/a/a;->c()I

    move-result v0
    :try_end_aa
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_aa} :catch_ab

    goto :goto_b1

    :catch_ab
    move-exception v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/16 v0, -0xb

    .line 28
    :goto_b1
    invoke-virtual {p0, v0}, Lnet/nyx/postest/ui/activity/PrintActivity;->d(I)V

    return-void
.end method

.method public synthetic Z()V
    .registers 9

    .line 1
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->T()Z

    move-result v0

    const/16 v1, 0x240

    const/16 v2, 0x180

    if-eqz v0, :cond_d

    const/16 v0, 0x240

    goto :goto_f

    :cond_d
    const/16 v0, 0x180

    :goto_f
    mul-int/lit8 v0, v0, 0x8

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->T()Z

    move-result v3

    if-eqz v3, :cond_18

    goto :goto_1a

    :cond_18
    const/16 v1, 0x180

    :goto_1a
    div-int/lit8 v1, v1, 0x8

    mul-int/lit8 v2, v0, 0x3

    .line 3
    new-array v2, v2, [B

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_22
    const/16 v5, 0x40

    if-ge v4, v5, :cond_42

    const/4 v5, 0x0

    :goto_27
    if-ge v5, v1, :cond_3f

    .line 4
    div-int/lit8 v6, v5, 0x8

    rem-int/lit8 v6, v6, 0x2

    const/4 v7, -0x1

    if-nez v6, :cond_36

    mul-int v6, v4, v1

    add-int/2addr v6, v5

    .line 5
    aput-byte v7, v2, v6

    goto :goto_3c

    :cond_36
    mul-int v6, v4, v1

    add-int/2addr v6, v5

    add-int/2addr v6, v0

    .line 6
    aput-byte v7, v2, v6

    :goto_3c
    add-int/lit8 v5, v5, 0x1

    goto :goto_27

    :cond_3f
    add-int/lit8 v4, v4, 0x1

    goto :goto_22

    .line 7
    :cond_42
    :goto_42
    :try_start_42
    iget-boolean v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->K:Z

    if-eqz v0, :cond_58

    .line 8
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v0, v2}, Ld/a/c/a/a;->a([B)I

    move-result v3

    if-eqz v3, :cond_4f

    goto :goto_58

    .line 9
    :cond_4f
    invoke-static {}, Ld/a/b/g/k;->k()I

    move-result v0

    int-to-long v0, v0

    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    goto :goto_42

    :cond_58
    :goto_58
    if-nez v3, :cond_68

    .line 10
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const/16 v1, 0x3c

    invoke-interface {v0, v1}, Ld/a/c/a/a;->a(I)I
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_61} :catch_62

    goto :goto_68

    :catch_62
    move-exception v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/16 v3, -0xb

    .line 12
    :cond_68
    :goto_68
    invoke-virtual {p0, v3}, Lnet/nyx/postest/ui/activity/PrintActivity;->d(I)V

    .line 13
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->j0()V

    return-void
.end method

.method public synthetic a(IILandroid/graphics/Bitmap;I)V
    .registers 6

    .line 33
    :try_start_0
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v0}, Ld/a/c/a/a;->b()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 34
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {p1}, Ld/a/c/a/a;->g()I

    move-result p1

    goto :goto_15

    .line 35
    :cond_f
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {v0, p1, p2}, Ld/a/c/a/a;->a(II)I

    move-result p1

    :goto_15
    if-nez p1, :cond_2a

    .line 36
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    const/4 p2, 0x0

    invoke-interface {p1, p3, p2, p4}, Ld/a/c/a/a;->a(Landroid/graphics/Bitmap;II)I

    .line 37
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->N:Ld/a/c/a/a;

    invoke-interface {p1}, Ld/a/c/a/a;->h()I

    move-result p1
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_23} :catch_24

    goto :goto_2a

    :catch_24
    move-exception p1

    .line 38
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    const/16 p1, -0xb

    .line 39
    :cond_2a
    :goto_2a
    invoke-virtual {p0, p1}, Lnet/nyx/postest/ui/activity/PrintActivity;->d(I)V

    return-void
.end method

.method public a(Landroid/graphics/Bitmap;III)V
    .registers 13

    .line 32
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->F:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Ld/a/b/f/a/o;

    move-object v1, v7

    move-object v2, p0

    move v3, p2

    move v4, p3

    move-object v5, p1

    move v6, p4

    invoke-direct/range {v1 .. v6}, Ld/a/b/f/a/o;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;IILandroid/graphics/Bitmap;I)V

    invoke-interface {v0, v7}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public synthetic a(Ld/a/a/d;)V
    .registers 2

    .line 40
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->j0()V

    return-void
.end method

.method public synthetic a(Ljava/util/List;Ld/a/a/d;I)V
    .registers 4

    const/4 p2, 0x0

    .line 30
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    const/4 p3, 0x2

    invoke-virtual {p0, p1, p2, p2, p3}, Lnet/nyx/postest/ui/activity/PrintActivity;->a(Landroid/graphics/Bitmap;III)V

    return-void
.end method

.method public synthetic a(Ljava/util/List;[I[ILd/a/a/d;I)V
    .registers 6

    .line 31
    invoke-interface {p1, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    aget p2, p2, p5

    aget p3, p3, p5

    const/16 p4, 0x10

    invoke-virtual {p0, p1, p2, p4, p3}, Lnet/nyx/postest/ui/activity/PrintActivity;->a(Landroid/graphics/Bitmap;III)V

    return-void
.end method

.method public synthetic a0()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->L:Ld/a/a/d;

    invoke-virtual {v0}, Ld/a/a/d;->dismiss()V

    return-void
.end method

.method public synthetic b0()V
    .registers 4

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->K:Z

    .line 2
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->E:Lcom/hjq/shape/view/ShapeButton;

    const v1, 0x7f0f00c5

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 3
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->L:Ld/a/a/d;

    if-eqz v0, :cond_19

    .line 4
    new-instance v0, Ld/a/b/f/a/n;

    invoke-direct {v0, p0}, Ld/a/b/f/a/n;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    const-wide/16 v1, 0xc8

    invoke-interface {p0, v0, v1, v2}, Ld/a/a/g/g;->a(Ljava/lang/Runnable;J)Z

    :cond_19
    return-void
.end method

.method public synthetic c(I)V
    .registers 4

    .line 2
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->B:Lnet/nyx/widget/layout/SettingBar;

    if-nez p1, :cond_8

    const v1, 0x7f0700a4

    goto :goto_b

    :cond_8
    const v1, 0x7f0700a3

    :goto_b
    invoke-virtual {v0, v1}, Lnet/nyx/widget/layout/SettingBar;->g(I)Lnet/nyx/widget/layout/SettingBar;

    if-nez p1, :cond_14

    const p1, 0x7f0f00c0

    goto :goto_47

    :cond_14
    const/16 v0, -0x44c

    if-ne p1, v0, :cond_1c

    const p1, 0x7f0f00ba

    goto :goto_47

    :cond_1c
    const/16 v0, -0x4b3

    if-ne p1, v0, :cond_24

    const p1, 0x7f0f00be

    goto :goto_47

    :cond_24
    const/16 v0, -0x50a

    if-ne p1, v0, :cond_2c

    const p1, 0x7f0f00bc

    goto :goto_47

    :cond_2c
    const/16 v0, -0x50c

    if-ne p1, v0, :cond_34

    const p1, 0x7f0f00bd

    goto :goto_47

    :cond_34
    const/4 v0, -0x1

    if-ne p1, v0, :cond_3b

    const p1, 0x7f0f00c1

    goto :goto_47

    :cond_3b
    const/16 v0, -0xb

    if-ne p1, v0, :cond_43

    const p1, 0x7f0f00bf

    goto :goto_47

    .line 3
    :cond_43
    invoke-static {p1}, Ld/a/b/g/i;->a(I)I

    move-result p1

    .line 4
    :goto_47
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->B:Lnet/nyx/widget/layout/SettingBar;

    invoke-virtual {v0, p1}, Lnet/nyx/widget/layout/SettingBar;->k(I)Lnet/nyx/widget/layout/SettingBar;

    return-void
.end method

.method public final c0()V
    .registers 2

    .line 1
    new-instance v0, Ld/a/b/f/a/s;

    invoke-direct {v0, p0}, Ld/a/b/f/a/s;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final d(I)V
    .registers 3

    .line 2
    new-instance v0, Ld/a/b/f/a/q;

    invoke-direct {v0, p0, p1}, Ld/a/b/f/a/q;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;I)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public synthetic d(Landroid/view/View;)V
    .registers 2

    .line 1
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->R()V

    return-void
.end method

.method public d0()V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->E:Lcom/hjq/shape/view/ShapeButton;

    invoke-virtual {v0}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    const v1, 0x7f0f00c5

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->i0()V

    goto :goto_1a

    .line 3
    :cond_17
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->j0()V

    :goto_1a
    return-void
.end method

.method public e0()V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->F:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Ld/a/b/f/a/m;

    invoke-direct {v1, p0}, Ld/a/b/f/a/m;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public f0()V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->F:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Ld/a/b/f/a/w;

    invoke-direct {v1, p0}, Ld/a/b/f/a/w;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public g0()V
    .registers 8

    const/4 v0, 0x3

    new-array v1, v0, [I

    .line 1
    fill-array-data v1, :array_94

    new-array v2, v0, [I

    .line 2
    fill-array-data v2, :array_9e

    .line 3
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 4
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(I)V

    const v0, 0x7f0f00b4

    .line 5
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 6
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ": 57*30mm"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ": 40*40mm"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ": 48mm "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v0, 0x7f0f00b3

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->Q()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->P()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->O()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    new-instance v0, Ld/a/b/f/b/b;

    invoke-direct {v0, p0}, Ld/a/b/f/b/b;-><init>(Landroid/content/Context;)V

    .line 13
    invoke-virtual {v0, v3, v4}, Ld/a/b/f/b/b;->a(Ljava/util/List;Ljava/util/List;)Ld/a/b/f/b/b;

    const v4, 0x7f0f00c4

    .line 14
    invoke-virtual {v0, v4}, Ld/a/b/f/b/a;->h(I)Ld/a/b/f/b/a;

    check-cast v0, Ld/a/b/f/b/b;

    new-instance v4, Ld/a/b/f/a/y;

    invoke-direct {v4, p0, v3, v1, v2}, Ld/a/b/f/a/y;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;Ljava/util/List;[I[I)V

    .line 15
    invoke-virtual {v0, v4}, Ld/a/b/f/b/b;->a(Ld/a/b/f/b/d;)Ld/a/b/f/b/b;

    .line 16
    invoke-virtual {v0}, Ld/a/a/d$b;->h()V

    return-void

    nop

    :array_94
    .array-data 4
        0xf0
        0x140
        0x0
    .end array-data

    :array_9e
    .array-data 4
        0x1
        0x2
        0x1
    .end array-data
.end method

.method public h0()V
    .registers 8

    .line 1
    new-instance v0, Ld/a/d/g/c;

    invoke-direct {v0, p0}, Ld/a/d/g/c;-><init>(Landroid/content/Context;)V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->E()Lcom/hjq/bar/TitleBar;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hjq/bar/TitleBar;->getRightView()Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ld/a/d/g/d$b;

    new-instance v3, Ld/a/d/g/d$b$a;

    const/4 v4, 0x0

    const/16 v5, 0x14

    invoke-direct {v3, v4, v5, v4, v4}, Ld/a/d/g/d$b$a;-><init>(IIII)V

    const v4, 0x7f0b003e

    const/4 v5, 0x2

    const/4 v6, 0x4

    invoke-direct {v2, v4, v5, v6, v3}, Ld/a/d/g/d$b;-><init>(IIILd/a/d/g/d$b$a;)V

    const/4 v3, 0x0

    const/16 v4, 0x21

    invoke-virtual {v0, v1, v3, v4, v2}, Ld/a/d/g/c;->a(Landroid/view/View;[IILd/a/d/g/d$b;)Ld/a/d/g/c;

    new-instance v1, Ld/a/b/f/a/x;

    invoke-direct {v1, p0}, Ld/a/b/f/a/x;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    .line 3
    invoke-virtual {v0, v1}, Ld/a/d/g/c;->a(Landroid/view/View$OnClickListener;)Ld/a/d/g/c;

    .line 4
    invoke-virtual {v0}, Ld/a/d/g/c;->b()V

    return-void
.end method

.method public i0()V
    .registers 3

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->K:Z

    .line 2
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->E:Lcom/hjq/shape/view/ShapeButton;

    const v1, 0x7f0f00c6

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 3
    new-instance v0, Ld/a/b/f/b/l;

    invoke-direct {v0, p0}, Ld/a/b/f/b/l;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0f00c5

    .line 4
    invoke-virtual {v0, v1}, Ld/a/b/f/b/l;->g(I)Ld/a/b/f/b/l;

    new-instance v1, Ld/a/b/f/a/r;

    invoke-direct {v1, p0}, Ld/a/b/f/a/r;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    .line 5
    invoke-virtual {v0, v1}, Ld/a/a/d$b;->a(Ld/a/a/d$h;)Ld/a/a/d$b;

    check-cast v0, Ld/a/b/f/b/l;

    .line 6
    invoke-virtual {v0}, Ld/a/a/d$b;->a()Ld/a/a/d;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->L:Ld/a/a/d;

    .line 7
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 8
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->F:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Ld/a/b/f/a/l;

    invoke-direct {v1, p0}, Ld/a/b/f/a/l;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public j0()V
    .registers 2

    .line 1
    new-instance v0, Ld/a/b/f/a/v;

    invoke-direct {v0, p0}, Ld/a/b/f/a/v;-><init>(Lnet/nyx/postest/ui/activity/PrintActivity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final k0()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/PrintActivity;->O:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->unbindService(Landroid/content/ServiceConnection;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 10
    .annotation runtime Ld/a/b/c/a;
    .end annotation

    .line 1
    sget-object v0, Lnet/nyx/postest/ui/activity/PrintActivity;->R:Le/a/a/a$a;

    invoke-static {v0, p0, p0, p1}, Le/a/b/a/b;->a(Le/a/a/a$a;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Le/a/a/a;

    move-result-object v3

    invoke-static {}, Ld/a/b/c/b;->b()Ld/a/b/c/b;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Le/a/a/c;

    sget-object v0, Lnet/nyx/postest/ui/activity/PrintActivity;->S:Ljava/lang/annotation/Annotation;

    if-nez v0, :cond_29

    const-class v0, Lnet/nyx/postest/ui/activity/PrintActivity;

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

    sput-object v0, Lnet/nyx/postest/ui/activity/PrintActivity;->S:Ljava/lang/annotation/Annotation;

    :cond_29
    move-object v6, v0

    check-cast v6, Ld/a/b/c/a;

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v6}, Lnet/nyx/postest/ui/activity/PrintActivity;->a(Lnet/nyx/postest/ui/activity/PrintActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V

    return-void
.end method

.method public onDestroy()V
    .registers 1

    .line 1
    invoke-super {p0}, Lnet/nyx/postest/base/AppActivity;->onDestroy()V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->k0()V

    return-void
.end method

.method public onResume()V
    .registers 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/PrintActivity;->S()V

    return-void
.end method

.method public onRightClick(Landroid/view/View;)V
    .registers 10
    .annotation runtime Ld/a/b/c/a;
    .end annotation

    .line 1
    sget-object v0, Lnet/nyx/postest/ui/activity/PrintActivity;->P:Le/a/a/a$a;

    invoke-static {v0, p0, p0, p1}, Le/a/b/a/b;->a(Le/a/a/a$a;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Le/a/a/a;

    move-result-object v3

    invoke-static {}, Ld/a/b/c/b;->b()Ld/a/b/c/b;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Le/a/a/c;

    sget-object v0, Lnet/nyx/postest/ui/activity/PrintActivity;->Q:Ljava/lang/annotation/Annotation;

    if-nez v0, :cond_29

    const-class v0, Lnet/nyx/postest/ui/activity/PrintActivity;

    const-string v1, "onRightClick"

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

    sput-object v0, Lnet/nyx/postest/ui/activity/PrintActivity;->Q:Ljava/lang/annotation/Annotation;

    :cond_29
    move-object v6, v0

    check-cast v6, Ld/a/b/c/a;

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v6}, Lnet/nyx/postest/ui/activity/PrintActivity;->b(Lnet/nyx/postest/ui/activity/PrintActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V

    return-void
.end method

.method public w()I
    .registers 2

    const v0, 0x7f0b0022

    return v0
.end method
