.class public Lb/s/b;
.super Ljava/lang/Object;
.source "CanvasUtils.java"


# static fields
.field public static a:Ljava/lang/reflect/Method;

.field public static b:Ljava/lang/reflect/Method;

.field public static c:Z


# direct methods
.method public static a(Landroid/graphics/Canvas;Z)V
    .registers 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SoonBlockedPrivateApi"
        }
    .end annotation

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_7

    goto :goto_67

    :cond_7
    const/16 v1, 0x1d

    if-lt v0, v1, :cond_15

    if-eqz p1, :cond_11

    .line 2
    invoke-virtual {p0}, Landroid/graphics/Canvas;->enableZ()V

    goto :goto_67

    .line 3
    :cond_11
    invoke-virtual {p0}, Landroid/graphics/Canvas;->disableZ()V

    goto :goto_67

    :cond_15
    const/16 v1, 0x1c

    if-eq v0, v1, :cond_68

    .line 4
    sget-boolean v0, Lb/s/b;->c:Z

    const/4 v1, 0x0

    if-nez v0, :cond_3f

    const/4 v0, 0x1

    .line 5
    :try_start_1f
    const-class v2, Landroid/graphics/Canvas;

    const-string v3, "insertReorderBarrier"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lb/s/b;->a:Ljava/lang/reflect/Method;

    .line 6
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 7
    const-class v2, Landroid/graphics/Canvas;

    const-string v3, "insertInorderBarrier"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lb/s/b;->b:Ljava/lang/reflect/Method;

    .line 8
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_3d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1f .. :try_end_3d} :catch_3d

    .line 9
    :catch_3d
    sput-boolean v0, Lb/s/b;->c:Z

    :cond_3f
    if-eqz p1, :cond_4f

    .line 10
    :try_start_41
    sget-object v0, Lb/s/b;->a:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_4f

    .line 11
    sget-object v0, Lb/s/b;->a:Ljava/lang/reflect/Method;

    new-array v2, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4f

    :catch_4d
    move-exception p0

    goto :goto_5d

    :cond_4f
    :goto_4f
    if-nez p1, :cond_67

    .line 12
    sget-object p1, Lb/s/b;->b:Ljava/lang/reflect/Method;

    if-eqz p1, :cond_67

    .line 13
    sget-object p1, Lb/s/b;->b:Ljava/lang/reflect/Method;

    new-array v0, v1, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5c
    .catch Ljava/lang/IllegalAccessException; {:try_start_41 .. :try_end_5c} :catch_67
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_41 .. :try_end_5c} :catch_4d

    goto :goto_67

    .line 14
    :goto_5d
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :catch_67
    :cond_67
    :goto_67
    return-void

    .line 15
    :cond_68
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "This method doesn\'t work on Pie!"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
