.class public Lnet/nyx/postest/ui/activity/LcdActivity;
.super Lnet/nyx/postest/base/AppActivity;
.source "LcdActivity.java"


# static fields
.field public static final synthetic N:Le/a/a/a$a;

.field public static synthetic O:Ljava/lang/annotation/Annotation;

.field public static final synthetic P:Le/a/a/a$a;

.field public static synthetic Q:Ljava/lang/annotation/Annotation;


# instance fields
.field public B:Lnet/nyx/widget/layout/SettingBar;

.field public C:Landroid/widget/Button;

.field public D:Landroid/widget/Button;

.field public E:Landroid/widget/Button;

.field public F:Landroid/widget/Button;

.field public G:Landroid/widget/Button;

.field public H:Landroid/widget/Button;

.field public I:Landroid/widget/Button;

.field public J:I

.field public final K:Ljava/util/concurrent/ExecutorService;

.field public L:Ld/a/c/a/a;

.field public final M:Landroid/content/ServiceConnection;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    .line 1
    invoke-static {}, Lnet/nyx/postest/ui/activity/LcdActivity;->T()V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lnet/nyx/postest/base/AppActivity;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->J:I

    .line 3
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->K:Ljava/util/concurrent/ExecutorService;

    .line 4
    new-instance v0, Lnet/nyx/postest/ui/activity/LcdActivity$a;

    invoke-direct {v0, p0}, Lnet/nyx/postest/ui/activity/LcdActivity$a;-><init>(Lnet/nyx/postest/ui/activity/LcdActivity;)V

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->M:Landroid/content/ServiceConnection;

    return-void
.end method

.method public static synthetic T()V
    .registers 10

    .line 1
    new-instance v8, Le/a/b/a/b;

    const-class v0, Lnet/nyx/postest/ui/activity/LcdActivity;

    const-string v1, "LcdActivity.java"

    invoke-direct {v8, v1, v0}, Le/a/b/a/b;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v1, "1"

    const-string v2, "onRightClick"

    const-string v3, "net.nyx.postest.ui.activity.LcdActivity"

    const-string v4, "android.view.View"

    const-string v5, "view"

    const-string v6, ""

    const-string v7, "void"

    move-object v0, v8

    invoke-virtual/range {v0 .. v7}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Le/a/a/e/c;

    move-result-object v0

    const-string v9, "method-execution"

    const/16 v1, 0x65

    invoke-virtual {v8, v9, v0, v1}, Le/a/b/a/b;->a(Ljava/lang/String;Le/a/a/d;I)Le/a/a/a$a;

    move-result-object v0

    sput-object v0, Lnet/nyx/postest/ui/activity/LcdActivity;->N:Le/a/a/a$a;

    const-string v1, "1"

    const-string v2, "onClick"

    const-string v3, "net.nyx.postest.ui.activity.LcdActivity"

    const-string v4, "android.view.View"

    const-string v5, "view"

    const-string v6, ""

    const-string v7, "void"

    move-object v0, v8

    invoke-virtual/range {v0 .. v7}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Le/a/a/e/c;

    move-result-object v0

    const/16 v1, 0x6b

    invoke-virtual {v8, v9, v0, v1}, Le/a/b/a/b;->a(Ljava/lang/String;Le/a/a/d;I)Le/a/a/a$a;

    move-result-object v0

    sput-object v0, Lnet/nyx/postest/ui/activity/LcdActivity;->P:Le/a/a/a$a;

    return-void
.end method

.method public static synthetic a(Lnet/nyx/postest/ui/activity/LcdActivity;I)I
    .registers 2

    .line 4
    iput p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->J:I

    return p1
.end method

.method public static synthetic a(Lnet/nyx/postest/ui/activity/LcdActivity;Ld/a/c/a/a;)Ld/a/c/a/a;
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->L:Ld/a/c/a/a;

    return-object p1
.end method

.method public static synthetic a(Lnet/nyx/postest/ui/activity/LcdActivity;)V
    .registers 1

    .line 3
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/LcdActivity;->L()V

    return-void
.end method

