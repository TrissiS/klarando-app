.class public Lb/s/p0;
.super Ljava/lang/Object;
.source "ViewUtilsBase.java"


# static fields
.field public static b:Ljava/lang/reflect/Method;

.field public static c:Z

.field public static d:Ljava/lang/reflect/Field;

.field public static e:Z


# instance fields
.field public a:[F


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    .line 43
    sget-boolean v0, Lb/s/p0;->c:Z

    if-nez v0, :cond_33

    const/4 v0, 0x1

    .line 44
    :try_start_5
    const-class v1, Landroid/view/View;

    const-string v2, "setFrame"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v3, v0

    const/4 v4, 0x2

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x3

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lb/s/p0;->b:Ljava/lang/reflect/Method;

    .line 45
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_28
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_28} :catch_29

    goto :goto_31

    :catch_29
    move-exception v1

    const-string v2, "ViewUtilsBase"

    const-string v3, "Failed to retrieve setFrame method"

    .line 46
    invoke-static {v2, v3, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 47
    :goto_31
    sput-boolean v0, Lb/s/p0;->c:Z

    :cond_33
    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 4

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_c

    .line 5
    sget v0, Lb/s/p;->save_non_transition_alpha:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_c
    return-void
.end method

.method public a(Landroid/view/View;F)V
    .registers 4

    .line 1
    sget v0, Lb/s/p;->save_non_transition_alpha:I

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_14

    .line 2
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    mul-float v0, v0, p2

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    goto :goto_17

    .line 3
    :cond_14
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    :goto_17
    return-void
.end method

.method public a(Landroid/view/View;I)V
    .registers 6

    .line 35
    sget-boolean v0, Lb/s/p0;->e:Z

    if-nez v0, :cond_1c

    const/4 v0, 0x1

    .line 36
    :try_start_5
    const-class v1, Landroid/view/View;

    const-string v2, "mViewFlags"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lb/s/p0;->d:Ljava/lang/reflect/Field;

    .line 37
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_12
    .catch Ljava/lang/NoSuchFieldException; {:try_start_5 .. :try_end_12} :catch_13

    goto :goto_1a

    :catch_13
    const-string v1, "ViewUtilsBase"

    const-string v2, "fetchViewFlagsField: "

    .line 38
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    :goto_1a
    sput-boolean v0, Lb/s/p0;->e:Z

    .line 40
    :cond_1c
    sget-object v0, Lb/s/p0;->d:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_2c

    .line 41
    :try_start_20
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0

    .line 42
    sget-object v1, Lb/s/p0;->d:Ljava/lang/reflect/Field;

    and-int/lit8 v0, v0, -0xd

    or-int/2addr p2, v0

    invoke-virtual {v1, p1, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_2c
    .catch Ljava/lang/IllegalAccessException; {:try_start_20 .. :try_end_2c} :catch_2c

    :catch_2c
    :cond_2c
    return-void
.end method

.method public a(Landroid/view/View;IIII)V
    .registers 9

    .line 31
    invoke-virtual {p0}, Lb/s/p0;->a()V

    .line 32
    sget-object v0, Lb/s/p0;->b:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_35

    const/4 v1, 0x4

    :try_start_8
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 33
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v1, v2

    const/4 p2, 0x1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v1, p2

    const/4 p2, 0x2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v1, p2

    const/4 p2, 0x3

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v1, p2

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_29
    .catch Ljava/lang/IllegalAccessException; {:try_start_8 .. :try_end_29} :catch_35
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_8 .. :try_end_29} :catch_2a

    goto :goto_35

    :catch_2a
    move-exception p1

    .line 34
    new-instance p2, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    :catch_35
    :cond_35
    :goto_35
    return-void
.end method

.method public a(Landroid/view/View;Landroid/graphics/Matrix;)V
    .registers 12

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz p2, :cond_60

    .line 6
    invoke-virtual {p2}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v3

    if-eqz v3, :cond_d

    goto :goto_60

    .line 7
    :cond_d
    iget-object v3, p0, Lb/s/p0;->a:[F

    if-nez v3, :cond_17

    const/16 v3, 0x9

    new-array v3, v3, [F

    .line 8
    iput-object v3, p0, Lb/s/p0;->a:[F

    .line 9
    :cond_17
    invoke-virtual {p2, v3}, Landroid/graphics/Matrix;->getValues([F)V

    const/4 p2, 0x3

    .line 10
    aget p2, v3, p2

    mul-float v4, p2, p2

    sub-float/2addr v0, v4

    float-to-double v4, v0

    .line 11
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v0, v4

    const/4 v4, 0x0

    aget v5, v3, v4

    cmpg-float v5, v5, v2

    if-gez v5, :cond_2f

    const/4 v5, -0x1

    goto :goto_30

    :cond_2f
    const/4 v5, 0x1

    :goto_30
    int-to-float v5, v5

    mul-float v0, v0, v5

    float-to-double v5, p2

    float-to-double v7, v0

    .line 12
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v5

    double-to-float p2, v5

    .line 13
    aget v4, v3, v4

    div-float/2addr v4, v0

    const/4 v5, 0x4

    .line 14
    aget v5, v3, v5

    div-float/2addr v5, v0

    .line 15
    aget v0, v3, v1

    const/4 v1, 0x5

    .line 16
    aget v1, v3, v1

    .line 17
    invoke-virtual {p1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 18
    invoke-virtual {p1, v2}, Landroid/view/View;->setPivotY(F)V

    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 20
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 21
    invoke-virtual {p1, p2}, Landroid/view/View;->setRotation(F)V

    .line 22
    invoke-virtual {p1, v4}, Landroid/view/View;->setScaleX(F)V

    .line 23
    invoke-virtual {p1, v5}, Landroid/view/View;->setScaleY(F)V

    goto :goto_81

    .line 24
    :cond_60
    :goto_60
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p2

    div-int/2addr p2, v1

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setPivotX(F)V

    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p2

    div-int/2addr p2, v1

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setPivotY(F)V

    .line 26
    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 27
    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 30
    invoke-virtual {p1, v2}, Landroid/view/View;->setRotation(F)V

    :goto_81
    return-void
.end method

.method public b(Landroid/view/View;)F
    .registers 3

    .line 1
    sget v0, Lb/s/p;->save_non_transition_alpha:I

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_14

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result p1

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    div-float/2addr p1, v0

    return p1

    .line 3
    :cond_14
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result p1

    return p1
.end method

.method public b(Landroid/view/View;Landroid/graphics/Matrix;)V
    .registers 5

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 5
    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_1c

    .line 6
    check-cast v0, Landroid/view/View;

    .line 7
    invoke-virtual {p0, v0, p2}, Lb/s/p0;->b(Landroid/view/View;Landroid/graphics/Matrix;)V

    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {p2, v1, v0}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 9
    :cond_1c
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p2, v0, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    .line 11
    invoke-virtual {p1}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-nez v0, :cond_36

    .line 12
    invoke-virtual {p2, p1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    :cond_36
    return-void
.end method

.method public c(Landroid/view/View;)V
    .registers 4

    .line 1
    sget v0, Lb/s/p;->save_non_transition_alpha:I

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_15

    .line 2
    sget v0, Lb/s/p;->save_non_transition_alpha:I

    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_15
    return-void
.end method

.method public c(Landroid/view/View;Landroid/graphics/Matrix;)V
    .registers 5

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 4
    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_1a

    .line 5
    check-cast v0, Landroid/view/View;

    .line 6
    invoke-virtual {p0, v0, p2}, Lb/s/p0;->c(Landroid/view/View;Landroid/graphics/Matrix;)V

    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p2, v1, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 8
    :cond_1a
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {p2, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    .line 10
    invoke-virtual {p1}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v0

    if-nez v0, :cond_41

    .line 11
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 12
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    move-result p1

    if-eqz p1, :cond_41

    .line 13
    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    :cond_41
    return-void
.end method
