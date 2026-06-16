.class public final Lc/c/a/h;
.super Ljava/lang/Object;
.source "TitleBarSupport.java"


# direct methods
.method public static a(Landroid/view/View;I)I
    .registers 4

    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-ge v0, v1, :cond_7

    return p1

    .line 8
    :cond_7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p0

    invoke-static {p1, p0}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result p0

    return p0
.end method

.method public static a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_13

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    .line 3
    :cond_13
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/widget/TextView;I)Landroid/graphics/drawable/Drawable;
    .registers 4

    .line 23
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 24
    invoke-static {p0, p1}, Lc/c/a/h;->a(Landroid/view/View;I)I

    move-result p0

    const/4 p1, 0x3

    if-eq p0, p1, :cond_23

    const/4 v1, 0x5

    if-eq p0, v1, :cond_1f

    const/16 v1, 0x30

    if-eq p0, v1, :cond_1b

    const/16 v1, 0x50

    if-eq p0, v1, :cond_18

    const/4 p0, 0x0

    return-object p0

    .line 25
    :cond_18
    aget-object p0, v0, p1

    return-object p0

    :cond_1b
    const/4 p0, 0x1

    .line 26
    aget-object p0, v0, p0

    return-object p0

    :cond_1f
    const/4 p0, 0x2

    .line 27
    aget-object p0, v0, p0

    return-object p0

    :cond_23
    const/4 p0, 0x0

    .line 28
    aget-object p0, v0, p0

    return-object p0
.end method

.method public static a(Landroid/graphics/drawable/Drawable;I)V
    .registers 3

    if-nez p0, :cond_3

    return-void

    :cond_3
    if-nez p1, :cond_6

    return-void

    .line 15
    :cond_6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 16
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, p1, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public static a(Landroid/graphics/drawable/Drawable;II)V
    .registers 6

    if-nez p0, :cond_3

    return-void

    :cond_3
    const/4 v0, 0x0

    if-gtz p1, :cond_14

    if-gtz p2, :cond_14

    .line 17
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    invoke-virtual {p0, v0, v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    return-void

    :cond_14
    if-lez p1, :cond_1c

    if-lez p2, :cond_1c

    .line 18
    invoke-virtual {p0, v0, v0, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    return-void

    .line 19
    :cond_1c
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 20
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    if-gtz v1, :cond_27

    move v1, p1

    :cond_27
    if-gtz v2, :cond_2a

    move v2, p2

    :cond_2a
    if-lez p1, :cond_33

    mul-int v2, v2, p1

    .line 21
    div-int/2addr v2, v1

    invoke-virtual {p0, v0, v0, p1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_39

    :cond_33
    mul-int v1, v1, p2

    .line 22
    div-int/2addr v1, v2

    invoke-virtual {p0, v0, v0, v1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :goto_39
    return-void
.end method

.method public static a(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 5
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_d

    .line 6
    :cond_a
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_d
    return-void
.end method

.method public static a(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;I)V
    .registers 5

    .line 29
    invoke-static {p0, p2}, Lc/c/a/h;->a(Landroid/view/View;I)I

    move-result p2

    const/4 v0, 0x3

    const/4 v1, 0x0

    if-eq p2, v0, :cond_23

    const/4 v0, 0x5

    if-eq p2, v0, :cond_1f

    const/16 v0, 0x30

    if-eq p2, v0, :cond_1b

    const/16 v0, 0x50

    if-eq p2, v0, :cond_17

    .line 30
    invoke-virtual {p0, v1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_26

    .line 31
    :cond_17
    invoke-virtual {p0, v1, v1, v1, p1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_26

    .line 32
    :cond_1b
    invoke-virtual {p0, v1, p1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_26

    .line 33
    :cond_1f
    invoke-virtual {p0, v1, v1, p1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_26

    .line 34
    :cond_23
    invoke-virtual {p0, p1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :goto_26
    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .registers 4

    .line 9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x11

    if-ge v0, v2, :cond_8

    return v1

    .line 10
    :cond_8
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_18

    const/4 v1, 0x1

    :cond_18
    return v1
.end method

.method public static a(Landroid/widget/TextView;)Z
    .registers 6

    .line 11
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_c

    return v1

    .line 13
    :cond_c
    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 14
    array-length v0, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_13
    if-ge v3, v0, :cond_1d

    aget-object v4, p0, v3

    if-eqz v4, :cond_1a

    return v1

    :cond_1a
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    :cond_1d
    return v2
.end method

.method public static b(Landroid/widget/TextView;I)V
    .registers 3

    if-eqz p1, :cond_18

    const/4 v0, 0x1

    if-eq p1, v0, :cond_12

    const/4 v0, 0x2

    if-eq p1, v0, :cond_c

    const/4 v0, 0x3

    if-eq p1, v0, :cond_c

    goto :goto_1d

    .line 1
    :cond_c
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {p0, v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_1d

    .line 2
    :cond_12
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {p0, v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_1d

    .line 3
    :cond_18
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {p0, v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    :goto_1d
    return-void
.end method