.method public static final synthetic a(Lnet/nyx/postest/ui/activity/LcdActivity;Landroid/view/View;Le/a/a/a;)V
    .registers 3

    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const p2, 0x7f08005d

    if-ne p1, p2, :cond_d

    .line 26
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/LcdActivity;->Q()V

    goto :goto_46

    :cond_d
    const p2, 0x7f08005b

    if-ne p1, p2, :cond_17

    const/4 p1, 0x3

    .line 27
    invoke-virtual {p0, p1}, Lnet/nyx/postest/ui/activity/LcdActivity;->c(I)V

    goto :goto_46

    :cond_17
    const p2, 0x7f08005c

    if-ne p1, p2, :cond_21

    const/4 p1, 0x4

    .line 28
    invoke-virtual {p0, p1}, Lnet/nyx/postest/ui/activity/LcdActivity;->c(I)V

    goto :goto_46

    :cond_21
    const p2, 0x7f080060

    if-ne p1, p2, :cond_2b

    const/4 p1, 0x1

    .line 29
    invoke-virtual {p0, p1}, Lnet/nyx/postest/ui/activity/LcdActivity;->c(I)V

    goto :goto_46

    :cond_2b
    const p2, 0x7f08005e

    if-ne p1, p2, :cond_35

    const/4 p1, 0x2

    .line 30
    invoke-virtual {p0, p1}, Lnet/nyx/postest/ui/activity/LcdActivity;->c(I)V

    goto :goto_46

    :cond_35
    const p2, 0x7f08005f

    if-ne p1, p2, :cond_3e

    .line 31
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/LcdActivity;->S()V

    goto :goto_46

    :cond_3e
    const p2, 0x7f08005a

    if-ne p1, p2, :cond_46

    .line 32
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/LcdActivity;->M()V

    :cond_46
    :goto_46
    return-void
.end method

