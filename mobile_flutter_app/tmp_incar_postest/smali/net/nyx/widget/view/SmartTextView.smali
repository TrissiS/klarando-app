.class public final Lnet/nyx/widget/view/SmartTextView;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "SmartTextView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/view/SmartTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const v0, 0x1010084

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/view/SmartTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-virtual {p0}, Lnet/nyx/widget/view/SmartTextView;->f()V

    return-void
.end method


# virtual methods
.method public final e()Z
    .registers 7

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_c

    return v1

    .line 2
    :cond_c
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 3
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 4
    array-length v3, v0

    const/4 v4, 0x0

    :goto_16
    if-ge v4, v3, :cond_20

    aget-object v5, v0, v4

    if-eqz v5, :cond_1d

    return v1

    :cond_1d
    add-int/lit8 v4, v4, 0x1

    goto :goto_16

    .line 5
    :cond_20
    array-length v0, v2

    const/4 v3, 0x0

    :goto_22
    if-ge v3, v0, :cond_2c

    aget-object v4, v2, v3

    if-eqz v4, :cond_29

    return v1

    :cond_29
    add-int/lit8 v3, v3, 0x1

    goto :goto_22

    :cond_2c
    const/4 v0, 0x1

    return v0
.end method

.method public final f()V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lnet/nyx/widget/view/SmartTextView;->e()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_12

    .line 2
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void

    .line 3
    :cond_12
    invoke-virtual {p0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_1c
    return-void
.end method

.method public setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/view/SmartTextView;->f()V

    return-void
.end method

.method public setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/view/SmartTextView;->f()V

    return-void
.end method

.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .registers 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/view/SmartTextView;->f()V

    return-void
.end method
