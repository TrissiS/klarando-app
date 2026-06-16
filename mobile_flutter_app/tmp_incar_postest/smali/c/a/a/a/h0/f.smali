.class public final Lc/a/a/a/h0/f;
.super Lc/a/a/a/h0/g;
.source "DeterminateDrawable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lc/a/a/a/h0/c;",
        ">",
        "Lc/a/a/a/h0/g;"
    }
.end annotation


# static fields
.field public static final B:Lb/k/a/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/k/a/c<",
            "Lc/a/a/a/h0/f;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public A:Z

.field public w:Lc/a/a/a/h0/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lc/a/a/a/h0/h<",
            "TS;>;"
        }
    .end annotation
.end field

.field public final x:Lb/k/a/e;

.field public final y:Lb/k/a/d;

.field public z:F


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    new-instance v0, Lc/a/a/a/h0/f$a;

    const-string v1, "indicatorLevel"

    invoke-direct {v0, v1}, Lc/a/a/a/h0/f$a;-><init>(Ljava/lang/String;)V

    sput-object v0, Lc/a/a/a/h0/f;->B:Lb/k/a/c;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lc/a/a/a/h0/c;Lc/a/a/a/h0/h;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lc/a/a/a/h0/c;",
            "Lc/a/a/a/h0/h<",
            "TS;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lc/a/a/a/h0/g;-><init>(Landroid/content/Context;Lc/a/a/a/h0/c;)V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lc/a/a/a/h0/f;->A:Z

    .line 3
    invoke-virtual {p0, p3}, Lc/a/a/a/h0/f;->a(Lc/a/a/a/h0/h;)V

    .line 4
    new-instance p1, Lb/k/a/e;

    invoke-direct {p1}, Lb/k/a/e;-><init>()V

    iput-object p1, p0, Lc/a/a/a/h0/f;->x:Lb/k/a/e;

    const/high16 p2, 0x3f800000    # 1.0f

    .line 5
    invoke-virtual {p1, p2}, Lb/k/a/e;->a(F)Lb/k/a/e;

    .line 6
    iget-object p1, p0, Lc/a/a/a/h0/f;->x:Lb/k/a/e;

    const/high16 p3, 0x42480000    # 50.0f

    invoke-virtual {p1, p3}, Lb/k/a/e;->c(F)Lb/k/a/e;

    .line 7
    new-instance p1, Lb/k/a/d;

    sget-object p3, Lc/a/a/a/h0/f;->B:Lb/k/a/c;

    invoke-direct {p1, p0, p3}, Lb/k/a/d;-><init>(Ljava/lang/Object;Lb/k/a/c;)V

    iput-object p1, p0, Lc/a/a/a/h0/f;->y:Lb/k/a/d;

    .line 8
    iget-object p3, p0, Lc/a/a/a/h0/f;->x:Lb/k/a/e;

    invoke-virtual {p1, p3}, Lb/k/a/d;->a(Lb/k/a/e;)Lb/k/a/d;

    .line 9
    invoke-virtual {p0, p2}, Lc/a/a/a/h0/g;->a(F)V

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/h0/f;)F
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/f;->i()F

    move-result p0

    return p0
.end method

.method public static a(Landroid/content/Context;Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;)Lc/a/a/a/h0/f;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;",
            ")",
            "Lc/a/a/a/h0/f<",
            "Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;",
            ">;"
        }
    .end annotation

    .line 4
    new-instance v0, Lc/a/a/a/h0/f;

    new-instance v1, Lc/a/a/a/h0/d;

    invoke-direct {v1, p1}, Lc/a/a/a/h0/d;-><init>(Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;)V

    invoke-direct {v0, p0, p1, v1}, Lc/a/a/a/h0/f;-><init>(Landroid/content/Context;Lc/a/a/a/h0/c;Lc/a/a/a/h0/h;)V

    return-object v0
.end method

.method public static a(Landroid/content/Context;Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;)Lc/a/a/a/h0/f;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;",
            ")",
            "Lc/a/a/a/h0/f<",
            "Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;",
            ">;"
        }
    .end annotation

    .line 3
    new-instance v0, Lc/a/a/a/h0/f;

    new-instance v1, Lc/a/a/a/h0/k;

    invoke-direct {v1, p1}, Lc/a/a/a/h0/k;-><init>(Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;)V

    invoke-direct {v0, p0, p1, v1}, Lc/a/a/a/h0/f;-><init>(Landroid/content/Context;Lc/a/a/a/h0/c;Lc/a/a/a/h0/h;)V

    return-object v0
.end method

.method public static synthetic a(Lc/a/a/a/h0/f;F)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/h0/f;->b(F)V

    return-void
.end method


# virtual methods
.method public a(Lc/a/a/a/h0/h;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lc/a/a/a/h0/h<",
            "TS;>;)V"
        }
    .end annotation

    .line 5
    iput-object p1, p0, Lc/a/a/a/h0/f;->w:Lc/a/a/a/h0/h;

    .line 6
    invoke-virtual {p1, p0}, Lc/a/a/a/h0/h;->a(Lc/a/a/a/h0/g;)V

    return-void
.end method