.method public static final synthetic a(Lnet/nyx/postest/ui/activity/LcdActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V
    .registers 14

    .line 5
    invoke-interface {p4}, Le/a/a/a;->a()Le/a/a/d;

    move-result-object p2

    check-cast p2, Le/a/a/e/a;

    .line 6
    invoke-interface {p2}, Le/a/a/d;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 7
    invoke-interface {p2}, Le/a/a/d;->b()Ljava/lang/String;

    move-result-object p2

    .line 8
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

    .line 9
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    invoke-interface {p4}, Le/a/a/a;->b()[Ljava/lang/Object;

    move-result-object p2

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 11
    :goto_36
    array-length v3, p2

    if-ge v2, v3, :cond_4c

    .line 12
    aget-object v3, p2, v2

    if-nez v2, :cond_41

    .line 13
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_49

    :cond_41
    const-string v4, ", "

    .line 14
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :goto_49
    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    :cond_4c
    const-string p2, ")"

    .line 16
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 19
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

    .line 20
    invoke-static {p0}, Lf/a/a;->a(Ljava/lang/String;)Lf/a/a$c;

    const/4 p0, 0x2

    new-array p0, p0, [Ljava/lang/Object;

    .line 21
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

    .line 22
    :cond_8c
    invoke-static {p3, v1, v2}, Ld/a/b/c/b;->a(Ld/a/b/c/b;J)V

    .line 23
    invoke-static {p3, p2}, Ld/a/b/c/b;->a(Ld/a/b/c/b;Ljava/lang/String;)V

    .line 24
    invoke-static {p0, p1, p4}, Lnet/nyx/postest/ui/activity/LcdActivity;->a(Lnet/nyx/postest/ui/activity/LcdActivity;Landroid/view/View;Le/a/a/a;)V

    return-void
.end method

.method public static synthetic a(Lnet/nyx/postest/ui/activity/LcdActivity;Z)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lnet/nyx/postest/ui/activity/LcdActivity;->a(Z)V

    return-void
.end method

.method public static synthetic b(Lnet/nyx/postest/ui/activity/LcdActivity;)I
    .registers 1

    .line 1
    iget p0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->J:I

    return p0
.end method

.method public static synthetic b(Lnet/nyx/postest/ui/activity/LcdActivity;I)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lnet/nyx/postest/ui/activity/LcdActivity;->c(I)V

    return-void
.end method

.method public static final synthetic b(Lnet/nyx/postest/ui/activity/LcdActivity;Landroid/view/View;Le/a/a/a;)V
    .registers 3

    .line 23
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/LcdActivity;->N()V

    return-void
.end method

.method public static final synthetic b(Lnet/nyx/postest/ui/activity/LcdActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V
    .registers 14

    .line 3
    invoke-interface {p4}, Le/a/a/a;->a()Le/a/a/d;

    move-result-object p2

    check-cast p2, Le/a/a/e/a;

    .line 4
    invoke-interface {p2}, Le/a/a/d;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 5
    invoke-interface {p2}, Le/a/a/d;->b()Ljava/lang/String;

    move-result-object p2

    .line 6
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

    .line 7
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    invoke-interface {p4}, Le/a/a/a;->b()[Ljava/lang/Object;

    move-result-object p2

    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 9
    :goto_36
    array-length v3, p2

    if-ge v2, v3, :cond_4c

    .line 10
    aget-object v3, p2, v2

    if-nez v2, :cond_41

    .line 11
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_49

    :cond_41
    const-string v4, ", "

    .line 12
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :goto_49
    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    :cond_4c
    const-string p2, ")"

    .line 14
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 17
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

    .line 18
    invoke-static {p0}, Lf/a/a;->a(Ljava/lang/String;)Lf/a/a$c;

    const/4 p0, 0x2

    new-array p0, p0, [Ljava/lang/Object;

    .line 19
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

    .line 20
    :cond_8c
    invoke-static {p3, v1, v2}, Ld/a/b/c/b;->a(Ld/a/b/c/b;J)V

    .line 21
    invoke-static {p3, p2}, Ld/a/b/c/b;->a(Ld/a/b/c/b;Ljava/lang/String;)V

    .line 22
    invoke-static {p0, p1, p4}, Lnet/nyx/postest/ui/activity/LcdActivity;->b(Lnet/nyx/postest/ui/activity/LcdActivity;Landroid/view/View;Le/a/a/a;)V

    return-void
.end method

.method public static g(I)Ljava/lang/String;
    .registers 6

    .line 1
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    :goto_b
    if-ge v2, p0, :cond_1f

    const/16 v3, 0x3e

    .line 3
    invoke-virtual {v0, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    const-string v4, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    .line 4
    invoke-virtual {v4, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 5
    :cond_1f
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A()V
    .registers 3

    const v0, 0x7f08016d

    .line 1
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/nyx/widget/layout/SettingBar;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->B:Lnet/nyx/widget/layout/SettingBar;

    const v0, 0x7f08005d

    .line 2
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->C:Landroid/widget/Button;

    const v0, 0x7f08005c

    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->D:Landroid/widget/Button;

    const v0, 0x7f08005b

    .line 4
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->E:Landroid/widget/Button;

    const v0, 0x7f080060

    .line 5
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->F:Landroid/widget/Button;

    const v0, 0x7f08005e

    .line 6
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->G:Landroid/widget/Button;

    const v0, 0x7f08005f

    .line 7
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->H:Landroid/widget/Button;

    const v0, 0x7f08005a

    .line 8
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->I:Landroid/widget/Button;

    const/4 v0, 0x7

    new-array v0, v0, [I

    .line 9
    fill-array-data v0, :array_76

    invoke-interface {p0, v0}, Ld/a/a/g/e;->a([I)V

    .line 10
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->E()Lcom/hjq/bar/TitleBar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/hjq/bar/TitleBar;->getTitleView()Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Lnet/nyx/postest/ui/activity/LcdActivity$b;

    invoke-direct {v1, p0}, Lnet/nyx/postest/ui/activity/LcdActivity$b;-><init>(Lnet/nyx/postest/ui/activity/LcdActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/LcdActivity;->L()V

    return-void

    nop

    :array_76
    .array-data 4
        0x7f08005d
        0x7f08005c
        0x7f08005b
        0x7f080060
        0x7f08005e
        0x7f08005f
        0x7f08005a
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
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->M:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/app/Activity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    return-void
.end method

.method public final M()V
    .registers 10

    .line 1
    new-instance v0, Ld/a/b/f/b/h;

    invoke-direct {v0, p0}, Ld/a/b/f/b/h;-><init>(Landroid/content/Context;)V

    const-string v1, "\u9ed1"

    const-string v2, "\u767d"

    const-string v3, "\u7ea2"

    const-string v4, "\u7eff"

    const-string v5, "\u84dd"

    const-string v6, "\u9ec4"

    const-string v7, "\u9752"

    const-string v8, "\u7d2b"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v1

    .line 2
    invoke-virtual {v0, v1}, Ld/a/b/f/b/h;->a([Ljava/lang/String;)Ld/a/b/f/b/h;

    const/4 v1, 0x1

    new-array v1, v1, [I

    iget v2, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->J:I

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 3
    invoke-virtual {v0, v1}, Ld/a/b/f/b/h;->b([I)Ld/a/b/f/b/h;

    .line 4
    invoke-virtual {v0}, Ld/a/b/f/b/h;->k()Ld/a/b/f/b/h;

    .line 5
    invoke-virtual {v0, v3}, Ld/a/a/d$b;->c(Z)Ld/a/a/d$b;

    check-cast v0, Ld/a/b/f/b/h;

    new-instance v1, Lnet/nyx/postest/ui/activity/LcdActivity$c;

    invoke-direct {v1, p0}, Lnet/nyx/postest/ui/activity/LcdActivity$c;-><init>(Lnet/nyx/postest/ui/activity/LcdActivity;)V

    .line 6
    invoke-virtual {v0, v1}, Ld/a/b/f/b/h;->a(Ld/a/b/f/b/i;)Ld/a/b/f/b/h;

    .line 7
    invoke-virtual {v0}, Ld/a/a/d$b;->h()V

    return-void
.end method

.method public final N()V
    .registers 4

    .line 1
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ld/a/b/a;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".printerservice.LCD_SETTINGS"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public synthetic O()V
    .registers 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->L:Ld/a/c/a/a;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ld/a/c/a/a;->b(I)I

    move-result v0
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_7} :catch_8

    goto :goto_e

    :catch_8
    move-exception v0

    .line 2
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    const/16 v0, -0x44b

    .line 3
    :goto_e
    invoke-virtual {p0, v0}, Lnet/nyx/postest/ui/activity/LcdActivity;->f(I)V

    return-void
.end method

.method public synthetic P()V
    .registers 3

    const/16 v0, 0x64

    .line 1
    invoke-static {v0}, Lnet/nyx/postest/ui/activity/LcdActivity;->g(I)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xdc

    .line 2
    invoke-static {v0, v1, v1}, Ld/a/b/g/c;->a(Ljava/lang/String;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 3
    :try_start_c
    iget-object v1, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->L:Ld/a/c/a/a;

    invoke-interface {v1, v0}, Ld/a/c/a/a;->a(Landroid/graphics/Bitmap;)I

    move-result v0
    :try_end_12
    .catch Landroid/os/RemoteException; {:try_start_c .. :try_end_12} :catch_13

    goto :goto_19

    :catch_13
    move-exception v0

    .line 4
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    const/16 v0, -0x44b

    :goto_19
    if-eqz v0, :cond_22

    .line 5
    invoke-static {v0}, Ld/a/b/g/i;->a(I)I

    move-result v0

    invoke-interface {p0, v0}, Ld/a/b/b/e;->a(I)V

    :cond_22
    return-void
.end method

.method public final Q()V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->K:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Ld/a/b/f/a/e;

    invoke-direct {v1, p0}, Ld/a/b/f/a/e;-><init>(Lnet/nyx/postest/ui/activity/LcdActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public final R()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->M:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->unbindService(Landroid/content/ServiceConnection;)V

    return-void
.end method

.method public final S()V
    .registers 4

    .line 1
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ld/a/b/a;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".printerservice.UPGRADE"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "TYPE"

    const-string v2, "LCD"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final a(Z)V
    .registers 3

    if-nez p1, :cond_7

    const/4 p1, 0x0

    .line 33
    invoke-virtual {p0, p1}, Lnet/nyx/postest/ui/activity/LcdActivity;->b(Z)V

    return-void

    .line 34
    :cond_7
    iget-object p1, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->K:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Ld/a/b/f/a/f;

    invoke-direct {v0, p0}, Ld/a/b/f/a/f;-><init>(Lnet/nyx/postest/ui/activity/LcdActivity;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public final b(Z)V
    .registers 3

    .line 24
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->C:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 25
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->D:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 26
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->E:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 27
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->F:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 28
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->G:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 29
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->H:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 30
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->I:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method public final c(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->K:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Ld/a/b/f/a/h;

    invoke-direct {v1, p0, p1}, Ld/a/b/f/a/h;-><init>(Lnet/nyx/postest/ui/activity/LcdActivity;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public synthetic d(I)V
    .registers 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->L:Ld/a/c/a/a;

    invoke-interface {v0, p1}, Ld/a/c/a/a;->b(I)I

    move-result p1
    :try_end_6
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_6} :catch_7

    goto :goto_d

    :catch_7
    move-exception p1

    .line 2
    invoke-virtual {p1}, Landroid/os/RemoteException;->printStackTrace()V

    const/16 p1, -0x44b

    :goto_d
    if-eqz p1, :cond_16

    .line 3
    invoke-static {p1}, Ld/a/b/g/i;->a(I)I

    move-result p1

    invoke-interface {p0, p1}, Ld/a/b/b/e;->a(I)V

    :cond_16
    return-void
.end method

.method public synthetic e(I)V
    .registers 4

    if-nez p1, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, 0x0

    .line 1
    :goto_5
    invoke-virtual {p0, v0}, Lnet/nyx/postest/ui/activity/LcdActivity;->b(Z)V

    .line 2
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->B:Lnet/nyx/widget/layout/SettingBar;

    if-nez p1, :cond_10

    const v1, 0x7f0700a4

    goto :goto_13

    :cond_10
    const v1, 0x7f0700a3

    :goto_13
    invoke-virtual {v0, v1}, Lnet/nyx/widget/layout/SettingBar;->g(I)Lnet/nyx/widget/layout/SettingBar;

    if-nez p1, :cond_1c

    const p1, 0x7f0f005d

    goto :goto_35

    :cond_1c
    const/16 v0, -0x44c

    if-ne p1, v0, :cond_24

    const p1, 0x7f0f005c

    goto :goto_35

    :cond_24
    const/16 v0, -0x452

    if-eq p1, v0, :cond_32

    const/16 v0, -0x44f

    if-ne p1, v0, :cond_2d

    goto :goto_32

    .line 3
    :cond_2d
    invoke-static {p1}, Ld/a/b/g/i;->a(I)I

    move-result p1

    goto :goto_35

    :cond_32
    :goto_32
    const p1, 0x7f0f005a

    .line 4
    :goto_35
    iget-object v0, p0, Lnet/nyx/postest/ui/activity/LcdActivity;->B:Lnet/nyx/widget/layout/SettingBar;

    invoke-virtual {v0, p1}, Lnet/nyx/widget/layout/SettingBar;->k(I)Lnet/nyx/widget/layout/SettingBar;

    return-void
.end method

.method public final f(I)V
    .registers 3

    .line 1
    new-instance v0, Ld/a/b/f/a/g;

    invoke-direct {v0, p0, p1}, Ld/a/b/f/a/g;-><init>(Lnet/nyx/postest/ui/activity/LcdActivity;I)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 10
    .annotation runtime Ld/a/b/c/a;
    .end annotation

    .line 1
    sget-object v0, Lnet/nyx/postest/ui/activity/LcdActivity;->P:Le/a/a/a$a;

    invoke-static {v0, p0, p0, p1}, Le/a/b/a/b;->a(Le/a/a/a$a;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Le/a/a/a;

    move-result-object v3

    invoke-static {}, Ld/a/b/c/b;->b()Ld/a/b/c/b;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Le/a/a/c;

    sget-object v0, Lnet/nyx/postest/ui/activity/LcdActivity;->Q:Ljava/lang/annotation/Annotation;

    if-nez v0, :cond_29

    const-class v0, Lnet/nyx/postest/ui/activity/LcdActivity;

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

    sput-object v0, Lnet/nyx/postest/ui/activity/LcdActivity;->Q:Ljava/lang/annotation/Annotation;

    :cond_29
    move-object v6, v0

    check-cast v6, Ld/a/b/c/a;

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v6}, Lnet/nyx/postest/ui/activity/LcdActivity;->a(Lnet/nyx/postest/ui/activity/LcdActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V

    return-void
.end method

.method public onDestroy()V
    .registers 1

    .line 1
    invoke-super {p0}, Lnet/nyx/postest/base/AppActivity;->onDestroy()V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/ui/activity/LcdActivity;->R()V

    return-void
.end method

.method public onRightClick(Landroid/view/View;)V
    .registers 10
    .annotation runtime Ld/a/b/c/a;
    .end annotation

    .line 1
    sget-object v0, Lnet/nyx/postest/ui/activity/LcdActivity;->N:Le/a/a/a$a;

    invoke-static {v0, p0, p0, p1}, Le/a/b/a/b;->a(Le/a/a/a$a;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Le/a/a/a;

    move-result-object v3

    invoke-static {}, Ld/a/b/c/b;->b()Ld/a/b/c/b;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Le/a/a/c;

    sget-object v0, Lnet/nyx/postest/ui/activity/LcdActivity;->O:Ljava/lang/annotation/Annotation;

    if-nez v0, :cond_29

    const-class v0, Lnet/nyx/postest/ui/activity/LcdActivity;

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

    sput-object v0, Lnet/nyx/postest/ui/activity/LcdActivity;->O:Ljava/lang/annotation/Annotation;

    :cond_29
    move-object v6, v0

    check-cast v6, Ld/a/b/c/a;

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v6}, Lnet/nyx/postest/ui/activity/LcdActivity;->b(Lnet/nyx/postest/ui/activity/LcdActivity;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V

    return-void
.end method

.method public w()I
    .registers 2

    const v0, 0x7f0b001f

    return v0
.end method
