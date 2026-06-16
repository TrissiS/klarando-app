.class public Ld/a/d/g/d;
.super Ljava/lang/Object;
.source "Overlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld/a/d/g/d$b;,
        Ld/a/d/g/d$a;
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ld/a/d/g/d$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:Z

.field public d:Landroid/view/View$OnClickListener;

.field public e:Landroid/view/View$OnClickListener;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ld/a/d/g/d;->a:Ljava/util/List;

    const-string v0, "#80000000"

    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ld/a/d/g/d;->b:I

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Ld/a/d/g/d;->c:Z

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ld/a/d/g/d;->f:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 11
    iget v0, p0, Ld/a/d/g/d;->b:I

    return v0
.end method

.method public a(Landroid/view/View$OnClickListener;)Ld/a/d/g/d;
    .registers 2

    .line 10
    iput-object p1, p0, Ld/a/d/g/d;->e:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method public a(Landroid/view/View;[IILd/a/d/g/d$b;)Ld/a/d/g/d;
    .registers 6

    .line 1
    new-instance v0, Ld/a/d/g/d$a;

    invoke-direct {v0, p1, p2, p3, p4}, Ld/a/d/g/d$a;-><init>(Landroid/view/View;[IILd/a/d/g/d$b;)V

    .line 2
    iget-object p1, p0, Ld/a/d/g/d;->a:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3
    invoke-virtual {p0, v0}, Ld/a/d/g/d;->a(Ld/a/d/g/d$a;)V

    return-object p0
.end method

.method public final a(Ld/a/d/g/d$a;)V
    .registers 8

    .line 4
    invoke-virtual {p1}, Ld/a/d/g/d$a;->b()Landroid/graphics/RectF;

    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ld/a/d/g/d$a;->c()I

    move-result v1

    const/16 v2, 0x21

    if-eq v1, v2, :cond_12

    .line 6
    iget-object p1, p0, Ld/a/d/g/d;->f:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_32

    .line 7
    :cond_12
    iget-object v1, p0, Ld/a/d/g/d;->f:Ljava/util/List;

    new-instance v2, Landroid/graphics/RectF;

    iget v3, v0, Landroid/graphics/RectF;->left:F

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v4

    invoke-virtual {p1}, Ld/a/d/g/d$a;->a()F

    move-result v5

    sub-float/2addr v4, v5

    iget v5, v0, Landroid/graphics/RectF;->right:F

    .line 8
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    invoke-virtual {p1}, Ld/a/d/g/d$a;->a()F

    move-result p1

    add-float/2addr v0, p1

    invoke-direct {v2, v3, v4, v5, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 9
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_32
    return-void
.end method

.method public b()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/d/g/d;->f:Ljava/util/List;

    return-object v0
.end method

.method public c()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ld/a/d/g/d$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/d/g/d;->a:Ljava/util/List;

    return-object v0
.end method

.method public d()Landroid/view/View$OnClickListener;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/d/g/d;->d:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method public e()Landroid/view/View$OnClickListener;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/d/g/d;->e:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method public f()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Ld/a/d/g/d;->c:Z

    return v0
.end method
