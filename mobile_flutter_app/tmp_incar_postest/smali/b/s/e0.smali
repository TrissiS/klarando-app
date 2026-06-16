.class public Lb/s/e0;
.super Ljava/lang/Object;
.source "ViewGroupUtils.java"


# static fields
.field public static a:Z = true

.field public static b:Ljava/lang/reflect/Method;

.field public static c:Z


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public static a(Landroid/view/ViewGroup;I)I
    .registers 9

    .line 7
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_b

    .line 8
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildDrawingOrder(I)I

    move-result p0

    return p0

    .line 9
    :cond_b
    sget-boolean v0, Lb/s/e0;->c:Z

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-nez v0, :cond_2b

    .line 10
    :try_start_12
    const-class v0, Landroid/view/ViewGroup;

    const-string v4, "getChildDrawingOrder"

    new-array v5, v2, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v1

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v3

    invoke-virtual {v0, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lb/s/e0;->b:Ljava/lang/reflect/Method;

    .line 11
    invoke-virtual {v0, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_29
    .catch Ljava/lang/NoSuchMethodException; {:try_start_12 .. :try_end_29} :catch_29

    .line 12
    :catch_29
    sput-boolean v3, Lb/s/e0;->c:Z

    .line 13
    :cond_2b
    sget-object v0, Lb/s/e0;->b:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_4c

    :try_start_2f
    new-array v2, v2, [Ljava/lang/Object;

    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, v3

    .line 15
    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_4b
    .catch Ljava/lang/IllegalAccessException; {:try_start_2f .. :try_end_4b} :catch_4c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2f .. :try_end_4b} :catch_4c

    return p0

    :catch_4c
    :cond_4c
    return p1
.end method

.method public static a(Landroid/view/ViewGroup;)Lb/s/d0;
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_c

    .line 2
    new-instance v0, Lb/s/c0;

    invoke-direct {v0, p0}, Lb/s/c0;-><init>(Landroid/view/ViewGroup;)V

    return-object v0

    .line 3
    :cond_c
    invoke-static {p0}, Lb/s/b0;->a(Landroid/view/ViewGroup;)Lb/s/b0;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/view/ViewGroup;Z)V
    .registers 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 4
    sget-boolean v0, Lb/s/e0;->a:Z

    if-eqz v0, :cond_b

    .line 5
    :try_start_4
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->suppressLayout(Z)V
    :try_end_7
    .catch Ljava/lang/NoSuchMethodError; {:try_start_4 .. :try_end_7} :catch_8

    goto :goto_b

    :catch_8
    const/4 p0, 0x0

    .line 6
    sput-boolean p0, Lb/s/e0;->a:Z

    :cond_b
    :goto_b
    return-void
.end method

.method public static b(Landroid/view/ViewGroup;Z)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_a

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->suppressLayout(Z)V

    goto :goto_15

    :cond_a
    const/16 v1, 0x12

    if-lt v0, v1, :cond_12

    .line 3
    invoke-static {p0, p1}, Lb/s/e0;->a(Landroid/view/ViewGroup;Z)V

    goto :goto_15

    .line 4
    :cond_12
    invoke-static {p0, p1}, Lb/s/f0;->a(Landroid/view/ViewGroup;Z)V

    :goto_15
    return-void
.end method
