.class public final Ld/a/b/f/b/e;
.super Ld/a/b/f/b/a;
.source "MessageDialog.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ld/a/b/f/b/a<",
        "Ld/a/b/f/b/e;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic K:Le/a/a/a$a;

.field public static synthetic L:Ljava/lang/annotation/Annotation;


# instance fields
.field public I:Ld/a/b/f/b/f;

.field public final J:Landroid/widget/TextView;


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    .line 1
    invoke-static {}, Ld/a/b/f/b/e;->j()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Ld/a/b/f/b/a;-><init>(Landroid/content/Context;)V

    const p1, 0x7f0b0039

    .line 2
    invoke-virtual {p0, p1}, Ld/a/b/f/b/a;->i(I)Ld/a/b/f/b/a;

    const p1, 0x7f0801ef

    .line 3
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Ld/a/b/f/b/e;->J:Landroid/widget/TextView;

    return-void
.end method

.method public static final synthetic a(Ld/a/b/f/b/e;Landroid/view/View;Le/a/a/a;)V
    .registers 3

    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const p2, 0x7f0801e9

    if-ne p1, p2, :cond_19

    .line 26
    invoke-virtual {p0}, Ld/a/b/f/b/a;->i()V

    .line 27
    iget-object p1, p0, Ld/a/b/f/b/e;->I:Ld/a/b/f/b/f;

    if-nez p1, :cond_11

    return-void

    .line 28
    :cond_11
    invoke-virtual {p0}, Ld/a/a/d$b;->c()Ld/a/a/d;

    move-result-object p0

    invoke-interface {p1, p0}, Ld/a/b/f/b/f;->b(Ld/a/a/d;)V

    goto :goto_2d

    :cond_19
    const p2, 0x7f0801e8

    if-ne p1, p2, :cond_2d

    .line 29
    invoke-virtual {p0}, Ld/a/b/f/b/a;->i()V

    .line 30
    iget-object p1, p0, Ld/a/b/f/b/e;->I:Ld/a/b/f/b/f;

    if-nez p1, :cond_26

    return-void

    .line 31
    :cond_26
    invoke-virtual {p0}, Ld/a/a/d$b;->c()Ld/a/a/d;

    move-result-object p0

    invoke-interface {p1, p0}, Ld/a/b/f/b/f;->a(Ld/a/a/d;)V

    :cond_2d
    :goto_2d
    return-void
.end method

.method public static final synthetic a(Ld/a/b/f/b/e;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V
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
    invoke-static {p0, p1, p4}, Ld/a/b/f/b/e;->a(Ld/a/b/f/b/e;Landroid/view/View;Le/a/a/a;)V

    return-void
.end method

.method public static synthetic j()V
    .registers 9

    .line 1
    new-instance v8, Le/a/b/a/b;

    const-class v0, Ld/a/b/f/b/e;

    const-string v1, "MessageDialog.java"

    invoke-direct {v8, v1, v0}, Le/a/b/a/b;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v1, "1"

    const-string v2, "onClick"

    const-string v3, "net.nyx.postest.ui.dialog.MessageDialog$Builder"

    const-string v4, "android.view.View"

    const-string v5, "view"

    const-string v6, ""

    const-string v7, "void"

    move-object v0, v8

    invoke-virtual/range {v0 .. v7}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Le/a/a/e/c;

    move-result-object v0

    const-string v1, "method-execution"

    const/16 v2, 0x3d

    invoke-virtual {v8, v1, v0, v2}, Le/a/b/a/b;->a(Ljava/lang/String;Le/a/a/d;I)Le/a/a/a$a;

    move-result-object v0

    sput-object v0, Ld/a/b/f/b/e;->K:Le/a/a/a$a;

    return-void
.end method


# virtual methods
.method public a()Ld/a/a/d;
    .registers 3

    .line 22
    iget-object v0, p0, Ld/a/b/f/b/e;->J:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 23
    invoke-super {p0}, Ld/a/a/d$b;->a()Ld/a/a/d;

    move-result-object v0

    return-object v0

    .line 24
    :cond_17
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Dialog message not null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Ld/a/b/f/b/f;)Ld/a/b/f/b/e;
    .registers 2

    .line 21
    iput-object p1, p0, Ld/a/b/f/b/e;->I:Ld/a/b/f/b/f;

    return-object p0
.end method

.method public d(Ljava/lang/CharSequence;)Ld/a/b/f/b/e;
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/f/b/e;->J:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public k(I)Ld/a/b/f/b/e;
    .registers 2

    .line 1
    invoke-interface {p0, p1}, Ld/a/a/g/k;->a(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ld/a/b/f/b/e;->d(Ljava/lang/CharSequence;)Ld/a/b/f/b/e;

    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .registers 10
    .annotation runtime Ld/a/b/c/a;
    .end annotation

    .line 1
    sget-object v0, Ld/a/b/f/b/e;->K:Le/a/a/a$a;

    invoke-static {v0, p0, p0, p1}, Le/a/b/a/b;->a(Le/a/a/a$a;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Le/a/a/a;

    move-result-object v3

    invoke-static {}, Ld/a/b/c/b;->b()Ld/a/b/c/b;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Le/a/a/c;

    sget-object v0, Ld/a/b/f/b/e;->L:Ljava/lang/annotation/Annotation;

    if-nez v0, :cond_29

    const-class v0, Ld/a/b/f/b/e;

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

    sput-object v0, Ld/a/b/f/b/e;->L:Ljava/lang/annotation/Annotation;

    :cond_29
    move-object v6, v0

    check-cast v6, Ld/a/b/c/a;

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v6}, Ld/a/b/f/b/e;->a(Ld/a/b/f/b/e;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V

    return-void
.end method
