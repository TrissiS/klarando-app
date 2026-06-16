.class public Lb/s/k;
.super Ljava/lang/Object;
.source "ImageViewUtils.java"


# static fields
.field public static a:Z = true

.field public static b:Ljava/lang/reflect/Field;

.field public static c:Z


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public static a()V
    .registers 3

    .line 20
    sget-boolean v0, Lb/s/k;->c:Z

    if-nez v0, :cond_14

    const/4 v0, 0x1

    .line 21
    :try_start_5
    const-class v1, Landroid/widget/ImageView;

    const-string v2, "mDrawMatrix"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lb/s/k;->b:Ljava/lang/reflect/Field;

    .line 22
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_12
    .catch Ljava/lang/NoSuchFieldException; {:try_start_5 .. :try_end_12} :catch_12

    .line 23
    :catch_12
    sput-boolean v0, Lb/s/k;->c:Z

    :cond_14
    return-void
.end method

.method public static a(Landroid/widget/ImageView;Landroid/graphics/Matrix;)V
    .registers 6

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_a

    .line 2
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->animateTransform(Landroid/graphics/Matrix;)V

    goto :goto_75

    :cond_a
    const/4 v1, 0x0

    if-nez p1, :cond_36

    .line 3
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_75

    .line 4
    invoke-virtual {p0}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-virtual {p0}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result v2

    sub-int/2addr v0, v2

    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageView;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    .line 6
    invoke-virtual {p1, v1, v1, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 7
    invoke-virtual {p0}, Landroid/widget/ImageView;->invalidate()V

    goto :goto_75

    :cond_36
    const/16 v2, 0x15

    if-lt v0, v2, :cond_3e

    .line 8
    invoke-static {p0, p1}, Lb/s/k;->b(Landroid/widget/ImageView;Landroid/graphics/Matrix;)V

    goto :goto_75

    .line 9
    :cond_3e
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_75

    .line 10
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    .line 11
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    .line 12
    invoke-virtual {v0, v1, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    const/4 v0, 0x0

    .line 13
    invoke-static {}, Lb/s/k;->a()V

    .line 14
    sget-object v1, Lb/s/k;->b:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_6d

    .line 15
    :try_start_57
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Matrix;
    :try_end_5d
    .catch Ljava/lang/IllegalAccessException; {:try_start_57 .. :try_end_5d} :catch_6c

    if-nez v1, :cond_6a

    .line 16
    :try_start_5f
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V
    :try_end_64
    .catch Ljava/lang/IllegalAccessException; {:try_start_5f .. :try_end_64} :catch_6a

    .line 17
    :try_start_64
    sget-object v1, Lb/s/k;->b:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p0, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_69
    .catch Ljava/lang/IllegalAccessException; {:try_start_64 .. :try_end_69} :catch_6c

    goto :goto_6d

    :catch_6a
    :cond_6a
    move-object v0, v1

    goto :goto_6d

    :catch_6c
    nop

    :cond_6d
    :goto_6d
    if-eqz v0, :cond_72

    .line 18
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 19
    :cond_72
    invoke-virtual {p0}, Landroid/widget/ImageView;->invalidate()V

    :cond_75
    :goto_75
    return-void
.end method

.method public static b(Landroid/widget/ImageView;Landroid/graphics/Matrix;)V
    .registers 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    sget-boolean v0, Lb/s/k;->a:Z

    if-eqz v0, :cond_b

    .line 2
    :try_start_4
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->animateTransform(Landroid/graphics/Matrix;)V
    :try_end_7
    .catch Ljava/lang/NoSuchMethodError; {:try_start_4 .. :try_end_7} :catch_8

    goto :goto_b

    :catch_8
    const/4 p0, 0x0

    .line 3
    sput-boolean p0, Lb/s/k;->a:Z

    :cond_b
    :goto_b
    return-void
.end method
