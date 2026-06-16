.class public final Lnet/nyx/widget/view/DrawableTextView;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "DrawableTextView.java"


# instance fields
.field public m:I

.field public n:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/view/DrawableTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/view/DrawableTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    sget-object p3, Ld/a/d/f;->DrawableTextView:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 5
    sget p2, Ld/a/d/f;->DrawableTextView_drawableWidth:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lnet/nyx/widget/view/DrawableTextView;->m:I

    .line 6
    sget p2, Ld/a/d/f;->DrawableTextView_drawableHeight:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lnet/nyx/widget/view/DrawableTextView;->n:I

    .line 7
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 8
    invoke-virtual {p0}, Lnet/nyx/widget/view/DrawableTextView;->e()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 5

    if-nez p1, :cond_4

    const/4 p1, 0x0

    return-object p1

    .line 1
    :cond_4
    iget v0, p0, Lnet/nyx/widget/view/DrawableTextView;->m:I

    if-eqz v0, :cond_11

    iget v1, p0, Lnet/nyx/widget/view/DrawableTextView;->n:I

    if-nez v1, :cond_d

    goto :goto_11

    :cond_d
    const/4 v2, 0x0

    .line 2
    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_11
    :goto_11
    return-object p1
.end method

.method public final e()V
    .registers 7

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/DrawableTextView;->m:I

    if-eqz v0, :cond_55

    iget v0, p0, Lnet/nyx/widget/view/DrawableTextView;->n:I

    if-nez v0, :cond_9

    goto :goto_55

    .line 2
    :cond_9
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    .line 3
    aget-object v2, v0, v1

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-nez v2, :cond_3a

    aget-object v2, v0, v5

    if-eqz v2, :cond_1a

    goto :goto_3a

    .line 4
    :cond_1a
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 5
    aget-object v1, v0, v1

    invoke-virtual {p0, v1}, Lnet/nyx/widget/view/DrawableTextView;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    aget-object v2, v0, v5

    .line 6
    invoke-virtual {p0, v2}, Lnet/nyx/widget/view/DrawableTextView;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    aget-object v4, v0, v4

    .line 7
    invoke-virtual {p0, v4}, Lnet/nyx/widget/view/DrawableTextView;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    aget-object v0, v0, v3

    .line 8
    invoke-virtual {p0, v0}, Lnet/nyx/widget/view/DrawableTextView;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 9
    invoke-super {p0, v1, v2, v4, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 10
    :cond_3a
    :goto_3a
    aget-object v1, v0, v1

    invoke-virtual {p0, v1}, Lnet/nyx/widget/view/DrawableTextView;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    aget-object v2, v0, v5

    .line 11
    invoke-virtual {p0, v2}, Lnet/nyx/widget/view/DrawableTextView;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    aget-object v4, v0, v4

    .line 12
    invoke-virtual {p0, v4}, Lnet/nyx/widget/view/DrawableTextView;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    aget-object v0, v0, v3

    .line 13
    invoke-virtual {p0, v0}, Lnet/nyx/widget/view/DrawableTextView;->a(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 14
    invoke-super {p0, v1, v2, v4, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_55
    :goto_55
    return-void
.end method

.method public setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2
    invoke-virtual {p0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result p1

    if-nez p1, :cond_a

    return-void

    .line 3
    :cond_a
    invoke-virtual {p0}, Lnet/nyx/widget/view/DrawableTextView;->e()V

    return-void
.end method

.method public setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2
    invoke-virtual {p0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result p1

    if-nez p1, :cond_a

    return-void

    .line 3
    :cond_a
    invoke-virtual {p0}, Lnet/nyx/widget/view/DrawableTextView;->e()V

    return-void
.end method

.method public setDrawableHeight(I)V
    .registers 2

    .line 1
    iput p1, p0, Lnet/nyx/widget/view/DrawableTextView;->n:I

    .line 2
    invoke-virtual {p0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result p1

    if-nez p1, :cond_9

    return-void

    .line 3
    :cond_9
    invoke-virtual {p0}, Lnet/nyx/widget/view/DrawableTextView;->e()V

    return-void
.end method

.method public setDrawableWidth(I)V
    .registers 2

    .line 1
    iput p1, p0, Lnet/nyx/widget/view/DrawableTextView;->m:I

    .line 2
    invoke-virtual {p0}, Landroid/widget/TextView;->isAttachedToWindow()Z

    move-result p1

    if-nez p1, :cond_9

    return-void

    .line 3
    :cond_9
    invoke-virtual {p0}, Lnet/nyx/widget/view/DrawableTextView;->e()V

    return-void
.end method