.method public final b(F)V
    .registers 2

    .line 7
    iput p1, p0, Lc/a/a/a/h0/f;->z:F

    .line 8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public b(ZZZ)Z
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3}, Lc/a/a/a/h0/g;->b(ZZZ)Z

    move-result p1

    .line 2
    iget-object p2, p0, Lc/a/a/a/h0/g;->j:Lc/a/a/a/h0/a;

    iget-object p3, p0, Lc/a/a/a/h0/g;->h:Landroid/content/Context;

    .line 3
    invoke-virtual {p3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    invoke-virtual {p2, p3}, Lc/a/a/a/h0/a;->a(Landroid/content/ContentResolver;)F

    move-result p2

    const/4 p3, 0x0

    cmpl-float p3, p2, p3

    if-nez p3, :cond_19

    const/4 p2, 0x1

    .line 4
    iput-boolean p2, p0, Lc/a/a/a/h0/f;->A:Z

    goto :goto_24

    :cond_19
    const/4 p3, 0x0

    .line 5
    iput-boolean p3, p0, Lc/a/a/a/h0/f;->A:Z

    .line 6
    iget-object p3, p0, Lc/a/a/a/h0/f;->x:Lb/k/a/e;

    const/high16 v0, 0x42480000    # 50.0f

    div-float/2addr v0, p2

    invoke-virtual {p3, v0}, Lb/k/a/e;->c(F)Lb/k/a/e;

    :goto_24
    return p1
.end method

.method public c(F)V
    .registers 3

    const v0, 0x461c4000    # 10000.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    .line 1
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 10

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4e

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_4e

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    move-result v0

    if-nez v0, :cond_1c

    goto :goto_4e

    .line 3
    :cond_1c
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/f;->w:Lc/a/a/a/h0/h;

    invoke-virtual {p0}, Lc/a/a/a/h0/g;->c()F

    move-result v1

    invoke-virtual {v0, p1, v1}, Lc/a/a/a/h0/h;->b(Landroid/graphics/Canvas;F)V

    .line 5
    iget-object v0, p0, Lc/a/a/a/h0/f;->w:Lc/a/a/a/h0/h;

    iget-object v1, p0, Lc/a/a/a/h0/g;->t:Landroid/graphics/Paint;

    invoke-virtual {v0, p1, v1}, Lc/a/a/a/h0/h;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    .line 6
    iget-object v0, p0, Lc/a/a/a/h0/g;->i:Lc/a/a/a/h0/c;

    iget-object v0, v0, Lc/a/a/a/h0/c;->c:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    .line 7
    invoke-virtual {p0}, Lc/a/a/a/h0/g;->getAlpha()I

    move-result v1

    invoke-static {v0, v1}, Lc/a/a/a/w/a;->a(II)I

    move-result v7

    .line 8
    iget-object v2, p0, Lc/a/a/a/h0/f;->w:Lc/a/a/a/h0/h;

    iget-object v4, p0, Lc/a/a/a/h0/g;->t:Landroid/graphics/Paint;

    const/4 v5, 0x0

    invoke-virtual {p0}, Lc/a/a/a/h0/f;->i()F

    move-result v6

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lc/a/a/a/h0/h;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFI)V

    .line 9
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_4e
    :goto_4e
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/f;->w:Lc/a/a/a/h0/h;

    invoke-virtual {v0}, Lc/a/a/a/h0/h;->a()I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/f;->w:Lc/a/a/a/h0/h;

    invoke-virtual {v0}, Lc/a/a/a/h0/h;->b()I

    move-result v0

    return v0
.end method

.method public h()Lc/a/a/a/h0/h;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lc/a/a/a/h0/h<",
            "TS;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/f;->w:Lc/a/a/a/h0/h;

    return-object v0
.end method

.method public final i()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/h0/f;->z:F

    return v0
.end method

.method public jumpToCurrentState()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/f;->y:Lb/k/a/d;

    invoke-virtual {v0}, Lb/k/a/b;->a()V

    .line 2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x461c4000    # 10000.0f

    div-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lc/a/a/a/h0/f;->b(F)V

    return-void
.end method

.method public onLevelChange(I)Z
    .registers 5

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/h0/f;->A:Z

    const v1, 0x461c4000    # 10000.0f

    if-eqz v0, :cond_12

    .line 2
    iget-object v0, p0, Lc/a/a/a/h0/f;->y:Lb/k/a/d;

    invoke-virtual {v0}, Lb/k/a/b;->a()V

    int-to-float p1, p1

    div-float/2addr p1, v1

    .line 3
    invoke-virtual {p0, p1}, Lc/a/a/a/h0/f;->b(F)V

    goto :goto_23

    .line 4
    :cond_12
    iget-object v0, p0, Lc/a/a/a/h0/f;->y:Lb/k/a/d;

    invoke-virtual {p0}, Lc/a/a/a/h0/f;->i()F

    move-result v2

    mul-float v2, v2, v1

    invoke-virtual {v0, v2}, Lb/k/a/b;->b(F)Lb/k/a/b;

    .line 5
    iget-object v0, p0, Lc/a/a/a/h0/f;->y:Lb/k/a/d;

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Lb/k/a/d;->c(F)V

    :goto_23
    const/4 p1, 0x1

    return p1
.end method
