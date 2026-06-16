.class public Ld/a/d/g/d$a;
.super Ljava/lang/Object;
.source "Overlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/a/d/g/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/graphics/RectF;

.field public c:I

.field public d:F

.field public e:Ld/a/d/g/d$b;


# direct methods
.method public constructor <init>(Landroid/view/View;[IILd/a/d/g/d$b;)V
    .registers 12

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Ld/a/d/g/d$a;->a:Landroid/view/View;

    .line 3
    iput p3, p0, Ld/a/d/g/d$a;->c:I

    .line 4
    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Ld/a/d/g/d$a;->b:Landroid/graphics/RectF;

    const/4 p3, 0x2

    new-array v0, p3, [I

    .line 5
    iget-object v1, p0, Ld/a/d/g/d$a;->a:Landroid/view/View;

    invoke-static {v1}, Ld/a/d/g/a;->b(Landroid/view/View;)[I

    move-result-object v1

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    if-nez p2, :cond_1e

    new-array p2, p3, [I

    .line 7
    :cond_1e
    iget-object p1, p0, Ld/a/d/g/d$a;->b:Landroid/graphics/RectF;

    const/4 p3, 0x0

    aget v2, v0, p3

    aget v3, p2, p3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    iput v2, p1, Landroid/graphics/RectF;->left:F

    const/4 v3, 0x1

    .line 8
    aget v4, v0, v3

    aget v5, p2, v3

    sub-int/2addr v4, v5

    int-to-float v4, v4

    iput v4, p1, Landroid/graphics/RectF;->top:F

    .line 9
    aget v5, v0, p3

    aget v6, v1, p3

    add-int/2addr v5, v6

    aget p3, p2, p3

    add-int/2addr v5, p3

    int-to-float p3, v5

    iput p3, p1, Landroid/graphics/RectF;->right:F

    .line 10
    aget v0, v0, v3

    aget v1, v1, v3

    add-int/2addr v0, v1

    aget p2, p2, v3

    add-int/2addr v0, p2

    int-to-float p2, v0

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p3, v2

    const/high16 p1, 0x40000000    # 2.0f

    div-float/2addr p3, p1

    sub-float/2addr p2, v4

    div-float/2addr p2, p1

    .line 11
    invoke-static {p3, p2}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Ld/a/d/g/d$a;->d:F

    .line 12
    iput-object p4, p0, Ld/a/d/g/d$a;->e:Ld/a/d/g/d$b;

    return-void
.end method


# virtual methods
.method public a()F
    .registers 2

    .line 1
    iget v0, p0, Ld/a/d/g/d$a;->d:F

    return v0
.end method

.method public b()Landroid/graphics/RectF;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/d/g/d$a;->b:Landroid/graphics/RectF;

    return-object v0
.end method

.method public c()I
    .registers 2

    .line 1
    iget v0, p0, Ld/a/d/g/d$a;->c:I

    return v0
.end method

.method public d()Ld/a/d/g/d$b;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/d/g/d$a;->e:Ld/a/d/g/d$b;

    return-object v0
.end method
