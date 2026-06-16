.class public Landroidx/appcompat/widget/AppCompatCheckBox;
.super Landroid/widget/CheckBox;
.source "AppCompatCheckBox.java"

# interfaces
.implements Lb/h/n/k;
.implements Lb/h/m/x;


# instance fields
.field public final h:Lb/b/q/e;

.field public final i:Lb/b/q/d;

.field public final j:Lb/b/q/m;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Landroidx/appcompat/widget/AppCompatCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lb/b/a;->checkboxStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroidx/appcompat/widget/AppCompatCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-static {p1}, Lb/b/q/d0;->b(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p0, p1}, Lb/b/q/b0;->a(Landroid/view/View;Landroid/content/Context;)V

    .line 5
    new-instance p1, Lb/b/q/e;

    invoke-direct {p1, p0}, Lb/b/q/e;-><init>(Landroid/widget/CompoundButton;)V

    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->h:Lb/b/q/e;

    .line 6
    invoke-virtual {p1, p2, p3}, Lb/b/q/e;->a(Landroid/util/AttributeSet;I)V

    .line 7
    new-instance p1, Lb/b/q/d;

    invoke-direct {p1, p0}, Lb/b/q/d;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->i:Lb/b/q/d;

    .line 8
    invoke-virtual {p1, p2, p3}, Lb/b/q/d;->a(Landroid/util/AttributeSet;I)V

    .line 9
    new-instance p1, Lb/b/q/m;

    invoke-direct {p1, p0}, Lb/b/q/m;-><init>(Landroid/widget/TextView;)V

    iput-object p1, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->j:Lb/b/q/m;

    .line 10
    invoke-virtual {p1, p2, p3}, Lb/b/q/m;->a(Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public drawableStateChanged()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/CheckBox;->drawableStateChanged()V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->i:Lb/b/q/d;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0}, Lb/b/q/d;->a()V

    .line 4
    :cond_a
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->j:Lb/b/q/m;

    if-eqz v0, :cond_11

    .line 5
    invoke-virtual {v0}, Lb/b/q/m;->a()V

    :cond_11
    return-void
.end method

.method public getCompoundPaddingLeft()I
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/CheckBox;->getCompoundPaddingLeft()I

    move-result v0

    .line 2
    iget-object v1, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->h:Lb/b/q/e;

    if-eqz v1, :cond_c

    .line 3
    invoke-virtual {v1, v0}, Lb/b/q/e;->a(I)I

    move-result v0

    :cond_c
    return v0
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->i:Lb/b/q/d;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Lb/b/q/d;->b()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->i:Lb/b/q/d;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Lb/b/q/d;->c()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getSupportButtonTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->h:Lb/b/q/e;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Lb/b/q/e;->b()Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public getSupportButtonTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->h:Lb/b/q/e;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {v0}, Lb/b/q/e;->c()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->i:Lb/b/q/d;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1}, Lb/b/q/d;->b(Landroid/graphics/drawable/Drawable;)V

    :cond_a
    return-void
.end method

.method public setBackgroundResource(I)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setBackgroundResource(I)V

    .line 2
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->i:Lb/b/q/d;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1}, Lb/b/q/d;->a(I)V

    :cond_a
    return-void
.end method

.method public setButtonDrawable(I)V
    .registers 3

    .line 4
    invoke-virtual {p0}, Landroid/widget/CheckBox;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatCheckBox;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setButtonDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/CheckBox;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    iget-object p1, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->h:Lb/b/q/e;

    if-eqz p1, :cond_a

    .line 3
    invoke-virtual {p1}, Lb/b/q/e;->d()V

    :cond_a
    return-void
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->i:Lb/b/q/d;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lb/b/q/d;->b(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->i:Lb/b/q/d;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lb/b/q/d;->a(Landroid/graphics/PorterDuff$Mode;)V

    :cond_7
    return-void
.end method

.method public setSupportButtonTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->h:Lb/b/q/e;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lb/b/q/e;->a(Landroid/content/res/ColorStateList;)V

    :cond_7
    return-void
.end method

.method public setSupportButtonTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/widget/AppCompatCheckBox;->h:Lb/b/q/e;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0, p1}, Lb/b/q/e;->a(Landroid/graphics/PorterDuff$Mode;)V

    :cond_7
    return-void
.end method
