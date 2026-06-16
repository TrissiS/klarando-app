.class public final Lb/h/n/c;
.super Ljava/lang/Object;
.source "CompoundButtonCompat.java"


# static fields
.field public static a:Ljava/lang/reflect/Field;

.field public static b:Z


# direct methods
.method public static a(Landroid/widget/CompoundButton;)Landroid/graphics/drawable/Drawable;
    .registers 5

    .line 9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_b

    .line 10
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->getButtonDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    .line 11
    :cond_b
    sget-boolean v0, Lb/h/n/c;->b:Z

    const-string v1, "CompoundButtonCompat"

    if-nez v0, :cond_28

    const/4 v0, 0x1

    .line 12
    :try_start_12
    const-class v2, Landroid/widget/CompoundButton;

    const-string v3, "mButtonDrawable"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Lb/h/n/c;->a:Ljava/lang/reflect/Field;

    .line 13
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldException; {:try_start_12 .. :try_end_1f} :catch_20

    goto :goto_26

    :catch_20
    move-exception v2

    const-string v3, "Failed to retrieve mButtonDrawable field"

    .line 14
    invoke-static {v1, v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 15
    :goto_26
    sput-boolean v0, Lb/h/n/c;->b:Z

    .line 16
    :cond_28
    sget-object v0, Lb/h/n/c;->a:Ljava/lang/reflect/Field;

    const/4 v2, 0x0

    if-eqz v0, :cond_3c

    .line 17
    :try_start_2d
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/drawable/Drawable;
    :try_end_33
    .catch Ljava/lang/IllegalAccessException; {:try_start_2d .. :try_end_33} :catch_34

    return-object p0

    :catch_34
    move-exception p0

    const-string v0, "Failed to get button drawable via reflection"

    .line 18
    invoke-static {v1, v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 19
    sput-object v2, Lb/h/n/c;->a:Ljava/lang/reflect/Field;

    :cond_3c
    return-object v2
.end method

.method public static a(Landroid/widget/CompoundButton;Landroid/content/res/ColorStateList;)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_a

    .line 2
    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_13

    .line 3
    :cond_a
    instance-of v0, p0, Lb/h/n/k;

    if-eqz v0, :cond_13

    .line 4
    check-cast p0, Lb/h/n/k;

    invoke-interface {p0, p1}, Lb/h/n/k;->setSupportButtonTintList(Landroid/content/res/ColorStateList;)V

    :cond_13
    :goto_13
    return-void
.end method

.method public static a(Landroid/widget/CompoundButton;Landroid/graphics/PorterDuff$Mode;)V
    .registers 4

    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_a

    .line 6
    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setButtonTintMode(Landroid/graphics/PorterDuff$Mode;)V

    goto :goto_13

    .line 7
    :cond_a
    instance-of v0, p0, Lb/h/n/k;

    if-eqz v0, :cond_13

    .line 8
    check-cast p0, Lb/h/n/k;

    invoke-interface {p0, p1}, Lb/h/n/k;->setSupportButtonTintMode(Landroid/graphics/PorterDuff$Mode;)V

    :cond_13
    :goto_13
    return-void
.end method

.method public static b(Landroid/widget/CompoundButton;)Landroid/content/res/ColorStateList;
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 2
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->getButtonTintList()Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    .line 3
    :cond_b
    instance-of v0, p0, Lb/h/n/k;

    if-eqz v0, :cond_16

    .line 4
    check-cast p0, Lb/h/n/k;

    invoke-interface {p0}, Lb/h/n/k;->getSupportButtonTintList()Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_16
    const/4 p0, 0x0

    return-object p0
.end method
