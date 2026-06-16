.class public final Lc/a/a/a/h0/j;
.super Lc/a/a/a/h0/g;
.source "IndeterminateDrawable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lc/a/a/a/h0/c;",
        ">",
        "Lc/a/a/a/h0/g;"
    }
.end annotation


# instance fields
.field public w:Lc/a/a/a/h0/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lc/a/a/a/h0/h<",
            "TS;>;"
        }
    .end annotation
.end field

.field public x:Lc/a/a/a/h0/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lc/a/a/a/h0/i<",
            "Landroid/animation/ObjectAnimator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lc/a/a/a/h0/c;Lc/a/a/a/h0/h;Lc/a/a/a/h0/i;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lc/a/a/a/h0/c;",
            "Lc/a/a/a/h0/h<",
            "TS;>;",
            "Lc/a/a/a/h0/i<",
            "Landroid/animation/ObjectAnimator;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lc/a/a/a/h0/g;-><init>(Landroid/content/Context;Lc/a/a/a/h0/c;)V

    .line 2
    invoke-virtual {p0, p3}, Lc/a/a/a/h0/j;->a(Lc/a/a/a/h0/h;)V

    .line 3
    invoke-virtual {p0, p4}, Lc/a/a/a/h0/j;->a(Lc/a/a/a/h0/i;)V

    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;)Lc/a/a/a/h0/j;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;",
            ")",
            "Lc/a/a/a/h0/j<",
            "Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;",
            ">;"
        }
    .end annotation

    .line 2
    new-instance v0, Lc/a/a/a/h0/j;

    new-instance v1, Lc/a/a/a/h0/d;

    invoke-direct {v1, p1}, Lc/a/a/a/h0/d;-><init>(Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;)V

    new-instance v2, Lc/a/a/a/h0/e;

    invoke-direct {v2, p1}, Lc/a/a/a/h0/e;-><init>(Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;)V

    invoke-direct {v0, p0, p1, v1, v2}, Lc/a/a/a/h0/j;-><init>(Landroid/content/Context;Lc/a/a/a/h0/c;Lc/a/a/a/h0/h;Lc/a/a/a/h0/i;)V

    return-object v0
.end method

.method public static a(Landroid/content/Context;Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;)Lc/a/a/a/h0/j;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;",
            ")",
            "Lc/a/a/a/h0/j<",
            "Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lc/a/a/a/h0/j;

    new-instance v1, Lc/a/a/a/h0/k;

    invoke-direct {v1, p1}, Lc/a/a/a/h0/k;-><init>(Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;)V

    iget v2, p1, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;->g:I

    if-nez v2, :cond_11

    new-instance v2, Lc/a/a/a/h0/l;

    invoke-direct {v2, p1}, Lc/a/a/a/h0/l;-><init>(Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;)V

    goto :goto_16

    :cond_11
    new-instance v2, Lc/a/a/a/h0/m;

    invoke-direct {v2, p0, p1}, Lc/a/a/a/h0/m;-><init>(Landroid/content/Context;Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;)V

    :goto_16
    invoke-direct {v0, p0, p1, v1, v2}, Lc/a/a/a/h0/j;-><init>(Landroid/content/Context;Lc/a/a/a/h0/c;Lc/a/a/a/h0/h;Lc/a/a/a/h0/i;)V

    return-object v0
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
    iput-object p1, p0, Lc/a/a/a/h0/j;->w:Lc/a/a/a/h0/h;

    .line 6
    invoke-virtual {p1, p0}, Lc/a/a/a/h0/h;->a(Lc/a/a/a/h0/g;)V

    return-void
.end method

.method public a(Lc/a/a/a/h0/i;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lc/a/a/a/h0/i<",
            "Landroid/animation/ObjectAnimator;",
            ">;)V"
        }
    .end annotation

    .line 3
    iput-object p1, p0, Lc/a/a/a/h0/j;->x:Lc/a/a/a/h0/i;

    .line 4
    invoke-virtual {p1, p0}, Lc/a/a/a/h0/i;->a(Lc/a/a/a/h0/j;)V

    return-void
