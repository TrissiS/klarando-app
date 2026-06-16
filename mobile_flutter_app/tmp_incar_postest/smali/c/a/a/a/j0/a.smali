.class public Lc/a/a/a/j0/a;
.super Landroid/graphics/drawable/Drawable;
.source "RippleDrawableCompat.java"

# interfaces
.implements Lc/a/a/a/l0/p;
.implements Lb/h/f/l/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/j0/a$b;
    }
.end annotation


# instance fields
.field public h:Lc/a/a/a/j0/a$b;


# direct methods
.method public constructor <init>(Lc/a/a/a/j0/a$b;)V
    .registers 2

    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 4
    iput-object p1, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    return-void
.end method

.method public synthetic constructor <init>(Lc/a/a/a/j0/a$b;Lc/a/a/a/j0/a$a;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lc/a/a/a/j0/a;-><init>(Lc/a/a/a/j0/a$b;)V

    return-void
.end method

.method public constructor <init>(Lc/a/a/a/l0/m;)V
    .registers 4

    .line 2
    new-instance v0, Lc/a/a/a/j0/a$b;

    new-instance v1, Lc/a/a/a/l0/h;

    invoke-direct {v1, p1}, Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/m;)V

    invoke-direct {v0, v1}, Lc/a/a/a/j0/a$b;-><init>(Lc/a/a/a/l0/h;)V

    invoke-direct {p0, v0}, Lc/a/a/a/j0/a;-><init>(Lc/a/a/a/j0/a$b;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    iget-boolean v1, v0, Lc/a/a/a/j0/a$b;->b:Z

    if-eqz v1, :cond_b

    .line 2
    iget-object v0, v0, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->draw(Landroid/graphics/Canvas;)V

    :cond_b
    return-void
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    return-object v0
.end method

.method public getOpacity()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    iget-object v0, v0, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->getOpacity()I

    move-result v0

    return v0
.end method

.method public isStateful()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic mutate()Landroid/graphics/drawable/Drawable;
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/j0/a;->mutate()Lc/a/a/a/j0/a;

    return-object p0
.end method

.method public mutate()Lc/a/a/a/j0/a;
    .registers 3

    .line 2
    new-instance v0, Lc/a/a/a/j0/a$b;

    iget-object v1, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    invoke-direct {v0, v1}, Lc/a/a/a/j0/a$b;-><init>(Lc/a/a/a/j0/a$b;)V

    .line 3
    iput-object v0, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    return-object p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    iget-object v0, v0, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public onStateChange([I)Z
    .registers 6

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onStateChange([I)Z

    move-result v0

    .line 2
    iget-object v1, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    iget-object v1, v1, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_10

    const/4 v0, 0x1

    .line 3
    :cond_10
    invoke-static {p1}, Lc/a/a/a/j0/b;->a([I)Z

    move-result p1

    .line 4
    iget-object v1, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    iget-boolean v3, v1, Lc/a/a/a/j0/a$b;->b:Z

    if-eq v3, p1, :cond_1d

    .line 5
    iput-boolean p1, v1, Lc/a/a/a/j0/a$b;->b:Z

    goto :goto_1e

    :cond_1d
    move v2, v0

    :goto_1e
    return v2
.end method

.method public setAlpha(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    iget-object v0, v0, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    iget-object v0, v0, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method

.method public setShapeAppearanceModel(Lc/a/a/a/l0/m;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    iget-object v0, v0, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    return-void
.end method

.method public setTint(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    iget-object v0, v0, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setTint(I)V

    return-void
.end method

.method public setTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    iget-object v0, v0, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/j0/a;->h:Lc/a/a/a/j0/a$b;

    iget-object v0, v0, Lc/a/a/a/j0/a$b;->a:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method
