.class public Lcom/google/android/material/circularreveal/CircularRevealGridLayout;
.super Landroid/widget/GridLayout;
.source "CircularRevealGridLayout.java"

# interfaces
.implements Lc/a/a/a/v/c;


# instance fields
.field public final h:Lc/a/a/a/v/b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 2
    invoke-direct {p0, p1, p2}, Landroid/widget/GridLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    new-instance p1, Lc/a/a/a/v/b;

    invoke-direct {p1, p0}, Lc/a/a/a/v/b;-><init>(Lc/a/a/a/v/b$a;)V

    iput-object p1, p0, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;->h:Lc/a/a/a/v/b;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;->h:Lc/a/a/a/v/b;

    invoke-virtual {v0}, Lc/a/a/a/v/b;->a()V

    return-void
.end method

.method public a(Landroid/graphics/Canvas;)V
    .registers 2

    .line 2
    invoke-super {p0, p1}, Landroid/widget/GridLayout;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public b()V
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;->h:Lc/a/a/a/v/b;

    invoke-virtual {v0}, Lc/a/a/a/v/b;->b()V

    return-void
.end method

.method public c()Z
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/GridLayout;->isOpaque()Z

    move-result v0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;->h:Lc/a/a/a/v/b;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/v/b;->a(Landroid/graphics/Canvas;)V

    goto :goto_b

    .line 3
    :cond_8
    invoke-super {p0, p1}, Landroid/widget/GridLayout;->draw(Landroid/graphics/Canvas;)V

    :goto_b
    return-void
.end method

.method public getCircularRevealOverlayDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;->h:Lc/a/a/a/v/b;

    invoke-virtual {v0}, Lc/a/a/a/v/b;->c()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getCircularRevealScrimColor()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;->h:Lc/a/a/a/v/b;

    invoke-virtual {v0}, Lc/a/a/a/v/b;->d()I

    move-result v0

    return v0
.end method

.method public getRevealInfo()Lc/a/a/a/v/c$e;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;->h:Lc/a/a/a/v/b;

    invoke-virtual {v0}, Lc/a/a/a/v/b;->e()Lc/a/a/a/v/c$e;

    move-result-object v0

    return-object v0
.end method

.method public isOpaque()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;->h:Lc/a/a/a/v/b;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Lc/a/a/a/v/b;->g()Z

    move-result v0

    return v0

    .line 3
    :cond_9
    invoke-super {p0}, Landroid/widget/GridLayout;->isOpaque()Z

    move-result v0

    return v0
.end method

.method public setCircularRevealOverlayDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;->h:Lc/a/a/a/v/b;

    invoke-virtual {v0, p1}, Lc/a/a/a/v/b;->a(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setCircularRevealScrimColor(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;->h:Lc/a/a/a/v/b;

    invoke-virtual {v0, p1}, Lc/a/a/a/v/b;->a(I)V

    return-void
.end method

.method public setRevealInfo(Lc/a/a/a/v/c$e;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/circularreveal/CircularRevealGridLayout;->h:Lc/a/a/a/v/b;

    invoke-virtual {v0, p1}, Lc/a/a/a/v/b;->b(Lc/a/a/a/v/c$e;)V

    return-void
.end method