.end method

.method public b(ZZZ)Z
    .registers 6

    .line 1
    invoke-super {p0, p1, p2, p3}, Lc/a/a/a/h0/g;->b(ZZZ)Z

    move-result p2

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/h0/g;->isRunning()Z

    move-result v0

    if-nez v0, :cond_f

    .line 3
    iget-object v0, p0, Lc/a/a/a/h0/j;->x:Lc/a/a/a/h0/i;

    invoke-virtual {v0}, Lc/a/a/a/h0/i;->a()V

    .line 4
    :cond_f
    iget-object v0, p0, Lc/a/a/a/h0/g;->j:Lc/a/a/a/h0/a;

    iget-object v1, p0, Lc/a/a/a/h0/g;->h:Landroid/content/Context;

    .line 5
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc/a/a/a/h0/a;->a(Landroid/content/ContentResolver;)F

    move-result v0

    if-eqz p1, :cond_2f

    if-nez p3, :cond_2a

    .line 6
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x15

    if-gt p1, p3, :cond_2f

    const/4 p1, 0x0

    cmpl-float p1, v0, p1

    if-lez p1, :cond_2f

    .line 7
    :cond_2a
    iget-object p1, p0, Lc/a/a/a/h0/j;->x:Lc/a/a/a/h0/i;

    invoke-virtual {p1}, Lc/a/a/a/h0/i;->d()V

    :cond_2f
    return p2
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 12

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_51

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_51

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    move-result v0

    if-nez v0, :cond_1c

    goto :goto_51

    .line 3
    :cond_1c
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 4
    iget-object v0, p0, Lc/a/a/a/h0/j;->w:Lc/a/a/a/h0/h;

    invoke-virtual {p0}, Lc/a/a/a/h0/g;->c()F

    move-result v1

    invoke-virtual {v0, p1, v1}, Lc/a/a/a/h0/h;->b(Landroid/graphics/Canvas;F)V

    .line 5
    iget-object v0, p0, Lc/a/a/a/h0/j;->w:Lc/a/a/a/h0/h;

    iget-object v1, p0, Lc/a/a/a/h0/g;->t:Landroid/graphics/Paint;

    invoke-virtual {v0, p1, v1}, Lc/a/a/a/h0/h;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    const/4 v0, 0x0

    .line 6
    :goto_30
    iget-object v1, p0, Lc/a/a/a/h0/j;->x:Lc/a/a/a/h0/i;

    iget-object v2, v1, Lc/a/a/a/h0/i;->c:[I

    array-length v3, v2

    if-ge v0, v3, :cond_4e

    .line 7
    iget-object v4, p0, Lc/a/a/a/h0/j;->w:Lc/a/a/a/h0/h;

    iget-object v6, p0, Lc/a/a/a/h0/g;->t:Landroid/graphics/Paint;

    iget-object v1, v1, Lc/a/a/a/h0/i;->b:[F

    mul-int/lit8 v3, v0, 0x2

    aget v7, v1, v3

    add-int/lit8 v3, v3, 0x1

    aget v8, v1, v3

    aget v9, v2, v0

    move-object v5, p1

    invoke-virtual/range {v4 .. v9}, Lc/a/a/a/h0/h;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFI)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_30

    .line 8
    :cond_4e
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_51
    :goto_51
    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/j;->w:Lc/a/a/a/h0/h;

    invoke-virtual {v0}, Lc/a/a/a/h0/h;->a()I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/j;->w:Lc/a/a/a/h0/h;

    invoke-virtual {v0}, Lc/a/a/a/h0/h;->b()I

    move-result v0

    return v0
.end method

.method public h()Lc/a/a/a/h0/i;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lc/a/a/a/h0/i<",
            "Landroid/animation/ObjectAnimator;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/j;->x:Lc/a/a/a/h0/i;

    return-object v0
.end method

.method public i()Lc/a/a/a/h0/h;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lc/a/a/a/h0/h<",
            "TS;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/j;->w:Lc/a/a/a/h0/h;

    return-object v0
.end method
