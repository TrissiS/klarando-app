.class public final Ld/a/b/f/b/b;
.super Ld/a/b/f/b/a;
.source "ImageFlipDialog.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ld/a/b/f/b/a<",
        "Ld/a/b/f/b/b;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic P:Le/a/a/a$a;

.field public static synthetic Q:Ljava/lang/annotation/Annotation;


# instance fields
.field public I:Ld/a/b/f/b/d;

.field public final J:Landroid/widget/ImageView;

.field public final K:Landroid/widget/ImageView;

.field public final L:Landroid/widget/ImageView;

.field public M:I

.field public N:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public O:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    .line 1
    invoke-static {}, Ld/a/b/f/b/b;->j()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    .line 1
    invoke-direct {p0, p1}, Ld/a/b/f/b/a;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 2
    iput p1, p0, Ld/a/b/f/b/b;->M:I

    .line 3
    invoke-interface {p0}, Ld/a/a/g/k;->d()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p1, p1

    const/high16 v0, 0x41200000    # 10.0f

    div-float/2addr p1, v0

    const/high16 v0, 0x41100000    # 9.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    .line 4
    invoke-interface {p0}, Ld/a/a/g/k;->d()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_31

    .line 5
    invoke-interface {p0}, Ld/a/a/g/k;->d()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/2addr p1, v1

    :cond_31
    const v0, 0x7f0b0035

    .line 6
    invoke-virtual {p0, v0}, Ld/a/b/f/b/a;->i(I)Ld/a/b/f/b/a;

    move-object v0, p0

    check-cast v0, Ld/a/b/f/b/b;

    const/4 v2, 0x0

    .line 7
    invoke-virtual {v0, v2}, Ld/a/b/f/b/a;->a(Ljava/lang/CharSequence;)Ld/a/b/f/b/a;

    check-cast v0, Ld/a/b/f/b/b;

    .line 8
    invoke-virtual {v0, p1}, Ld/a/a/d$b;->f(I)Ld/a/a/d$b;

    const p1, 0x7f0800db

    .line 9
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Ld/a/b/f/b/b;->J:Landroid/widget/ImageView;

    const p1, 0x7f0800da

    .line 10
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Ld/a/b/f/b/b;->K:Landroid/widget/ImageView;

    const p1, 0x7f0800d9

    .line 11
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Ld/a/b/f/b/b;->L:Landroid/widget/ImageView;

    new-array p1, v1, [I

    .line 12
    fill-array-data p1, :array_6e

    invoke-interface {p0, p1}, Ld/a/a/g/e;->a([I)V

    return-void

    nop

    :array_6e
    .array-data 4
        0x7f0800da
        0x7f0800d9
    .end array-data
.end method

.method public static final synthetic a(Ld/a/b/f/b/b;Landroid/view/View;Le/a/a/a;)V
    .registers 3

    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const p2, 0x7f0801e9

    if-ne p1, p2, :cond_18

    .line 33
    iget-object p1, p0, Ld/a/b/f/b/b;->I:Ld/a/b/f/b/d;

    if-nez p1, :cond_e

    return-void

    .line 34
    :cond_e
    invoke-virtual {p0}, Ld/a/a/d$b;->c()Ld/a/a/d;

    move-result-object p2

    iget p0, p0, Ld/a/b/f/b/b;->M:I

    invoke-interface {p1, p2, p0}, Ld/a/b/f/b/d;->a(Ld/a/a/d;I)V

    goto :goto_40

    :cond_18
    const p2, 0x7f0801e8

    if-ne p1, p2, :cond_2d

    .line 35
    invoke-virtual {p0}, Ld/a/b/f/b/a;->i()V

    .line 36
    iget-object p1, p0, Ld/a/b/f/b/b;->I:Ld/a/b/f/b/d;

    if-nez p1, :cond_25

    return-void

    .line 37
    :cond_25
    invoke-virtual {p0}, Ld/a/a/d$b;->c()Ld/a/a/d;

    move-result-object p0

    invoke-interface {p1, p0}, Ld/a/b/f/b/d;->a(Ld/a/a/d;)V

    goto :goto_40

    :cond_2d
    const p2, 0x7f0800da

    if-ne p1, p2, :cond_37

    const/4 p1, -0x1

    .line 38
    invoke-virtual {p0, p1}, Ld/a/b/f/b/b;->k(I)V

    goto :goto_40

    :cond_37
    const p2, 0x7f0800d9

    if-ne p1, p2, :cond_40

    const/4 p1, 0x1

    .line 39
    invoke-virtual {p0, p1}, Ld/a/b/f/b/b;->k(I)V

    :cond_40
    :goto_40
    return-void
.end method

.method public static final synthetic a(Ld/a/b/f/b/b;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V
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
    invoke-static {p0, p1, p4}, Ld/a/b/f/b/b;->a(Ld/a/b/f/b/b;Landroid/view/View;Le/a/a/a;)V

    return-void
.end method

.method public static synthetic j()V
    .registers 9

    .line 1
    new-instance v8, Le/a/b/a/b;

    const-class v0, Ld/a/b/f/b/b;

    const-string v1, "ImageFlipDialog.java"

    invoke-direct {v8, v1, v0}, Le/a/b/a/b;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v1, "1"

    const-string v2, "onClick"

    const-string v3, "net.nyx.postest.ui.dialog.ImageFlipDialog$Builder"

    const-string v4, "android.view.View"

    const-string v5, "view"

    const-string v6, ""

    const-string v7, "void"

    move-object v0, v8

    invoke-virtual/range {v0 .. v7}, Le/a/b/a/b;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Le/a/a/e/c;

    move-result-object v0

    const-string v1, "method-execution"

    const/16 v2, 0x4a

    invoke-virtual {v8, v1, v0, v2}, Le/a/b/a/b;->a(Ljava/lang/String;Le/a/a/d;I)Le/a/a/a$a;

    move-result-object v0

    sput-object v0, Ld/a/b/f/b/b;->P:Le/a/a/a$a;

    return-void
.end method


# virtual methods
.method public a()Ld/a/a/d;
    .registers 4

    .line 24
    iget-object v0, p0, Ld/a/b/f/b/b;->N:Ljava/util/List;

    if-eqz v0, :cond_26

    .line 25
    iget-object v1, p0, Ld/a/b/f/b/b;->J:Landroid/widget/ImageView;

    iget v2, p0, Ld/a/b/f/b/b;->M:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 26
    iget-object v0, p0, Ld/a/b/f/b/b;->N:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_26

    .line 27
    iget-object v0, p0, Ld/a/b/f/b/b;->K:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 28
    iget-object v0, p0, Ld/a/b/f/b/b;->L:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 29
    :cond_26
    iget-object v0, p0, Ld/a/b/f/b/b;->O:Ljava/util/List;

    if-eqz v0, :cond_35

    .line 30
    iget v1, p0, Ld/a/b/f/b/b;->M:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Ld/a/b/f/b/a;->c(Ljava/lang/CharSequence;)Ld/a/b/f/b/a;

    .line 31
    :cond_35
    invoke-super {p0}, Ld/a/a/d$b;->a()Ld/a/a/d;

    move-result-object v0

    return-object v0
.end method

.method public a(Ld/a/b/f/b/d;)Ld/a/b/f/b/b;
    .registers 2

    .line 23
    iput-object p1, p0, Ld/a/b/f/b/b;->I:Ld/a/b/f/b/d;

    return-object p0
.end method

.method public a(Ljava/util/List;Ljava/util/List;)Ld/a/b/f/b/b;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ld/a/b/f/b/b;"
        }
    .end annotation

    .line 21
    iput-object p1, p0, Ld/a/b/f/b/b;->N:Ljava/util/List;

    .line 22
    iput-object p2, p0, Ld/a/b/f/b/b;->O:Ljava/util/List;

    return-object p0
.end method

.method public final k(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Ld/a/b/f/b/b;->N:Ljava/util/List;

    if-eqz v0, :cond_3b

    .line 2
    iget v1, p0, Ld/a/b/f/b/b;->M:I

    add-int/2addr v1, p1

    iput v1, p0, Ld/a/b/f/b/b;->M:I

    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    .line 4
    iget v0, p0, Ld/a/b/f/b/b;->M:I

    if-gez v0, :cond_1a

    add-int/lit8 v1, p1, -0x1

    .line 5
    rem-int/2addr v0, v1

    iput v0, p0, Ld/a/b/f/b/b;->M:I

    add-int/2addr p1, v0

    .line 6
    iput p1, p0, Ld/a/b/f/b/b;->M:I

    goto :goto_1f

    :cond_1a
    if-lt v0, p1, :cond_1f

    .line 7
    rem-int/2addr v0, p1

    iput v0, p0, Ld/a/b/f/b/b;->M:I

    .line 8
    :cond_1f
    :goto_1f
    iget-object p1, p0, Ld/a/b/f/b/b;->J:Landroid/widget/ImageView;

    iget-object v0, p0, Ld/a/b/f/b/b;->N:Ljava/util/List;

    iget v1, p0, Ld/a/b/f/b/b;->M:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 9
    iget-object p1, p0, Ld/a/b/f/b/b;->O:Ljava/util/List;

    iget v0, p0, Ld/a/b/f/b/b;->M:I

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Ld/a/b/f/b/a;->c(Ljava/lang/CharSequence;)Ld/a/b/f/b/a;

    :cond_3b
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 10
    .annotation runtime Ld/a/b/c/a;
    .end annotation

    .line 1
    sget-object v0, Ld/a/b/f/b/b;->P:Le/a/a/a$a;

    invoke-static {v0, p0, p0, p1}, Le/a/b/a/b;->a(Le/a/a/a$a;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Le/a/a/a;

    move-result-object v3

    invoke-static {}, Ld/a/b/c/b;->b()Ld/a/b/c/b;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Le/a/a/c;

    sget-object v0, Ld/a/b/f/b/b;->Q:Ljava/lang/annotation/Annotation;

    if-nez v0, :cond_29

    const-class v0, Ld/a/b/f/b/b;

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

    sput-object v0, Ld/a/b/f/b/b;->Q:Ljava/lang/annotation/Annotation;

    :cond_29
    move-object v6, v0

    check-cast v6, Ld/a/b/c/a;

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v6}, Ld/a/b/f/b/b;->a(Ld/a/b/f/b/b;Landroid/view/View;Le/a/a/a;Ld/a/b/c/b;Le/a/a/c;Ld/a/b/c/a;)V

    return-void
.end method
