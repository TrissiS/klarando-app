.class public final Lb/h/m/i;
.super Ljava/lang/Object;
.source "MenuItemCompat.java"


# direct methods
.method public static a(Landroid/view/MenuItem;Lb/h/m/b;)Landroid/view/MenuItem;
    .registers 3

    .line 1
    instance-of v0, p0, Lb/h/g/a/b;

    if-eqz v0, :cond_b

    .line 2
    check-cast p0, Lb/h/g/a/b;

    invoke-interface {p0, p1}, Lb/h/g/a/b;->a(Lb/h/m/b;)Lb/h/g/a/b;

    move-result-object p0

    return-object p0

    :cond_b
    const-string p1, "MenuItemCompat"

    const-string v0, "setActionProvider: item does not implement SupportMenuItem; ignoring"

    .line 3
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0
.end method

.method public static a(Landroid/view/MenuItem;CI)V
    .registers 5

    .line 8
    instance-of v0, p0, Lb/h/g/a/b;

    if-eqz v0, :cond_a

    .line 9
    check-cast p0, Lb/h/g/a/b;

    invoke-interface {p0, p1, p2}, Lb/h/g/a/b;->setAlphabeticShortcut(CI)Landroid/view/MenuItem;

    goto :goto_13

    .line 10
    :cond_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_13

    .line 11
    invoke-interface {p0, p1, p2}, Landroid/view/MenuItem;->setAlphabeticShortcut(CI)Landroid/view/MenuItem;

    :cond_13
    :goto_13
    return-void
.end method

.method public static a(Landroid/view/MenuItem;Landroid/content/res/ColorStateList;)V
    .registers 4

    .line 12
    instance-of v0, p0, Lb/h/g/a/b;

    if-eqz v0, :cond_a

    .line 13
    check-cast p0, Lb/h/g/a/b;

    invoke-interface {p0, p1}, Lb/h/g/a/b;->setIconTintList(Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;

    goto :goto_13

    .line 14
    :cond_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_13

    .line 15
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setIconTintList(Landroid/content/res/ColorStateList;)Landroid/view/MenuItem;

    :cond_13
    :goto_13
    return-void
.end method

.method public static a(Landroid/view/MenuItem;Landroid/graphics/PorterDuff$Mode;)V
    .registers 4

    .line 16
    instance-of v0, p0, Lb/h/g/a/b;

    if-eqz v0, :cond_a

    .line 17
    check-cast p0, Lb/h/g/a/b;

    invoke-interface {p0, p1}, Lb/h/g/a/b;->setIconTintMode(Landroid/graphics/PorterDuff$Mode;)Landroid/view/MenuItem;

    goto :goto_13

    .line 18
    :cond_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_13

    .line 19
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setIconTintMode(Landroid/graphics/PorterDuff$Mode;)Landroid/view/MenuItem;

    :cond_13
    :goto_13
    return-void
.end method

.method public static a(Landroid/view/MenuItem;Ljava/lang/CharSequence;)V
    .registers 4

    .line 4
    instance-of v0, p0, Lb/h/g/a/b;

    if-eqz v0, :cond_a

    .line 5
    check-cast p0, Lb/h/g/a/b;

    invoke-interface {p0, p1}, Lb/h/g/a/b;->setContentDescription(Ljava/lang/CharSequence;)Lb/h/g/a/b;

    goto :goto_13

    .line 6
    :cond_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_13

    .line 7
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setContentDescription(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_13
    :goto_13
    return-void
.end method

.method public static b(Landroid/view/MenuItem;CI)V
    .registers 5

    .line 5
    instance-of v0, p0, Lb/h/g/a/b;

    if-eqz v0, :cond_a

    .line 6
    check-cast p0, Lb/h/g/a/b;

    invoke-interface {p0, p1, p2}, Lb/h/g/a/b;->setNumericShortcut(CI)Landroid/view/MenuItem;

    goto :goto_13

    .line 7
    :cond_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_13

    .line 8
    invoke-interface {p0, p1, p2}, Landroid/view/MenuItem;->setNumericShortcut(CI)Landroid/view/MenuItem;

    :cond_13
    :goto_13
    return-void
.end method

.method public static b(Landroid/view/MenuItem;Ljava/lang/CharSequence;)V
    .registers 4

    .line 1
    instance-of v0, p0, Lb/h/g/a/b;

    if-eqz v0, :cond_a

    .line 2
    check-cast p0, Lb/h/g/a/b;

    invoke-interface {p0, p1}, Lb/h/g/a/b;->setTooltipText(Ljava/lang/CharSequence;)Lb/h/g/a/b;

    goto :goto_13

    .line 3
    :cond_a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_13

    .line 4
    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setTooltipText(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_13
    :goto_13
    return-void
.end method
